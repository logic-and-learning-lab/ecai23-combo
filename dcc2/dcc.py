#!/usr/bin/env python3

import time
from datetime import datetime
from itertools import chain, combinations
from . util import Settings, Stats, timeout, parse_settings
from . asp import ClingoGrounder, ClingoSolver
from . tester import Tester
from . constrain import Constrain
from . generate import generate_program
from . core import *

from collections import defaultdict
import clingo.script
clingo.script.enable_python()
import pkg_resources

OPTIMAL = 'OPTIMAL'
INCONSISTENT = 'INCONSISTENT'
SOLUTION = 'SOLUTION'

WITH_OPTIMISTIC = False
WITH_CHUNKING = True
WITH_LAZINESS = True
WITH_MIN_LITERALS = False
# WITH_MIN_LITERALS = True
WITH_MIN_RULE_SIZE = False
# WITH_MIN_RULE_SIZE = True
WITH_MAX_RULE_BOUND = False
# WITH_MAX_RULE_BOUND = True
WITH_CRAP_CHECK = False
# WITH_CRAP_CHECK = True
WITH_BOOTSTRAPPING = False
WITH_BOOTSTRAPPING = True
WITH_SUBSUMPTION = False
WITH_SUBSUMPTION = True
# WITH_COVERAGE_CHECK = False
# WITH_COVERAGE_CHECK = True
# MAX_RULES = 6
# MAX_RULES = 3
# MAX_LITERALS = 20

ALAN_FILE = pkg_resources.resource_string(__name__, "lp/alan.pl").decode()
NON_REC_BOUNDS_FILE = pkg_resources.resource_string(__name__, "lp/bounds.pl").decode()
REC_BOUNDS_FILE = pkg_resources.resource_string(__name__, "lp/bounds-rec.pl").decode()

class Tracker:
    def __init__(self, settings):
        self.settings = settings
        self.min_total_literals = 1
        self.min_total_rules = 1
        self.max_total_rules = settings.max_rules
        self.min_size = {}
        self.no_single_rule_solutions = []
        self.best_prog = None
        self.best_prog_size = None
        self.best_prog_errors = None
        self.best_progs = {}
        self.seen_consistent = set()
        self.seen_inconsistent = set()

        self.seen_crap = set()
        self.pos_coverage = {}
        self.pos_coverage2 = {}

        self.cached_min_rule = {}
        self.cached_before = {}

        solver = clingo.Control()
        solver.add('base', [], ALAN_FILE)
        with open(settings.bias_file) as f:
            solver.add('base', [], f.read())
        solver.add('base', [], '\n' + f'max_clauses({settings.max_rules}).')
        solver.ground([('base', [])])

        max_body_atoms = solver.symbolic_atoms.by_signature('max_body', arity=1)
        settings.max_body_atoms = next(max_body_atoms).symbol.arguments[0].number

        max_vars_atoms = solver.symbolic_atoms.by_signature('max_vars', arity=1)
        settings.max_vars = next(max_vars_atoms).symbol.arguments[0].number

        settings.recursion = len(list(solver.symbolic_atoms.by_signature('enable_recursion', arity=0))) > 0
        settings.predicate_invention = len(list(solver.symbolic_atoms.by_signature('enable_pi', arity=0))) > 0

        self.settings.WITH_OPTIMISTIC = WITH_OPTIMISTIC
        self.settings.WITH_CHUNKING = WITH_CHUNKING
        self.settings.WITH_LAZINESS = WITH_LAZINESS
        self.settings.WITH_MIN_RULE_SIZE = WITH_MIN_RULE_SIZE and not (self.settings.recursion or self.settings.predicate_invention)
        self.tester = Tester(self)
        # self.max_total_literals = settings.max_literals
        # self.stats = Stats(log_best_programs=settings.info)
        self.stats = Stats()
        self.pos = frozenset(self.tester.pos)
        self.neg = frozenset(self.tester.neg)
        self.best_progs = {ex:None for ex in self.pos}
        self.stats.crap_count = 0

cached_grounding = {}

def bind_vars_in_cons(stats, grounder, rules):
    ground_cons = set()

    for rule in rules:
        head, body = rule

        # find bindings for variables in the constraint
        assignments = grounder.find_bindings(rule)

        # keep only standard literals
        body = tuple(literal for literal in body if not literal.meta)

        k = hash((head, body))

        # ground the rule for each variable assignment
        for assignment in assignments:

            k = hash((k, tuple(sorted(assignment.items()))))
            if k in cached_grounding:
                cons = cached_grounding[k]
            else:
                cons = ground_rule((head, body), assignment)
                cached_grounding[k] = cons

            ground_cons.add(cons)

    return ground_cons

def build_constraints(tracker, stats, constrainer, tester, program, pos):
    cons = set()

    if tester.is_complete(program, pos):
        cons.update(constrainer.generalisation_constraint(program))
    else:
        cons.update(constrainer.specialisation_constraint(program))

        if tester.is_totally_incomplete(program, pos):
            cons.update(constrainer.redundancy_constraint(program))

    if tester.is_inconsistent(program):
        cons.update(constrainer.generalisation_constraint(program))
    else:
        if not tracker.settings.functional_test or tester.is_functional(program, pos):
            cons.update(constrainer.specialisation_constraint(program))

    if WITH_SUBSUMPTION:
        # eliminate rules subsumed by this one
        for rule in program:
            cons.update(constrainer.subsumption_constraint(rule))

    # apply functional test only when the program is complete and consistent
    if tracker.settings.functional_test and tester.is_complete(program, pos) and tester.is_non_functional(program, pos) and not tester.is_inconsistent(program):
        cons.update(constrainer.generalisation_constraint(program))

    # eliminate generalisations of rules with redundant literals
    for rule in program:
        if tester.rule_has_redundant_literal(rule):
            cons.update(constrainer.generalisation_constraint([rule]))

    if WITH_CRAP_CHECK:
        if program in tracker.seen_crap:
            cons.update(constrainer.elimination_constraint(program))

    if len(program) > 1:

        # detect subsumption redundant rules
        for r1, r2 in tester.find_redundant_clauses(tuple(program)):
            cons.update(constrainer.subsumption_constraint_pairs(r1, r2))

        for rule in program:
            sub_prog = frozenset([rule])

            if rule_is_recursive(rule) or rule_calls_invented(rule) or rule_is_invented(rule):
                continue

            if tester.is_complete(sub_prog, pos):
                cons.update(constrainer.generalisation_constraint(sub_prog))
            else:
                cons.update(constrainer.specialisation_constraint(sub_prog))

                if tester.is_totally_incomplete(sub_prog, pos):
                    cons.update(constrainer.redundancy_constraint(sub_prog))

            if tester.is_inconsistent(sub_prog):
                cons.update(constrainer.generalisation_constraint(sub_prog))
            else:
                cons.update(constrainer.specialisation_constraint(sub_prog))

            if WITH_CRAP_CHECK:
                if sub_prog in tracker.seen_crap:
                    cons.update(constrainer.elimination_constraint(sub_prog))
    return cons

def check_subsumed(tracker, prog):
    # TODO: REFACTOR!!!
    # eliminate programs that are consistent but cover fewer positive examples than a smaller consistent program

    if tracker.settings.recursion:
        return

    if tracker.tester.is_inconsistent(prog):
        return

    # all examples covered by program
    # print('a')
    xs = tracker.tester.all_pos_covered(prog)

    asda = False
    # check whether we have seen this success set before
    if xs in tracker.pos_coverage:
        other_prog = tracker.pos_coverage[xs]
        if prog == other_prog:
            pass
        # if this program is smaller than another with the same success set
        elif num_literals(prog) < num_literals(other_prog):
            # then the other program is crap
            tracker.seen_crap.add(other_prog)
            tracker.pos_coverage[xs] = prog
        else:
            # otherwise this one is crap
            tracker.seen_crap.add(prog)
            return

    tracker.pos_coverage[xs] = prog

    to_remove = set()
    for prog2, xs2 in tracker.pos_coverage2.items():
        # if the other program is smaller and has a larger coverage
        if num_literals(prog2) < num_literals(prog) and xs.issubset(xs2):
            # then this program is crap
            tracker.seen_crap.add(prog)
            return
        # if this program is smaller and has a larger coverage
        if num_literals(prog) < num_literals(prog2) and xs2.issubset(xs):
            # other program is crap
            tracker.seen_crap.add(prog2)
            to_remove.add(prog2)
            # might be able to break here

    for k in to_remove:
        del tracker.pos_coverage2[k]

    tracker.pos_coverage2[prog] = xs

def cache_rules(tracker, rules):
    if rules in tracker.seen_consistent:
        return

    if rules in tracker.seen_inconsistent:
        return

    if tracker.tester.is_inconsistent(rules):
        tracker.seen_inconsistent.add(rules)
    else:
        tracker.seen_consistent.add(rules)

    if len(rules) == 1:
        return

    for rule in rules:
        if rule_is_recursive(rule) or rule_is_invented(rule) or rule_calls_invented(rule):
            continue
        # TODO: REMOVE REDUNDANCY HERE
        # print('cache rules inner')
        # tester.cache_test_results()
        cache_rules(tracker, frozenset([rule]))


def popper(tracker, pos, neg, bootstap_cons, bounds):

    # c0 = 0
    # c1 = 0
    # c2 = 0

    settings = tracker.settings
    stats = tracker.stats
    tester = tracker.tester
    constrainer = Constrain(tracker)
    solver = ClingoSolver(settings, bounds)
    grounder = ClingoGrounder(bounds.max_rules, settings.max_vars)

    all_fo_cons = set(x for x in bootstap_cons)

    # ground old constraints and add to solver
    with stats.duration('bootstrap'):
        ground_cons = bind_vars_in_cons(stats, grounder, all_fo_cons)
        solver.add_ground_clauses(ground_cons)

    min_size = bounds.min_literals if WITH_MIN_LITERALS else 1

    dbg(f'Running Popper min_rules:{bounds.min_rules} max_rules:{bounds.max_rules} min_literals:{bounds.min_literals} max_literals:{bounds.max_literals}')

    # seen_before1 = tracker.seen_consistent | tracker.seen_inconsistent

    for size in range(min_size, bounds.max_literals + 1):
        dbg(f'num_literals:{size}')
        solver.update_number_of_literals(size)

        # seen_before2 = tracker.seen_consistent | tracker.seen_inconsistent

        while True:

            # seen_before3 = tracker.seen_consistent | tracker.seen_inconsistent

            # generate hypothesis
            with stats.duration('generate'):
                model = solver.get_model()
                if not model:
                    break
                prog = generate_program(model)
                constrainer.cache_bounds(prog)

            tracker.stats.total_programs += 1

            # seen_all1 = True
            # seen_all2 = True
            # seen_all3 = True
            # for rule in prog:
            #     sub_prog = frozenset([rule])
            #     if sub_prog not in seen_before1:
            #         seen_all1 = False
            #     if sub_prog not in seen_before2:
            #         seen_all2 = False
            #     if sub_prog not in seen_before3:
            #         seen_all3 = False
            #     # if sub_prog in seen_before1:
            #         # assert(sub_prog in tracker.seen_consistent)
            #         # print(rule_to_code(rule), 'seen_before1')
            #     # else:
            #         # if sub_prog in seen_before2:
            #             # print(rule_to_code(rule), 'seen_before2')
            # if seen_all1:
            #     c0 +=1
            #     c1 +=1
            #     c2 +=1
            #     print('-- SEEN ALL1 --', c0)
            #     for rule in prog:
            #         print(rule_to_code(rule))
            # elif seen_all2:
            #     c1 +=1
            #     c2 +=1
            #     print('-- SEEN ALL2 --', c1)
            #     for rule in prog:
            #         print(rule_to_code(rule))
            # elif seen_all3:
            #     c2 +=1
            #     print('-- SEEN ALL3 --', c2)
            #     for rule in prog:
            #         print(rule_to_code(rule))

            if tracker.settings.debug:
                print('-- NEW PROG --')
                for rule in prog:
                    print(rule_to_code(rule))

            # # TMP!!!!
            # if tracker.best_prog:
            #     if prog.issubset(tracker.best_prog):
            #         print('SUBSET'*10)

            # test hypothesis
            solution_found = False
            with stats.duration('test'):
                tester.cache_test_results(prog, pos)
                if tester.is_complete(prog, pos) and not tester.is_inconsistent(prog):
                    if not tracker.settings.functional_test or tester.is_functional(prog, pos):
                        solution_found = True

            with stats.duration('crap and cache'):
                # UNSURE IF NEEDED HERE
                tester.cache_test_results(prog, [])
                check_subsumed(tracker, prog)
                if len(prog) > 1:
                    for rule in prog:
                        if rule_is_recursive(rule) or rule_calls_invented(rule) or rule_is_invented(rule):
                            continue
                        sub_prog = frozenset([rule])
                        tester.cache_test_results(sub_prog, [])
                        check_subsumed(tracker, sub_prog)
                cache_rules(tracker, prog)

            if solution_found:
                return prog

            # build constraints
            with stats.duration('build'):
                fo_cons = build_constraints(tracker, stats, constrainer, tester, prog, pos)
                fo_cons = fo_cons - all_fo_cons
                all_fo_cons.update(fo_cons)

            # ground constraints
            with stats.duration('ground'):
                ground_cons = bind_vars_in_cons(stats, grounder, fo_cons)

            # add constraints to solver
            with stats.duration('add'):
                solver.add_ground_clauses(ground_cons)

    return None

def dbg(*args):
    now = datetime.now()
    current_time = now.strftime("%H:%M:%S")
    # print('%', current_time, *args)

def pprint(prog):
    for rule in prog:
        dbg(rule_to_code(rule) + '.')

def num_literals(prog):
    return sum(1 + len(body) for head_, body in prog)

def calc_score(tester, prog):
    return sum(1 for x in tester.pos if not tester.is_complete(prog, [x]))

def calc_fp(tester, rules):
    return tester.fp(rules)

def best_prog_improvement(tracker, prog):
    errors = calc_score(tracker.tester, prog)
    if errors > 0:
        return False

    if tracker.best_prog == None:
        return True

    if num_literals(prog) < tracker.best_prog_size:
        return True

    return False

def chunk_list(xs, size):
    for i in range(0, len(xs), size):
        yield xs[i:i+size]

def flatten(xs):
    return [item for sublist in xs for item in sublist]

def update_best_prog(tracker, prog):
    tracker.best_prog = prog
    tracker.best_prog_size = num_literals(prog)
    tracker.best_prog_errors = calc_score(tracker.tester, prog)

    dbg(f'NEW BEST PROG size:{tracker.best_prog_size} tp:{len(tracker.tester.pos)} fp:{calc_fp(tracker.tester, prog)}')
    pprint(prog)

def check_old_programs(tracker, pos, bounds):
    # check all programs seen so far, the outputs are:
    # 1. the smallest complete and consistent hypothesis seen so far
    # 2. a set of constraints for the other programs

    max_literals = bounds.max_literals
    tester = tracker.tester
    constrainer = Constrain(tracker)
    cons = set()
    chunk_prog = None


    # check consistent programs
    for prog in tracker.seen_consistent:

        # if the program is too big, ignore it
        if num_literals(prog) > max_literals:
            continue

        if tester.is_complete(prog, pos):
            # if complete, no need to generalise
            cons.update(constrainer.generalisation_constraint(prog))

            # if not functional, we cannot eliminate specialisations
            if tracker.settings.functional_test and not tester.is_functional(prog, pos):
                continue

            # no need to add any constraints as we will never consider programs bigger than it (since it is complete and consistent)
            chunk_prog = prog
            max_literals = num_literals(prog) - 1
            continue

        # if consistent, no need to specialise
        cons.update(constrainer.specialisation_constraint(prog))

        # if the program entails nothing
        # TODO: IMPROVE FOR PI!
        if separable(prog) or any(not rule_is_recursive(rule) for rule in prog):
            if tester.is_totally_incomplete(prog, pos):
                cons.update(constrainer.redundancy_constraint(prog))

        if WITH_SUBSUMPTION:
            for rule in prog:
                cons.update(constrainer.subsumption_constraint(rule))

        for rule in prog:
            if tester.rule_has_redundant_literal(rule):
                cons.update(constrainer.generalisation_constraint([rule]))

        if len(prog) > 1:
            for r1, r2 in tester.find_redundant_clauses(tuple(prog)):
                cons.update(constrainer.subsumption_constraint_pairs(r1, r2))

        # if WITH_COVERAGE_CHECK:
        #     for rule in prog:
        #         _, body = rule
        #         handle = constrainer.make_clause_handle(rule)
        #         covers.add(f'seen({handle},{len(body)})')
        #         for ex in chunk_exs:
        #             if tester.is_complete([rule], [ex]):
        #                 covers.add(f'covers({handle},{ex})')

    # if WITH_COVERAGE_CHECK:
    #     for e in chunk_exs:
    #         covers.add(f'example({e})')

    # with tracker.stats.duration('CHECK INCONSISTENT PROGRAMS'):
    for prog in tracker.seen_inconsistent:
        prog_size = num_literals(prog)

        if prog_size > max_literals:
            continue

        cons.update(constrainer.generalisation_constraint(prog))

        # TODO: CHECK THE RECURSION ISSUE
        if not tester.is_complete(prog, pos):
            cons.update(constrainer.specialisation_constraint(prog))
            if separable(prog) or any(not rule_is_recursive(rule) for rule in prog):
                if tester.is_totally_incomplete(prog, pos):
                    cons.update(constrainer.redundancy_constraint(prog))

        if WITH_SUBSUMPTION:
            for rule in prog:
                cons.update(constrainer.subsumption_constraint(rule))

        for rule in prog:
            if tester.rule_has_redundant_literal(rule):
                cons.update(constrainer.generalisation_constraint([rule]))

        if len(prog) > 1:
            for r1, r2 in tester.find_redundant_clauses(tuple(prog)):
                cons.update(constrainer.subsumption_constraint_pairs(r1, r2))

    if WITH_CRAP_CHECK:
        # a program is crap if it is consistent and there is a smaller program with the same success set
        for prog in tracker.seen_crap:
            if num_literals(prog) > max_literals:
                continue
            cons.update(constrainer.elimination_constraint(prog))

    # if tracker.best_prog:
    #     assert(tracker.tester.is_complete(tracker.best_prog, pos))
    #     assert(not tracker.tester.is_inconsistent(tracker.best_prog))
    #     for sub_prog in powerset(tracker.best_prog):
    #         if num_literals(sub_prog) > max_literals:
    #             continue
    #         if num_literals(sub_prog) < bounds.min_literals:
    #             continue
            # print('SUBSET')
            # for rule in sub_prog:
            #     print(rule_to_code(rule))
            # cons.update(constrainer.specialisation_constraint(sub_prog))

    # cons = Constraints(tracker, generalisation, specialisation, redundancy, subsumption, elimination)
    return chunk_prog, cons

def form_union(progs):
    union = set()
    for prog in progs:
        union.update(prog)
    return frozenset(union)

def remove_redundancy(tracker, old_prog, pos):
    tester = tracker.tester
    stats = tracker.stats

    # print('OLD')
    # pprint(old_prog)
    # with stats.duration('reduce_new'):
    new_prog = tester.reduce_subset2(old_prog, pos)
    # new_prog = tester.reduce_subset(old_prog, pos)
    # print('TEST')
    # pprint(old_prog)
    # with stats.duration('reduce_old'):

    # print('NEW')
    # pprint(new_prog)
    # assert(len(test_prog) == len(new_prog))
    # assert(tester.all_pos_covered(old_prog) == tester.all_pos_covered(test_prog))
    # assert(tester.is_complete(test_prog, pos))

    # print('NEW PROG')
    # pprint(new_prog)
    # assert(tester.is_complete(old_prog, pos))
    # assert(tester.is_complete(new_prog, pos))
    old_success_set = tester.all_pos_covered(old_prog)
    new_success_set = tester.all_pos_covered(new_prog)
    # assert(old_success_set == new_success_set)
    return new_prog

def powerset(iterable):
    "powerset([1,2,3]) --> () (1,) (2,) (3,) (1,2) (1,3) (2,3) (1,2,3)"
    s = list(iterable)
    return chain.from_iterable(combinations(s, r) for r in range(len(s)+1))

def get_union_of_example_progs(tracker, pos):
    if any(tracker.best_progs[x] == None for x in pos):
        return None

    prog = form_union([tracker.best_progs[x] for x in pos])
    # assert(tracker.tester.is_complete(prog, pos))
    if not tracker.settings.recursion:
        assert(not tracker.tester.is_inconsistent(prog))

    prog = remove_redundancy(tracker, prog, pos)
    # assert(tracker.tester.is_complete(prog, pos))
    if not tracker.settings.recursion:
        assert(not tracker.tester.is_inconsistent(prog))
    # assert(len(prog) == len(tracker.tester.reduce_subset(prog, pos)))
    # assert(len(prog) == len(tracker.tester.reduce_subset2(prog, pos)))

    if tracker.tester.is_inconsistent(prog):
        # print('SHIT!!!!!!!!!!!'*4)
        return None

    # dbg(f'BEST_SO_FAR size:{num_literals(prog)}')
    # pprint(prog)

    return prog

def reuse_seen(tracker, pos, iteration_progs, max_literals):
    # print('TRY SEEN!!!', MAX_LITERALS)
    # filter programs that are small enough
    seen = (prog for prog in iteration_progs if num_literals(prog) <= max_literals)
    # sort by program size
    seen = sorted(seen, key = lambda x: num_literals(x))
    # take the first complete program
    for prog in seen:
        if tracker.tester.is_complete(prog, pos):
            return prog
    return None

def run_clingo_opt(prog, opt_statement):
    solver = clingo.Control()
    solver.add('base', [], prog + '\n' + opt_statement)
    solver.ground([("base", [])])
    sat = False
    opt_value = None
    with solver.solve(yield_=True) as handle:
        for m in handle:
            opt_value = abs(m.cost[0])
            sat = True
    return sat, opt_value

def non_recursive_bounds(tracker, pos, max_rule_size, min_rules, max_rules, min_literals, max_literals):
    prog = [NON_REC_BOUNDS_FILE]
    prog.append(f'max_rule_size({max_rule_size}).')
    prog.append(f'max_rules({min(max_rules, len(pos))}).')
    prog.append(f'min_literals({min_literals}).')
    prog.append(f'max_literals({max_literals}).')

    for x in pos:
        v = tracker.min_size[x]
        prog.append(f'min_rule_size({x},{v}).')

    for size, exs in tracker.no_single_rule_solutions:
        prog.append(f':- rule(R,K), K <= {size},' + ','.join(f'covers(R,{x})' for x in exs) + '.')

    prog = '\n'.join(prog)
    # print(prog)

    sat, max_rules_ = run_clingo_opt(prog, "#maximize{X : num_rules(X)}.")
    if sat:
        max_rules = max_rules_
        _, min_rules = run_clingo_opt(prog, "#minimize{X : num_rules(X)}.")
        _, max_literals = run_clingo_opt(prog, "#maximize{X : num_literals(X)}.")
    # print(f'\tSAT:{sat}, MIN_RULES:{min_rules} MAX_RULES:{max_rules} MIN_LITERALS:{min_literals} MAX_LITERALS:{max_literals}')

    # TODO: MIN RULE SIZE??
    return BoundsStruct(sat, min_rules, max_rules, min_literals, max_literals)

def recursive_bounds(tracker, max_rule_size, min_rules, max_rules, min_literals, max_literals):
    prog = []
    prog.append(f'max_rules({max_rules}).')
    prog.append(f'max_rule_size({max_rule_size}).')
    prog.append(f'min_literals({min_literals}).')
    prog.append(f'max_literals({max_literals}).')
    # print('\n'.join(prog))
    prog.append(REC_BOUNDS_FILE)
    prog = '\n'.join(prog)

    # print(prog)

    sat, max_rules_ = run_clingo_opt(prog, "#maximize{X : num_rules(X)}.")
    if sat:
        max_rules = max_rules_
        _, min_rules = run_clingo_opt(prog, "#minimize{X : num_rules(X)}.")
        _, max_literals = run_clingo_opt(prog, "#maximize{X : num_literals(X)}.")

    # print(f'\tSAT-REC:{sat}, MIN_RULES:{min_rules} MAX_RULES:{max_rules} MIN_LITERALS:{min_literals} MAX_LITERALS:{max_literals}')
    return BoundsStruct(sat, min_rules, max_rules, min_literals, max_literals)

class BoundsStruct:
    def __init__(self, sat, min_rules, max_rules, min_literals, max_literals):
        self.sat = sat
        self.min_rules = min_rules
        self.max_rules = max_rules
        self.min_literals = min_literals
        self.max_literals = max_literals
        self.min_rule_size = 1
        self.exists_min_rule_size = 1

class Bounds2:
    # prog is the best prog so far but could be None
    def __init__(self, tracker, prog, pos):
        self.max_rule_size_ = tracker.settings.max_body_atoms+1
        self.min_rules = 1
        self.max_rules = tracker.settings.max_rules
        self.min_literals = 1
        self.max_literals = tracker.settings.max_literals
        self.rec = None
        self.non_rec = None
        self.sat = True

        # if no pi or recursion, we cannot have more rules than the number of examples
        # if not (tracker.settings.recursion or tracker.settings.predicate_invention):
            # self.max_rules = min(self.max_rules, len(pos))

        # defaults
        self.non_rec = BoundsStruct(True, self.min_rules, min(self.max_rules, len(pos)), self.min_literals, self.max_literals)

        self.rec = BoundsStruct(tracker.settings.recursion or tracker.settings.predicate_invention, self.min_rules, self.max_rules, self.min_literals, self.max_literals)

        # if searching for the first time, use the defaults
        if any(x not in tracker.min_size for x in pos):
            return

        # min literals is the smallest program needed to cover any one of the examples
        if all(tracker.best_progs[x] != None for x in pos):
            self.min_literals = max(num_literals(tracker.best_progs[x]) for x in pos)

        if prog == None:
            return

        # TODO: CHECK WITH RECURSION
        # update bounds based on the union prog
        self.max_rules = min(self.max_rules, len(prog))
        self.max_literals = min(self.max_literals, num_literals(prog))
        self.max_literals -= 1

        self.non_rec = non_recursive_bounds(tracker, pos, self.max_rule_size_, self.min_rules, self.max_rules, self.min_literals, self.max_literals)
        self.sat = self.non_rec.sat

        if tracker.settings.recursion or tracker.settings.predicate_invention:
            self.rec = recursive_bounds(tracker, self.max_rule_size_, self.min_rules, self.max_rules, self.min_literals, self.max_literals)
            if self.rec.sat:
                self.sat = True

        if not self.sat:
            return

        # print('self.max_rules', self.max_rules)
        # print('self.non_rec.max_rules', self.non_rec.max_rules)
        # print('self.non_rec.max_literals', self.non_rec.max_literals)
        max_rules_ = self.non_rec.max_rules
        max_literals_ = self.non_rec.max_literals

        if self.rec.sat:
            # print('hello')
            max_rules_ = max(max_rules_, self.rec.max_rules)
            max_literals_ = max(max_literals_, self.rec.max_literals)
        self.max_rules = max_rules_
        self.max_literals = max_literals_

        # print('self.max_rules', self.max_rules)
        # print('self.max_literals', self.max_literals)


        if WITH_MIN_RULE_SIZE:
            min_size = min(tracker.min_size[x] for x in pos)
            exists_min_size = max(tracker.min_size[x] for x in pos)
            self.non_rec.min_rule_size = min_size
            self.non_rec.exists_min_rule_size = exists_min_size

def process_chunk(tracker, pos, iteration_progs):
    prog = get_union_of_example_progs(tracker, pos)

    # union can be inconsistent when there is recursion
    if prog and tracker.tester.is_inconsistent(prog):
        # print('if prog and tracker.tester.is_inconsistent(prog):')
        prog = None

    # if we cannot learn something smaller, then this chunk program is the union of all the solutions for the smaller chunks
    bounds = Bounds2(tracker, prog, pos)
    if not bounds.sat:
        # print('if not bounds.sat:')
        return prog

    if WITH_LAZINESS:
        # print('WITH_LAZINESS')
        # try to reuse an already found hypothesis
        better_seen = reuse_seen(tracker, pos, iteration_progs, bounds.max_literals)
        if better_seen:
            # print('BETTER_SEEN1')
            # pprint(prog)
            prog = better_seen
            assert(tracker.tester.is_complete(prog, pos))
            assert(not tracker.tester.is_inconsistent(prog))
            for e in pos:
                if e not in tracker.min_size:
                    tracker.min_size[e] = num_literals(prog)
            return prog

    # bootstap_cons = Constraints(tracker)
    bootstap_cons = set()

    if WITH_BOOTSTRAPPING:
        # find the best program already seen and build constraints for the other programs
        with tracker.stats.duration('check_seen'):
            better_seen, bootstap_cons = check_old_programs(tracker, pos, bounds)

        # this program might not be in the hypothesis, so we might need to search for a smaller one
        if better_seen:
            # print('BETTER_SEEN2')
            # pprint(better_seen)
            prog = better_seen
            assert(tracker.tester.is_complete(prog, pos))
            assert(not tracker.tester.is_inconsistent(prog))

            for e in pos:
                if e not in tracker.min_size:
                    tracker.min_size[e] = num_literals(prog)

            bounds = Bounds2(tracker, prog, pos)
            if not bounds.sat:
                return prog

    new_solution = popper(tracker, pos, tracker.neg, bootstap_cons, bounds)

    if new_solution == None:
        # TODO: ADD MORE HERE ABOUT FAILURES!!
        tracker.no_single_rule_solutions.append((bounds.max_literals, pos))

        # TMP!!!!!!
        if prog:
            for x in pos:
                tracker.best_progs[x] = prog
        return prog

    prog = new_solution

    for x in pos:
        if x not in tracker.min_size:
            tracker.min_size[x] = num_literals(prog)

    prog = frozenset(prog)
    assert(tracker.tester.is_complete(prog, pos))
    assert(not tracker.tester.is_inconsistent(prog))
    assert(not tracker.tester.check_redundant_clause(prog))

    # dbg(f'NEW PROGRAM size:{num_literals(prog)}')
    # pprint(prog)
    return prog

def learn_iteration_prog(tracker, chunks):
    all_exs = [x for chunk in chunks for x in flatten(chunk)]

    iteration_progs = set()

    for chunk_num, pos in enumerate(chunks):
        pos = flatten(pos)
        dbg(f'chunk:{chunk_num+1}/{len(chunks)} num_examples:{len(pos)}')

        prog = process_chunk(tracker, pos, iteration_progs)
        if not prog:
            # print('NO PROG')
            continue

        # chunk_prog is guaranteed to be complete, consistent, and smaller than the previous best
        assert(tracker.tester.is_complete(prog, pos))
        assert(not tracker.tester.is_inconsistent(prog))

        # if we find a program that is complete and consistent for all examples then we can stop
        if tracker.tester.is_complete(prog, all_exs) and not tracker.tester.is_inconsistent(prog):
            return prog, OPTIMAL

        for x in pos:
            tracker.best_progs[x] = prog

        iteration_progs.add(prog)
        # TODO: CHECK WHETHER UNION OF ITERATION_PROG IS A SOLUTION FOR EARLIER PRUNING

    iteration_prog = form_union(iteration_progs)
    tracker.tester.cache_test_results(iteration_prog, pos)
    # assert(tracker.tester.is_complete(iteration_prog, all_exs))
    if not tracker.settings.recursion:
        assert(not tracker.tester.is_inconsistent(iteration_prog))

    iteration_prog = remove_redundancy(tracker, iteration_prog, all_exs)
    tracker.tester.cache_test_results(iteration_prog, pos)
    # assert(tracker.tester.is_complete(iteration_prog, all_exs))
    if not tracker.settings.recursion:
        assert(not tracker.tester.is_inconsistent(iteration_prog))

    if tracker.tester.is_inconsistent(iteration_prog):
        return iteration_prog, INCONSISTENT
    return iteration_prog, SOLUTION

def perform_chunking(tracker):
    tmp_chunks = {}
    for ex in tracker.pos:
        prog = tracker.best_progs[ex]
        # IF NO SOLUTION THEN IGNORE
        if prog == None:
            dbg(f'NO SOLUTION FOR EX: {ex} SO SKIPPING')
        elif prog not in tmp_chunks:
            tmp_chunks[prog] = set([ex])
        else:
            tmp_chunks[prog].add(ex)
    return list(tmp_chunks.values())



    # settings.recursion = 'enable_recursion' in f_txt
    # settings.predicate_invention = 'enable_pi' in f_txt

    # max_clauses_atoms =
    # settings.max_clauses = next(max_clauses_atoms).symbol.arguments[0].number

def dcc(settings, standard_popper, queue):
    # maintain stuff during the search

    settings.max_rules = 6
    tracker = Tracker(settings)

    # print('TRACKER.SETTINGS.RECURSION', tracker.settings.recursion)

    # size of the chunks/partitions of the examples
    # chunk_size = 1000

    chunk_size = 1
    if standard_popper:
        chunk_size = len(tracker.pos)

    # initially partitions each example into its own partition
    all_chunks = [[x] for x in tracker.pos]

    while True:
        dbg('CHUNK_SIZE', chunk_size)

        # program for this chunk size is the union of the chunk progs
        # partition positive examples in chunks of size chunk_size
        chunks = list(chunk_list(all_chunks, chunk_size))
        iteration_prog, status = learn_iteration_prog(tracker, chunks)

        if status == OPTIMAL:
            # print('OPTIMAL')
            if best_prog_improvement(tracker, iteration_prog):
                update_best_prog(tracker, iteration_prog)
                queue['prog'] = iteration_prog
            break

        dbg(f'CHUNK:{chunk_size} size:{num_literals(iteration_prog)} status:{status}')

        if status == SOLUTION and best_prog_improvement(tracker, iteration_prog):
            # update the best program for each example
            # we logically reduce the iteration_prog with respect to each positive example
            # TODO: IMPROVE TESTING HERE
            for ex in flatten(all_chunks):
                # tracker.best_progs[ex] = tracker.tester.reduce_subset(iteration_prog, [ex])
                tracker.best_progs[ex] = tracker.tester.reduce_subset2(iteration_prog, [ex])
            update_best_prog(tracker, iteration_prog)
            queue['prog'] = iteration_prog

            if WITH_OPTIMISTIC and tracker.best_prog_errors == 0:
                break

        if WITH_CHUNKING:
            all_chunks = perform_chunking(tracker)

        if len(all_chunks) == 1 or chunk_size > len(tracker.pos):
            # i('BREAK')
            break

        # double the chunk size (loop at most log(len(pos)) iterations)
        chunk_size += chunk_size
        # chunk_size +=

    # print('% SOLUTION:')
    # for rule in tracker.best_prog:
        # print(rule_to_code(rule) + '.')
    return tracker.best_prog, tracker.stats


def runner(settings):
    # def dcc(settings):
    import multiprocessing
    with multiprocessing.Manager() as manager:
        # l = manager.list(range(1))
        l = manager.dict()
        l['prog'] = None
        stats = Stats()
        if settings.baseline:
            p = multiprocessing.Process(target = dcc, args = (settings, True, l))
        else:
            p = multiprocessing.Process(target = dcc, args = (settings, False, l))
        p.start()
        p.join(int(settings.timeout))
        if p.is_alive():
            p.terminate()
        return l['prog']

