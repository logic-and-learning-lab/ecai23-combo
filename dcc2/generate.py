from . core import Literal
from collections import defaultdict

def gen_args(args):
    return tuple(chr(ord('A') + arg.number) for arg in args)

def generate_program(model):
    directions = defaultdict(lambda: defaultdict(lambda: '?'))
    clause_id_to_body = defaultdict(set)
    clause_id_to_head = {}

    for atom in model:
        args = atom.arguments

        if atom.name == 'body_literal':
            clause_id = args[0].number
            predicate = args[1].name
            arguments = gen_args(args[3].arguments)
            arity = len(arguments)
            body_literal = (predicate, arguments, arity)
            clause_id_to_body[clause_id].add(body_literal)

        elif atom.name == 'head_literal':
            clause_id = args[0].number
            predicate = args[1].name
            arguments = args[3].arguments
            arity = len(arguments)
            arguments = gen_args(arguments)
            head_literal = (predicate, arguments, arity)
            clause_id_to_head[clause_id] = head_literal

        elif atom.name == 'direction_':
            pred_name = args[0].name
            arg_index = args[1].number
            arg_dir_str = args[2].name

            if arg_dir_str == 'in':
                arg_dir = '+'
            elif arg_dir_str == 'out':
                arg_dir = '-'
            else:
                raise Exception(f'Unrecognised argument direction "{arg_dir_str}"')
            directions[pred_name][arg_index] = arg_dir

    rules = []
    for clause_id in clause_id_to_head:
        (head_pred, head_args, head_arity) = clause_id_to_head[clause_id]
        head_modes = tuple(directions[head_pred][i] for i in range(head_arity))
        head = Literal(head_pred, head_args, head_modes)

        body = set()
        for (body_pred, body_args, body_arity) in clause_id_to_body[clause_id]:
            body_modes = tuple(directions[body_pred][i] for i in range(body_arity))
            body.add(Literal(body_pred, body_args, body_modes))
        body = frozenset(body)
        rule = head, body
        rules.append(rule)
    return frozenset(rules)
