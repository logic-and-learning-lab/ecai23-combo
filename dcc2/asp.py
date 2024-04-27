import os
import re
import sys
import clingo
import operator
import numbers
import pkg_resources
from . core import *
from collections import OrderedDict
from clingo import Function, Number, Tuple_
import clingo.script
clingo.script.enable_python()

ALAN_FILE = pkg_resources.resource_string(__name__, "lp/alan.pl").decode()

NUM_OF_LITERALS = """
    #external size_in_literals(n).
    :- size_in_literals(n), #sum{K+1,Clause : body_size(Clause,K)} != n."""

GROUNDER_PROG = """\
            #show v_var/2.
            #show c_var/2.
            c_val(0..num_c_vals-1).
            v_val(0..num_v_vals-1).
            1 {c_var(V,X): c_val(X)} 1:- V=0..num_c_vars-1.
            1 {v_var(V,X): v_val(X)} 1:- V=0..num_v_vars-1.
            :- c_val(X), #count{I : c_var(I,X)} > 1.
            :- v_val(X), #count{I : v_var(I,X)} > 1."""

def arg_to_symbol(arg):
    if isinstance(arg, tuple):
        return Tuple_(tuple(arg_to_symbol(a) for a in arg))
    if isinstance(arg, numbers.Number):
        return Number(arg)
    if isinstance(arg, str):
        return Function(arg)
    assert False, f'Unhandled argtype({type(arg)}) in aspsolver.py arg_to_symbol()'

def atom_to_symbol(pred, args):
    xs = tuple(arg_to_symbol(arg) for arg in args)
    return Function(name = pred, arguments = xs)

# AC: When grounding constraint rules, we only care about the vars and the constraints, not the actual literals
def grounding_hash(body, all_vars):
    cons = set()
    for lit in body:
        if lit.meta:
            cons.add((lit.predicate, lit.arguments))
    return hash((frozenset(all_vars), frozenset(cons)))

class ClingoGrounder():

    def __init__(self, max_rules, max_vars):
        self.seen_assignments = {}
        self.max_rules = max_rules
        self.max_vars = max_vars

    def find_bindings(self, rule):
        _, body = rule
        all_vars = all_vars_in_rule(body)
        if len(all_vars) == 0:
            return [{}]

        k = grounding_hash(body, all_vars)
        if k in self.seen_assignments:
            return self.seen_assignments[k]

        # map each clause_var and var_var in the program to an integer
        c_vars = {v:i for i,v in enumerate(var for var in all_vars if var.type == 'Clause')}
        v_vars = {v:i for i,v in enumerate(var for var in all_vars if var.type == 'Variable')}

        # transpose for return lookup
        c_vars_ = {v:k for k,v in c_vars.items()}
        v_vars_ = {v:k for k,v in v_vars.items()}

        c_var_count = len(c_vars)
        v_var_count = len(v_vars)
        if c_var_count == 0 and v_var_count == 0:
            return [{}]

        prog = []
        prog.append(GROUNDER_PROG)
        prog.append(f'#const num_c_vars={c_var_count}.')
        prog.append(f'#const num_c_vals={self.max_rules}.')
        prog.append(f'#const num_v_vars={v_var_count}.')
        prog.append(f'#const num_v_vals={self.max_vars}.')

         # add constraints to the ASP program based on the AST thing
        for lit in body:
            if not lit.meta:
                continue
            if lit.predicate == '==':
                var, val = lit.arguments
                var = v_vars[var]
                prog.append(f':- not v_var({var},{val}).')
            elif lit.predicate == '>=':
                var, val = lit.arguments
                var = c_vars[var]
                for i in range(val):
                    prog.append(f':- c_var({var},{i}).')
            elif lit.predicate == '<':
                var1 = c_vars[lit.arguments[0]]
                var2 = c_vars[lit.arguments[1]]
                prog.append(f':- c_var({var1},Val1), c_var({var2},Val2), Val1>=Val2.')

        # print('\n'.join(prog))
        solver = clingo.Control()
        solver.configuration.solve.models = 0
        solver.add('base', [], '\n'.join(prog))
        solver.ground([("base", [])])

        out = []

        def on_model(m):
            xs = m.symbols(shown = True)
            # map a variable to a program variable
            assignment = {}
            for x in xs:
                var = x.arguments[0].number
                val = x.arguments[1].number
                if x.name == 'c_var':
                    assignment[c_vars_[var]] = val
                elif x.name == 'v_var':
                    assignment[v_vars_[var]] = val
            out.append(assignment)

        solver.solve(on_model=on_model)
        self.seen_assignments[k] = out
        return out

def get_hspace(settings, formatting):
    solver = clingo.Control(settings.clingo_args)
    ClingoSolver.load_alan(settings, solver)
    solver.configuration.solve.models = settings.hspace
    num_models=0
    def on_model(m):
        nonlocal num_models
        num_models+=1
        formatting(num_models, m.symbols(shown = True))
    solver.solve(on_model=on_model)

class ClingoSolver():

    def __init__(self, settings, bounds):
        self.last_size = None
        self.seen_symbols = {}
        self.solver = clingo.Control(settings.clingo_args)

        # add ALAN
        self.solver.add('base', [], ALAN_FILE)

        # add bias
        bias = []
        bias.append(f'max_clauses({bounds.max_rules}).')

        if settings.recursion:
            if bounds.rec.sat:
                # min rules (-1 because of zero indexing)
                bias.append(f':- recursive, not clause({bounds.rec.min_rules - 1}).')
                # max rules
                bias.append(f':- recursive, clause({bounds.rec.max_rules}).')
            else:
                bias.append(f':- recursive.')

        if bounds.non_rec.sat:
            # set min rule size when recursive
            if settings.WITH_MIN_RULE_SIZE and bounds.non_rec.min_rule_size > 1:
                for i in range(1, bounds.non_rec.min_rule_size-1):
                    print(f':- not recursive, body_size(_,{i}).')
                    bias.append(f':- not recursive, body_size(_,{i}).')
                bias.append(f'has_big_enough_rule:- body_size(_,K), K>= {bounds.non_rec.exists_min_rule_size-1}.')
                bias.append(f':- not has_big_enough_rule.')

            if bounds.non_rec.max_rules < bounds.max_rules:
                bias.append(f':- not pi_or_rec, clause({bounds.non_rec.max_rules}).')
        else:
            bias.append(f':- not pi_or_rec.')

        # print('\n'.join(bias))

        with open(settings.bias_file) as f:
            bias.append(f.read())

        # print('\n'.join(bias))
        self.solver.add('base', [], '\n'.join(bias))
        self.solver.ground([('base', [])])
        self.solver.add('number_of_literals', ['n'], NUM_OF_LITERALS)

    def get_model(self):
        with self.solver.solve(yield_ = True) as handle:
            m = handle.model()
            if m:
                return m.symbols(shown = True)
            return m

    def update_number_of_literals(self, size):
        # release atoms already assigned
        if self.last_size != None:
            symbol = clingo.Function('size_in_literals', [clingo.Number(self.last_size)])
            self.solver.release_external(symbol)

        # set new size
        self.last_size = size

        # ground new size
        self.solver.ground([('number_of_literals', [clingo.Number(size)])])

        # assign new size
        symbol = clingo.Function('size_in_literals', [clingo.Number(size)])
        self.solver.assign_external(symbol, True)

    def gen_symbol(self, literal, backend):
        (sign, pred, args) = literal
        k = hash(literal)
        if k in self.seen_symbols:
            symbol = self.seen_symbols[k]
        else:
            symbol = backend.add_atom(atom_to_symbol(pred, args))
            self.seen_symbols[k] = symbol
        return symbol

    def add_ground_clauses(self, clauses):
        with self.solver.backend() as backend:
            for (head, body) in clauses:
                head_literal = []
                if head:
                    head_literal = [self.gen_symbol(head, backend)]
                body_lits = []
                for literal in body:
                    (sign, _pred, _args) = literal
                    symbol = self.gen_symbol(literal, backend)
                    body_lits.append(symbol if sign else -symbol)
                backend.add_rule(head_literal, body_lits)