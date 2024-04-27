from pyswip import Prolog

import os
import sys
import time
import pkg_resources
from contextlib import contextmanager
from . core import *
from datetime import datetime

class Tester():
    def __init__(self, tracker):
        self.prolog = Prolog()
        self.tracker = tracker
        settings = tracker.settings

        bk_pl_path = settings.bk_file
        exs_pl_path = settings.ex_file
        test_pl_path = pkg_resources.resource_filename(__name__, "lp/test.pl")

        for x in [exs_pl_path, bk_pl_path, test_pl_path]:
            if os.name == 'nt': # if on Windows, SWI requires escaped directory separators
                x = x.replace('\\', '\\\\')
            self.prolog.consult(x)

        # load examples
        list(self.prolog.query('load_examples'))

        self.pos = [x['I'] for x in self.prolog.query('current_predicate(pos_index/2),pos_index(I,_)')]
        self.neg = [x['I'] for x in self.prolog.query('current_predicate(neg_index/2),neg_index(I,_)')]

        self.prolog.assertz(f'timeout({settings.eval_timeout})')

        self.cached_redundant_literals = {}
        self.cached_is_inconsistent = {}
        self.cached_all_pos_covered = {}
        self.cached_pos_covered = {}

    def query_holds(self, query):
        # with self.tracker.stats.duration('query_holds'):
        return len(list(self.prolog.query(query))) > 0

    def first_result(self, query):
        # with self.tracker.stats.duration('first_result'):
        return list(self.prolog.query(query))[0]

    @contextmanager
    def using(self, rules):
        recursive = self.tracker.settings.recursion and prog_is_recursive(rules)
        asserted_rules = set()
        # print('assert')
        # for rule in rules:
        #     print('A', rule_to_code(rule))
        try:
            # with self.tracker.stats.duration('assert'):
            if recursive:
                self.prolog.assertz('recursive')

            for rule in rules:
                head, body = rule
                x = rule_to_code(order_rule(rule))
                self.prolog.assertz(x)
                asserted_rules.add((head.predicate, head.arity))
            yield
        finally:
            # with self.tracker.stats.duration('retract'):
            if recursive:
                self.prolog.retractall('recursive')
            for predicate, arity in asserted_rules:
                args = ','.join(['_'] * arity)
                self.prolog.retractall(f'{predicate}({args})')

    # ==========

    def is_complete(self, rules, pos):
        # TODO: COULD CACHE?
        to_check = []
        if rules in self.cached_pos_covered:
            to_check = [x for x in pos if x not in self.cached_pos_covered[rules]]
        if to_check:
            self.pos_covered_batch(rules, to_check)
        return all(self.pos_covered(rules, x) for x in pos)

    def is_inconsistent(self, rules):
        if rules in self.cached_is_inconsistent:
            return self.cached_is_inconsistent[rules]
        # print('is_inconsistent')
        with self.using(rules):
            res = self.query_holds('inconsistent')
        self.cached_is_inconsistent[rules] = res
        return res

    def pos_covered_batch(self, rules, xs):
        if rules not in self.cached_pos_covered:
            self.cached_pos_covered[rules] = {}

        # print('pos_covered_batch')
        with self.using(rules):
            ys = set(self.first_result(f'pos_covered_batch({xs},S)')['S'])

        for x in xs:
            self.cached_pos_covered[rules][x] = x in ys

    def pos_covered(self, rules, x):
        # print('pos_covered')
        if rules in self.cached_pos_covered and x in self.cached_pos_covered[rules]:
            return self.cached_pos_covered[rules][x]

        self.cached_pos_covered[rules] = {}

        # if a single rule or non-separable
        if len(rules) == 1 or not prog_is_separable(rules):
            # print('pos_covered')
            with self.using(rules):
                res = self.query_holds(f'pos_covered({x})')
            self.cached_pos_covered[rules][x] = res
            return res

        res = any(self.pos_covered(frozenset([rule]), x) for rule in rules)
        self.cached_pos_covered[rules][x] = res
        return res

    def all_pos_covered(self, rules):
        # print('all_pos_covered')
        if rules in self.cached_all_pos_covered:
            return self.cached_all_pos_covered[rules]

        # if a single rule or non-separable
        if len(rules) == 1 or not prog_is_separable(rules):
            # print('all_pos_covered')
            with self.using(rules):
                res = frozenset(self.first_result('all_pos_covered(Xs)')['Xs'])
            self.cached_all_pos_covered[rules] = res

            if rules not in self.cached_pos_covered:
                self.cached_pos_covered[rules] = {}
            for x in self.pos:
                self.cached_pos_covered[rules][x] = x in res
            return res

        # if multiple rules or recursive
        xs = set()
        for rule in rules:
            xs.update(self.all_pos_covered(frozenset([rule])))
        xs = frozenset(xs)
        self.cached_all_pos_covered[rules] = xs
        if rules not in self.cached_pos_covered:
            self.cached_pos_covered[rules] = {}
        for x in self.pos:
            self.cached_pos_covered[rules][x] = x in xs
        return xs

    def is_totally_incomplete(self, rules, pos):
        # print('is_totally_incomplete')
        # TODO: COULD CACHE?
        to_check = []
        if rules in self.cached_pos_covered:
            to_check = [x for x in pos if x not in self.cached_pos_covered[rules]]
        if to_check:
            self.pos_covered_batch(rules, to_check)
        return all(not self.pos_covered(rules, x) for x in pos)

    def fp(self, rules):
        with self.using(rules):
            return self.first_result(f'fp(N)')['N']

    def cache_test_results(self, rules, pos):
        if rules in self.cached_all_pos_covered:
            return
        if rules in self.cached_is_inconsistent:
            return

        if rules not in self.cached_pos_covered:
            self.cached_pos_covered[rules] = {}
        xs = [x for x in pos if x not in self.cached_pos_covered[rules]]
        with self.using(rules):

            # CHECK WHETHER INCONSISTENT
            inconsistent = self.query_holds('inconsistent')
            self.cached_is_inconsistent[rules] = inconsistent

            if inconsistent:
                # CHECK WHETHER COMPLETE
                if xs:
                    ys = frozenset(self.first_result(f'pos_covered_batch({xs},S)')['S'])
                    for x in xs:
                        self.cached_pos_covered[rules][x] = x in ys
                return

            # CHECK WHETHER COVERS ALL EXAMPLES
            xs = frozenset(self.first_result('all_pos_covered(Xs)')['Xs'])
            self.cached_all_pos_covered[rules] = xs
            if rules not in self.cached_pos_covered:
                self.cached_pos_covered[rules] = {}
            for x in self.pos:
                self.cached_pos_covered[rules][x] = x in xs



            # GET ALL POS COVERED
            # if len(xs) == 0 or len(xs) == len(self.pos):
            #     self.cached_all_pos_covered[rules] = ys
            #     return
            # print('TESTER.GETALLPOSCOVERED')

# if

# ALWAYS:
#     tester.is_complete(prog, pos)
#     tester.is_inconsistent(prog):
#     rule_has_redundant_literal

# ALWAYS WHEN LEN > 1:
#   find_redundant_clauses

# IF CONSISTENT:
#     xs = tracker.tester.all_pos_covered(prog)

# IF_INCOMPLETE:
#     is_totally_incomplete





    # TO REFACTOR!!!!!# TO REFACTOR!!!!!# TO REFACTOR!!!!!# TO REFACTOR!!!!!# TO REFACTOR!!!!!# TO REFACTOR!!!!!

    seen_subset = set()

    def reduce_subset(self, rules, pos):
        # k = (rules, frozenset(pos))
        # if k in self.seen_subset:
        #     print('SEEEN')
        # else:
        #     self.seen_subset.add(k)
        # with self.tracker.stats.duration('reduce_subset'):
        rules = list(rules)
        for i in range(len(rules)):
            subrules = frozenset(rules[:i] + rules[i+1:])

            if len(subrules) == 1:
                rule = list(subrules)[0]
                if rule_is_recursive(rule) or rule_calls_invented(rule) or rule_is_invented(rule):
                    continue

            if self.is_complete(subrules, pos) and not self.is_inconsistent(subrules):
                return self.reduce_subset(subrules, pos)

        return frozenset(rules)

    # def subsumes(self, r1, r2):
    #     r1 = list(r1)
    #     r1 = f"[{','.join(x for x in r1)}]"
    #     r2 = list(r2)
    #     r2 = f"[{','.join(x for x in r2)}]"
    #     res = list(self.prolog.query(f'subsumes2({r1},{r2})'))
    #     return len(res) > 0

    # def subsumes2(self, t1, t2):
    #     def fmt(r):
    #         r = list(r)
    #         return '[' + ','.join(x for x in r) + ']'

    #     t1 = '['+ ','.join(fmt(r) for r in t1) + ']'
    #     t2 = '['+ ','.join(fmt(r) for r in t2) + ']'
    #     res = list(self.prolog.query(f'subsumes3({t1},{t2})'))
    #     return len(res) > 0


    def rule_has_redundant_literal(self, rule):
        k = hash(rule)
        if k in self.cached_redundant_literals:
            return self.cached_redundant_literals[k]
        head, body = rule
        C = f"[{','.join(('not_'+ literal_to_code(head),) + tuple(literal_to_code(lit) for lit in body))}]"
        has_redundant_literal = self.query_holds(f'redundant_literal({C})')
        self.cached_redundant_literals[k] = has_redundant_literal
        return has_redundant_literal

    def check_redundant_clause(self, rules):
        # AC: if the overhead of this call becomes too high, such as when learning programs with lots of clauses, we can improve it by not comparing already compared clauses
        prog = []
        for head, body in rules:
            C = f"[{','.join(('not_'+ literal_to_code(head),) + tuple(literal_to_code(lit) for lit in body))}]"
            prog.append(C)
        prog = f"[{','.join(prog)}]"
        return list(self.prolog.query(f'redundant_clause({prog})'))

    def is_functional(self, rules, pos):
        # TODO: COULD CACHE!
        with self.using(rules):
            return self.query_holds('non_functional')

    def find_redundant_clauses(self, rules):
        prog = []
        for i, (head, body) in enumerate(rules):
            C = f"[{','.join(('not_'+ literal_to_code(head),) + tuple(literal_to_code(lit) for lit in body))}]"
            C = f'{i}-{C}'
            prog.append(C)
        prog = f"[{','.join(prog)}]"
        res = self.prolog.query(f'find_redundant_clauses({prog},R0,R1)')

        for dic in res:
            r0 = dic['R0']
            r1 = dic['R1']
            yield rules[r0], rules[r1]


    def reduce_subset2(self, rules, pos):
        rules = list(rules)
        asserted_rules = set()

        # assert auxiliary relations for pos examples we car about
        for x in pos:
            self.prolog.assertz(f'subset_pos_index({x})')

        # enumerate the rules
        for i, rule in enumerate(rules):
            head, body = rule
            r = rule_to_code(order_rule(rule))
            # prepend an argument for the rule id
            r = r.replace(f'{head.predicate}(', f'{head.predicate}({i},')
            # assert to the db
            self.prolog.assertz(r)
            asserted_rules.add((head.predicate, head.arity+1))

        # call prolog to find the minimal subset of the rules
        # the result is a list of rule ids
        res = self.first_result(f'reduce({list(range(len(rules)))},L)')['L']

        # retract auxiliary facts
        self.prolog.retractall(f'subset_pos_index(_)')

        # retract added rules
        for predicate, arity in asserted_rules:
            args = ','.join(['_'] * arity)
            self.prolog.retractall(f'{predicate}({args})')

        return frozenset([rules[i] for i in res])


