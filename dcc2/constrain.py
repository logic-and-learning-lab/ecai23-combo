import operator
from collections import defaultdict
import pkg_resources
from . core import *
from clingo import Function, Number, Tuple_
import clingo.script
clingo.script.enable_python()

GROUND_BOUNDS = pkg_resources.resource_string(__name__, "lp/ground-bounds.pl").decode()

def alldiff(args):
    return Literal('AllDifferent', args, meta=True)

def lt(a, b):
    return Literal('<', (a,b), meta=True)

def eq(a, b):
    return Literal('==', (a,b), meta=True)

def gteq(a, b):
    return Literal('>=', (a,b), meta=True)

def vo_clause(variable):
    return ConstVar(f'C{variable}', 'Clause')

def vo_variable(variable):
    return ConstVar(f'{variable}', 'Variable')

def body_size_literal(clause_var, body_size):
    return Literal('body_size', (clause_var, body_size))

def make_literal_handle(literal):
    return f'{literal.predicate}({".".join(literal.arguments)})'

def deduce_min_rule(rule):
    if rule_is_invented(rule):
        head, body = rule
        # inv symbols are inv1, inv2, etc ...
        min_rule = int(head.predicate[-1])
        if rule_is_recursive(rule):
            min_rule += 1
        return min_rule

    if rule_is_recursive(rule):
        return 1

    return 0

def deduce_ordering(ordered_rules):
    if len(ordered_rules) == 1:
        return []

    prog = []
    for i, rule in enumerate(ordered_rules):
        head, body = rule
        level = 0
        if rule_is_invented(rule):
            level = int(head.predicate[-1])
        x = f'rule({i},{head.predicate},{len(body)},{int(rule_is_recursive(rule))},{level}). '
        prog.append(x)
    prog.append(GROUND_BOUNDS)
    # TODO: CHECK THESE VALUES IN CACHE!!!
    prog = '\n'.join(prog)
    solver = clingo.Control()
    solver.add('base', [], prog)
    solver.ground([("base", [])])
    out = []
    with solver.solve(yield_=True) as handle:
        for m in handle:
            for atom in m.symbols(shown=True):
                a = atom.arguments[0]
                b = atom.arguments[1]
                out.append((a,b))
    return out

class Constrain:
    def __init__(self, tracker):
        self.seen_rule_handle = {}
        self.added_rules = set()
        self.cached_before = tracker.cached_before
        self.cached_min_rule = tracker.cached_min_rule

    def cache_bounds(self, rules):
        for rule in rules:
            if rule not in self.cached_min_rule:
                self.cached_min_rule[rule] = deduce_min_rule(rule)

        ordered_rules = tuple(sorted(rules))
        if ordered_rules not in self.cached_before:
            self.cached_before[ordered_rules] = deduce_ordering(ordered_rules)

    def min_rule_literal(self, rule, rule_var):
        min_rule = self.cached_min_rule[rule]
        return gteq(rule_var, min_rule)

    def before_literals(self, rules):
        if len(rules) == 1:
            return []
        ordered_rules = tuple(sorted(rules))
        if ordered_rules not in self.cached_before:
            self.cached_before[ordered_rules] = deduce_ordering(ordered_rules)
        before = self.cached_before[ordered_rules]
        for r1, r2 in before:
            yield lt(vo_clause(r1), vo_clause(r2))

    def make_rule_handle(self, clause):
        if clause in self.seen_rule_handle:
            return self.seen_rule_handle[clause]
        head, body = clause
        head = make_literal_handle(head)
        body_literals = sorted(body, key = operator.attrgetter('predicate'))
        body = ','.join(make_literal_handle(literal) for literal in body_literals)
        clause_handle = f'{head}:- {body}'
        self.seen_rule_handle[clause] = clause_handle
        return clause_handle

    def make_clause_inclusion_rule(self, clause, clause_handle):
        if clause_handle in self.added_rules:
            return
            yield

        self.added_rules.add(clause_handle)

        head, body = clause
        clause_var = vo_clause('l')
        literals = []
        literals.append(Literal('head_literal', (clause_var, head.predicate, head.arity, tuple(vo_variable(v) for v in head.arguments))))

        for body_literal in body:
            literals.append(Literal('body_literal', (clause_var, body_literal.predicate, body_literal.arity, tuple(vo_variable(v) for v in body_literal.arguments))))

        literals.append(self.min_rule_literal(clause, clause_var))

        for idx, var in enumerate(head.arguments):
            literals.append(eq(vo_variable(var), idx))

        yield (Literal('included_clause', (clause_handle, clause_var)), tuple(literals))

    def elimination_constraint(self, rules):
        literals = []

        ordered_rules = sorted(rules)
        for clause_number, clause in enumerate(ordered_rules):
            clause_var = vo_clause(clause_number)
            head, body = clause
            clause_handle = self.make_rule_handle(clause)
            yield from self.make_clause_inclusion_rule(clause, clause_handle)
            literals.append(Literal('included_clause', (clause_handle, )))
            literals.append(self.min_rule_literal(clause, clause_var))

        literals.extend(self.before_literals(ordered_rules))

        yield (None, tuple(literals))

    def generalisation_constraint(self, rules):
        ordered_rules = sorted(rules)

        literals = []
        for clause_number, clause in enumerate(ordered_rules):
            _head, body = clause
            clause_handle = self.make_rule_handle(clause)
            yield from self.make_clause_inclusion_rule(clause, clause_handle)
            clause_var = vo_clause(clause_number)
            literals.append(Literal('included_clause', (clause_handle, clause_var)))
            literals.append(body_size_literal(clause_var, len(body)))
            literals.append(self.min_rule_literal(clause, clause_var))

        literals.extend(self.before_literals(ordered_rules))

        # ensure that each clause_var is ground to a unique value
        if len(rules) > 1:
            literals.append(alldiff(tuple(vo_clause(c) for c in range(len(ordered_rules)))))

        yield (None, tuple(literals))

    def specialisation_constraint(self, rules):
        literals = []
        ordered_rules = sorted(rules)

        for clause_number, clause in enumerate(ordered_rules):
            clause_handle = self.make_rule_handle(clause)
            # yield from self.make_clause_inclusion_rule(clause, min_clause[clause], clause_handle)
            yield from self.make_clause_inclusion_rule(clause, clause_handle)
            clause_var = vo_clause(clause_number)
            literals.append(Literal('included_clause', (clause_handle, clause_var)))
            literals.append(self.min_rule_literal(clause, clause_var))

        literals.extend(self.before_literals(ordered_rules))

        num_clauses = len(rules)
        # ensure that each clause_var is ground to a unique value
        if num_clauses > 1:
            literals.append(alldiff(tuple(vo_clause(c) for c in range(num_clauses))))
        literals.append(Literal('clause', (num_clauses, ), positive = False))

        yield (None, tuple(literals))

    def subsumption_constraint(self, rule1):
        # prune all rules that rule1 subsumes, where k is the number of literals in the body of rule1
        # :- seen(rule1,C0), seen(rule1,C1), C0 != C1, body_size(C0,k)
        _head1, body1 = rule1
        rule1_handle = self.make_rule_handle(rule1)
        yield from self.make_clause_inclusion_rule(rule1, rule1_handle)
        v1 = vo_clause(0)
        v2 = vo_clause(1)
        literals = []
        literals.append(body_size_literal(v1, len(body1)))
        literals.append(Literal('included_clause', (rule1_handle, v1)))
        literals.append(Literal('included_clause', (rule1_handle, v2)))
        literals.append(alldiff((v1, v2)))
        yield None, tuple(literals)

    def subsumption_constraint_pairs(self, rule1, rule2):
        # if rule1 subsumes rule2 then build the following constraint where k is the body size of rule1
        # :- seen(rule1,C0), seen(rule2,C1), C0 != C1, body_size(C0,k)
        _head1, body1 = rule1
        literals = []
        rule1_handle = self.make_rule_handle(rule1)
        rule2_handle = self.make_rule_handle(rule2)
        yield from self.make_clause_inclusion_rule(rule1, rule1_handle)
        yield from self.make_clause_inclusion_rule(rule2, rule2_handle)
        v1 = vo_clause(0)
        v2 = vo_clause(1)
        literals = []
        literals.append(body_size_literal(v1, len(body1)))
        literals.append(Literal('included_clause', (rule1_handle, v1)))
        literals.append(Literal('included_clause', (rule2_handle, v2)))
        literals.append(alldiff((v1, v2)))
        literals.append(self.min_rule_literal(rule1, v1))
        literals.append(self.min_rule_literal(rule2, v2))
        yield None, tuple(literals)

    # AC: THIS CONSTRAINT DUPLICATES THE GENERALISATION CONSTRAINT AND NEEDS REFACTORING
    def redundant_literal_constraint(self, clause):
        _head, body = clause
        clause_handle = self.make_rule_handle(clause)
        yield from self.make_clause_inclusion_rule(clause, clause_handle)
        literals = []
        clause_var = vo_clause(0)
        literals.append(Literal('included_clause', (clause_handle, clause_var)))
        literals.append(body_size_literal(clause_var, len(body)))
        literals.append(self.min_rule_literal(clause, clause_var))
        yield (None, tuple(literals))

    # Jk: AC, I cleaned this up a bit, but this reorg is for you. Godspeed!
    # AC: @JK, I made another pass through it. It was tough. I will try again once we have the whole codebase tidied.
    # def redundancy_constraint(self, program, before = {}, min_clause = defaultdict(lambda: 0)):
    def redundancy_constraint(self, program):
        lits_num_clauses = defaultdict(int)
        lits_num_recursive_clauses = defaultdict(int)
        for clause in program:
            (head, _) = clause
            lits_num_clauses[head.predicate] += 1
            if rule_is_recursive(clause):
                lits_num_recursive_clauses[head.predicate] += 1

        recursively_called = set()
        while True:
            something_added = False
            for clause in program:
                (head, body) = clause
                is_rec = rule_is_recursive(clause)
                for body_literal in body:
                    if body_literal.predicate not in lits_num_clauses:
                        continue
                    if (body_literal.predicate != head.predicate and is_rec) or (head.predicate in recursively_called):
                        something_added |= not body_literal.predicate in recursively_called
                        recursively_called.add(body_literal.predicate)
            if not something_added:
                break

        for lit in lits_num_clauses.keys() - recursively_called:
            literals = []

            ordered_rules = sorted(program)

            for clause_number, clause in enumerate(ordered_rules):
                clause_handle = self.make_rule_handle(clause)
                # yield from self.make_clause_inclusion_rule(clause, min_clause[clause], clause_handle)
                yield from self.make_clause_inclusion_rule(clause, clause_handle)
                clause_var = vo_clause(clause_number)
                literals.append(Literal('included_clause', (clause_handle, clause_var)))
                literals.append(self.min_rule_literal(clause, clause_var))

            literals.extend(self.before_literals(ordered_rules))

            # ensure that each clause_var is ground to a unique value
            if len(program) > 1:
                literals.append(alldiff(tuple(vo_clause(c) for c in range(len(program)))))

            for other_lit, num_clauses in lits_num_clauses.items():
                if other_lit == lit:
                    continue
                literals.append(Literal('num_clauses', (other_lit, num_clauses)))
            num_recursive = lits_num_recursive_clauses[lit]

            literals.append(Literal('num_recursive', (lit, num_recursive)))

            yield (None, tuple(literals))

    @staticmethod
    def format_constraint(con):
        (head, body) = con
        constraint_literals = []
        for constobj in body:
            if not constobj.meta:
                constraint_literals.append(str(constobj))
                continue
            if constobj.predicate == 'AllDifferent':
                # AC: TODO!!!
                continue
            arga, argb = constobj.arguments
            if isinstance(arga, ConstVar):
                arga = arga.name
            else:
                arga = str(arga)
            if isinstance(argb, ConstVar):
                argb = argb.name
            else:
                argb = str(argb)
            constraint_literals.append(f'{arga}{constobj.predicate}{argb}')

        x = f':- {", ".join(constraint_literals)}.'
        if head:
            x = f'{head} {x}'
        return x

    @staticmethod
    def format_rule_clingo(rule):
        head, body = rule
        constraint_literals = []
        # body = ','.join(str(x) for x in body)
        new_body = []
        if head == None:
            head = ''
        # print(str(head) + ':- ' + body)
        for literal in body:
            if not literal.meta:
                new_body.append(str(literal))
                continue
            arga, argb = literal.arguments
            if literal.predicate == 'AllDifferent':
                new_body.append(f'{arga.name} != {argb.name}')
                continue
            if isinstance(arga, ConstVar):
                arga = arga.name
            else:
                arga = str(arga)
            if isinstance(argb, ConstVar):
                argb = argb.name
            else:
                argb = str(argb)
            new_body.append(f'{arga}{literal.predicate}{argb}')
        # if head:
        return str(head) + ' :- ' + ','.join(new_body) + '.'