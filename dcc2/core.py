from collections import namedtuple, defaultdict

ConstVar = namedtuple('ConstVar', ['name', 'type'])

def all_vars_in_rule(body):
    all_vars = set()
    for literal in body:
        for arg in literal.arguments:
            if isinstance(arg, ConstVar):
                all_vars.add(arg)
            elif isinstance(arg, tuple):
                for t_arg in arg:
                    if isinstance(t_arg, ConstVar):
                        all_vars.add(t_arg)
    return all_vars

def ground_literal(literal, assignment):
    ground_args = []
    for arg in literal.arguments:
        if arg in assignment:
            ground_args.append(assignment[arg])
        # handles tuples of ConstVars
        # TODO: AC: EXPLAIN BETTER
        elif isinstance(arg, tuple):
            ground_t_args = []
            # AC: really messy
            for t_arg in arg:
                if t_arg in assignment:
                    ground_t_args.append(assignment[t_arg])
                else:
                    ground_t_args.append(t_arg)
            ground_args.append(tuple(ground_t_args))
        else:
            ground_args.append(arg)
    return (literal.positive, literal.predicate, tuple(ground_args))

def ground_rule(rule, assignment):
    head, body = rule
    ground_head = None
    if head:
        ground_head = ground_literal(head, assignment)
    ground_body = frozenset(ground_literal(literal, assignment) for literal in body)
    return ground_head, ground_body



def literal_to_code(literal):
    args = ','.join(literal.arguments)
    return f'{literal.predicate}({args})'

class Literal:
    def __init__(self, predicate, arguments, directions = [], positive = True, meta=False):
        self.predicate = predicate
        self.arguments = arguments
        self.arity = len(arguments)
        self.directions = directions
        self.positive = positive
        self.meta = meta
        self.inputs = frozenset(arg for direction, arg in zip(self.directions, self.arguments) if direction == '+')
        self.outputs = frozenset(arg for direction, arg in zip(self.directions, self.arguments) if direction == '-')

    def __lt__(self, other):
        return (self.predicate < other.predicate) or ((self.predicate == other.predicate) and (self.arguments < other.arguments))

    # AC: TODO - REFACTOR
    def __str__(self):
        if self.directions:
            vdirections = (var_dir + var for var, var_dir in zip(self.arguments, self.directions))
            x = f'{self.predicate}({",".join(vdirections)})'
            if not self.positive:
                x = 'not ' + x
            return x
        else:
            args = []
            for arg in self.arguments:
                if isinstance(arg, ConstVar):
                    args.append(arg.name)
                elif isinstance(arg, tuple):
                    t_args = []
                    for t_arg in arg:
                        if isinstance(t_arg, ConstVar):
                            t_args.append(t_arg.name)
                        else:
                            t_args.append(str(t_arg))
                    if len(t_args) > 1:
                        args.append(f'({",".join(t_args)})')
                    else:
                        args.append(f'({",".join(t_args)},)')
                else:
                    args.append(str(arg))
            x = f'{self.predicate}({",".join(args)})'
            if not self.positive:
                x = 'not ' + x
            return x

    def __hash__(self):
        return self.my_hash()

    def __eq__(self, other):
        if other == None:
            return False
        return self.my_hash() == other.my_hash()

    def my_hash(self):
        return hash((self.predicate, self.arguments))

def prog_is_recursive(rules):
    return any(rule_is_recursive(rule) for rule in rules)

def prog_is_separable(rules):
    return separable(rules)

def separable(rules):
    return not any(rule_is_recursive(rule) or rule_is_invented(rule) for rule in rules)

def rule_to_code(rule):
    head, body = rule
    head_str = ''
    if head:
        head_str = literal_to_code(head)
    body_str = ','.join(literal_to_code(literal) for literal in body)
    return f'{head_str}:- {body_str}'

def rule_is_recursive(rule):
    head, body = rule
    if not head:
        return False
    return any(head.predicate  == literal.predicate for literal in body if isinstance(literal, Literal))

def rule_is_invented(rule):
    head, body = rule
    if not head:
        return False
    # TODO: REPLACE WITH CORRECT REGEX
    return head.predicate.startswith('inv')

def rule_calls_invented(rule):
    head, body = rule
    for atom in body:
        # TODO: REPLACE WITH CORRECT REGEX
        if atom.predicate.startswith('inv'):
            return True
    return False

def order_rule(clause):
    (head, body) = clause
    ordered_body = []
    grounded_variables = head.inputs
    body_literals = set(body)

    if head.inputs == []:
        return clause

    while body_literals:
        selected_literal = None
        for literal in body_literals:
            # AC: could cache for a micro-optimisation
            if literal.inputs.issubset(grounded_variables):
                if literal.predicate != head.predicate:
                    # find the first ground non-recursive body literal and stop
                    selected_literal = literal
                    break
                else:
                    # otherwise use the recursive body literal
                    selected_literal = literal

        if selected_literal == None:
            message = f'{selected_literal} in clause {self} could not be grounded'
            raise ValueError(message)

        ordered_body.append(selected_literal)
        grounded_variables = grounded_variables.union(selected_literal.outputs)
        body_literals = body_literals.difference({selected_literal})

    return (head, tuple(ordered_body))
