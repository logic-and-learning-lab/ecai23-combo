
import random
from zendo import gen_world, add_contact, gen_bk_atom, gen_ex_atom, MAX_SIZE
from pathlib import Path

fpath = 'data/zendo1/data'

BK_SWI = """

max_size(10).
small(X) :- number(X), max_size(M), X >= 0, X =< M//3.
medium(X) :- number(X), max_size(M), X>M//3, X =< 2*M//3.
large(X) :- number(X), max_size(M), X>2*M//3, X =< M.


"""

BK_ASP = """
small(0).
small(1).
small(2).
small(3).
medium(4).
medium(5).
medium(6).
large(7).
large(8).
large(9).
large(10).

"""


def generate_example_zendo1(splits, start, n, trial_):
    for split in splits:
        all_bk = []
        all_exs, pos, neg = [], [], []
        for i in range(start, start+n//2):
            bk_, ex = generate_pos_example(i)
            all_bk.extend(bk_)
            all_exs.append(ex)
            pos.append(ex)

        for i in range(start+n//2, start+n):
            bk_, ex = generate_neg_example(i)
            all_bk.extend(bk_)
            all_exs.append(ex)
            neg.append(ex)

        bk = '\n'.join(all_bk)
        exs = '\n'.join(all_exs)
        write_bk(bk, split, trial_)
        write_exs(exs, split, trial_)
        if split == "train":
            make_aleph(bk, pos, neg, trial_)
            make_louise(bk, pos, neg, trial_)


def generate_pos_example(i):
    w_id, world, contact = gen_world(i, min_pieces=2)
    [piece1, piece2] = random.sample(list(world.keys()), 2)
    world, contact = add_contact(piece1, piece2, world, contact)
    world[piece1][2] = random.randint(0, MAX_SIZE//3)
    world[piece1][3] = "blue"
    world[piece2][3] = "red"
    return gen_bk_atom(w_id, world, contact), gen_ex_atom("pos", i)


def generate_neg_example(i):
    w_id, world, contact = gen_world(i, min_pieces=2)
    while is_positive(world, contact):
        w_id, world, contact = gen_world(w_id)
    return gen_bk_atom(w_id, world, contact), gen_ex_atom("neg", i)


def is_positive(world, contact):
    for piece1 in world:
        if world[piece1][2] <= MAX_SIZE//3 and world[piece1][3] == "blue":
            for piece2 in contact[piece1]:
                if world[piece2][3] == "red":
                    return True
    return False


def write_exs(exs, split, trial_):
    with open(f"{fpath}/{split}/exs-{trial_}.pl", 'w') as f:
        f.write(exs)


def write_bk(bk, split, trial_):
    Path(f"{fpath}/{split}/").mkdir(parents=True, exist_ok=True)
    with open(f"{fpath}/{split}/bk-swi-{trial_}.pl", 'w') as f:
        f.write(":-style_check(-discontiguous).\n")
        f.write(BK_SWI + '\n' + bk)
    with open(f"{fpath}/{split}/bk-asp-{trial_}.pl", 'w') as f:
        f.write(BK_ASP + '\n' + bk)


def make_aleph(bk, pos, neg, trial_):
    Path(f'{fpath}/aleph/').mkdir(parents=True, exist_ok=True)
    with open(f"{fpath}/aleph/{trial_}.pl", 'w+') as f:
        with open("data/aleph-zendo.pl") as tmp:
            f.write(tmp.read() + '\n')
        f.write(':-begin_bg.\n')
        f.write(bk + '\n')
        f.write(':-end_bg.\n')
        f.write(':-begin_in_pos.\n')
        for x in pos:
            x = x[4:].replace('))',')')
            f.write(x + '\n')
        f.write(':-end_in_pos.\n')
        f.write(':-begin_in_neg.\n')
        for x in neg:
            x = x[4:].replace('))',')')
            f.write(x + '\n')
        f.write(':-end_in_neg.\n')


def make_louise(bk, pos, neg, trial_):
    # Path(f'{fpath}/louise/').mkdir(parents=True, exist_ok=True)
    with open(f"./data/zendo1/data/louise/{trial_}.pl", 'w+') as f:
        with open("data/exp-file-zendo.pl") as tmp:
            f.write(tmp.read() + '\n')
        f.write(bk + '\n')
        for x in pos:
            f.write(x + '\n')
        for x in neg:
            f.write(x + '\n')
