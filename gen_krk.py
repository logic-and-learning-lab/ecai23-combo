
import random
from pathlib import Path


WHITE = 'w'
BLACK = 'b'
COLORS = [WHITE, BLACK]

ROOK = 'r'
KING = 'k'
TYPES = [ROOK, KING]

DISTANCE = 1

MIN_BOARD = 1
MAX_BOARD = 8

# TARGETS

# krk1
# f(A):-cell(A,B,C,D),white(C),cell(A,E,C,F),rook(D),king(F),distance(B,E,G),one(G).

# krk2
# f(A):-cell(A,B,C,D),white(C),cell(A,E,F,D),king(D),black(F),samerank(B,E),nextfile(B,G),nextfile(G,E).
# f(A):-cell(A,B,C,D),white(C),cell(A,E,F,D),king(D),black(F),samerank(B,E),nextfile(E,G),nextfile(G,B).
# f(A):-cell(A,B,C,D),white(C),cell(A,E,F,D),king(D),black(F),samefile(B,E),nextrank(B,G),nextrank(G,E).
# f(A):-cell(A,B,C,D),white(C),cell(A,E,F,D),king(D),black(F),samefile(B,E),nextrank(F,G),nextrank(G,B).

# krk3
# f(A):-cell(A,B,C,D),white(C),cell(A,E,F,G),rook(D),king(G),black(F),samerank(B,E).
# f(A):-cell(A,B,C,D),white(C),cell(A,E,F,G),rook(D),king(G),black(F),samefile(B,E).

def generate_example_krk(task, splits, start, n, trial_):

    fpath = f'data/{task}/data'
    for split in splits:
        all_bk = []
        all_exs, pos, neg = [], [], []
        for i in range(start, start+n//2):
            if task == 'krk1':
                generator = generate_example_pos_krk1
            elif task == 'krk2':
                generator = generate_example_pos_krk2
            elif task == 'krk3':
                generator = generate_example_pos_krk3
            ex, bk_ = generator(i)
            all_bk.extend(bk_)
            all_exs.append(ex)
            pos.append(ex)

        for i in range(start+n//2, start+n):
            if task == 'krk1':
                generator = generate_example_neg_krk1
            elif task == 'krk2':
                generator = generate_example_neg_krk2
            elif task == 'krk3':
                generator = generate_example_neg_krk3
            ex, bk_ = generator(i)
            all_bk.extend(bk_)
            all_exs.append(ex)
            neg.append(ex)

        bk = ''.join(all_bk)
        exs = '\n'.join(all_exs)
        write_bk(fpath, bk, split, trial_)
        write_exs(fpath, exs, split, trial_)
        if split == "train":
            make_aleph(fpath, task, bk, pos, neg, trial_)
            make_louise(fpath, task, bk, pos, neg, trial_)


def generate_example_pos_krk1(i):
    file1 = random.randrange(MIN_BOARD, MAX_BOARD+1)
    rank1 = random.randrange(MIN_BOARD, MAX_BOARD+1)
    (rank2, file2) = random_position_different_from([(rank1, file1)])
    (rank3, file3) = random_position_different_from_distance_1([(rank1, file1), (rank2, file2)], (rank1, file1))
    return f"pos(f({i})).", [f"cell({i},[{rank1}, {file1}], w, r).\n",
           f"cell({i},[{rank2}, {file2}], b, k).\n",
           f"cell({i},[{rank3}, {file3}], w, k).\n"]


def generate_example_neg_krk1(i):
    rank1, file1, color1, type1 = generate_piece_neg_example_krk1([], [], [])
    wr, wk = add_to_existing_pieces([], [], rank1, file1, color1, type1)
    rank2, file2, color2, type2 = generate_piece_neg_example_krk1([(rank1, file1)], wr, wk)
    wr, wk = add_to_existing_pieces(wr, wk, rank2, file2, color2, type2)
    rank3, file3, color3, type3 = generate_piece_neg_example_krk1([(rank1, file1), (rank2, file2)], wr, wk)
    return f"neg(f({i})).", [f"cell({i},[{rank1}, {file1}], {color1}, {type1}).\n",
           f"cell({i},[{rank2}, {file2}], {color2}, {type2}).\n",
           f"cell({i},[{rank3}, {file3}], {color3}, {type3}).\n"]


def generate_piece_neg_example_krk1(other_pieces, wr, wk):
    piece_color = random.choice(COLORS)
    piece_type = random.choice(TYPES)
    if (piece_color, piece_type) == (WHITE, ROOK):
        (rank, file) = random_position_different_from_distance_geq_1(other_pieces, wk)
    elif (piece_color, piece_type) == (WHITE, KING):
        (rank, file) = random_position_different_from_distance_geq_1(other_pieces, wr)
    else:
        (rank, file) = random_position_different_from(other_pieces)
    return rank, file, piece_color, piece_type


def add_to_existing_pieces(wr, wk, rank, file, piece_color, piece_type):
    if (piece_color, piece_type) == (WHITE, ROOK):
        wr += [(rank, file)]
    elif (piece_color, piece_type) == (WHITE, KING):
        wk += [(rank, file)]
    return wr, wk


def random_position_different_from(pieces):
    return random.choice([(i, j) for i in range(MIN_BOARD, MAX_BOARD+1) for j in range(MIN_BOARD, MAX_BOARD+1)
                          if (i, j) not in pieces])


def random_position_different_from_distance_1(pieces, position):
    (rank, file) = position
    return random.choice([(i, j) for i in [rank - 1, rank, rank + 1] for j in [file - 1, file, file + 1]
                          if (i, j) not in pieces and MIN_BOARD <= i <= MAX_BOARD and MIN_BOARD <= j <= MAX_BOARD])


def random_position_different_from_distance_geq_1(pieces, positions):
    return random.choice([(i, j) for i in range(MIN_BOARD, MAX_BOARD+1) for j in range(MIN_BOARD, MAX_BOARD+1)
                          if ((i, j) not in pieces and all([distance(i, j, a, b) > DISTANCE for (a, b) in positions]))])


def distance(rank1, file1, rank2, file2):
    return max([abs(rank1-rank2), abs(file1-file2)])


def generate_example_pos_krk2(i):
    pos_generate_functions = [generate_opposition_samerank, generate_opposition_samefile]
    bk = random.choice(pos_generate_functions)(i)
    return f"pos(f({i})).", bk


def generate_opposition_samerank(i):
    rank = random.randint(1, 8)
    file1 = random.randint(1, 8)
    file2 = random.choice([j for j in [file1 - 2, file1 + 2] if 1 <= j <= 8])
    (rank3, file3) = random.choice([(i, j) for i in range(1, 9) for j in range(1, 9) if (i, j) != (rank, file1)
                                    and (i, j) != (rank, file2)])
    return [f"cell({i},[{rank}, {file1}], w, k).\n",
           f"cell({i},[{rank}, {file2}], b, k).\n",
           f"cell({i},[{rank3}, {file3}], w, r).\n"]


def generate_opposition_samefile(i):
    file = random.randint(1, 8)
    rank1 = random.randint(1, 8)
    rank2 = random.choice([j for j in [rank1 - 2, rank1 + 2] if 1 <= j <= 8])
    (rank3, file3) = random.choice([(i, j) for i in range(1, 9) for j in range(1, 9) if (i, j) != (rank1, file)
                                    and (i, j) != (rank2, file)])
    return [f"cell({i},[{rank1}, {file}], w, k).\n",
        f"cell({i},[{rank2}, {file}], b, k).\n" ,
        f"cell({i},[{rank3}, {file3}], w, r).\n"]


def generate_example_neg_krk2(i):
    rank1, file1, color1, type1 = generate_piece_not_opposition([], [], [])
    bk, wk = add_opposition([], [], rank1, file1, color1, type1)
    rank2, file2, color2, type2 = generate_piece_not_opposition([(rank1, file1)], bk, wk)
    bk, wk = add_opposition(bk, wk, rank2, file2, color2, type2)
    rank3, file3, color3, type3 = generate_piece_not_opposition([(rank1, file1), (rank2, file2)], bk, wk)
    return f"neg(f({i})).", [f"cell({i},[{rank1}, {file1}], {color1}, {type1}).\n",
        f"cell({i},[{rank2}, {file2}],  {color2}, {type2}).\n",
        f"cell({i},[{rank3}, {file3}], {color3}, {type3}).\n"]


def add_opposition(bk, wk, rank, file, color, piece_type):
    if (color, piece_type) == ("b", "k"):
        bk += [(rank, file)]
    elif (color, piece_type) == ("w", "k"):
        wk += [(rank, file)]
    return bk, wk


def generate_piece_not_opposition(other_pieces, bk, wk):
    color = random.choice(['w', 'b'])
    piece_type = random.choice(['r', 'k'])
    if (color, piece_type) == ('b', 'k'):
        (rank, file) = random.choice([(i, j) for i in range(1, 9) for j in range(1, 9) if ((i, j) not in other_pieces
                                      and all([not_opposition(i, j, a, b) for (a, b) in wk]))])
    elif (color, piece_type) == ('w', 'k'):
        (rank, file) = random.choice([(i, j) for i in range(1, 9) for j in range(1, 9) if (i, j) not in other_pieces
                                      and all([not_opposition(i, j, a, b) for (a, b) in bk])])
    else:
        (rank, file) = random.choice([(i, j) for i in range(1, 9) for j in range(1, 9) if (i, j) not in other_pieces])
    return rank, file, color, piece_type


def not_opposition(x1, y1, x2, y2):
    if x1 == x2 and ((y1 == y2-2) or (y1 == y2+2)):
        return False
    elif y1 == y2 and ((x1 == x2-2) or (x1 == x2+2)):
        return False
    return True


def generate_example_pos_krk3(i):
    pos_generate_functions = [pos_generate_functions_samerank, pos_generate_functions_samefile]
    bk = random.choice(pos_generate_functions)(i)
    return f"pos(f({i})).", bk


def pos_generate_functions_samerank(i):
    rank = random.randint(1, 8)
    file1 = random.randint(1, 8)
    file2 = random.choice([j for j in range(1, 9) if j != file1])
    (rank3, file3) = random.choice([(i, j) for i in range(1, 9) for j in range(1, 9) if (i, j) != (rank, file1)
                                    and (i, j) != (rank, file2)])
    return [f"cell({i},[{rank}, {file1}], w, r).\n",
           f"cell({i},[{rank}, {file2}], b, k).\n",
           f"cell({i},[{rank3}, {file3}], w, k).\n"]


def pos_generate_functions_samefile(i):
    file = random.randint(1, 8)
    rank1 = random.randint(1, 8)
    rank2 = random.choice([j for j in range(1, 9) if j != rank1])
    (rank3, file3) = random.choice([(i, j) for i in range(1, 9) for j in range(1, 9) if (i, j) != (rank1, file)
                                    and (i, j) != (rank2, file)])
    return [f"cell({i},[{rank1}, {file}], w, r).\n",
           f"cell({i},[{rank2}, {file}], b, k).\n",
           f"cell({i},[{rank3}, {file3}], w, k).\n"]


def generate_example_neg_krk3(i):
    rank1, file1, color1, type1 = generate_piece_diff_pos([], [], [], [], [])
    ranks_wr, ranks_bk, files_wr, files_bk = add([], [], [], [], rank1, file1, color1, type1)
    rank2, file2, color2, type2 = generate_piece_diff_pos([(rank1, file1)], ranks_wr, ranks_bk, files_wr, files_bk)
    ranks_wr, ranks_bk, files_wr, files_bk = add(ranks_wr, ranks_bk, files_wr, files_bk, rank2, file2, color2, type2)
    rank3, file3, color3, type3 = generate_piece_diff_pos([(rank1, file1), (rank2, file2)], ranks_wr, ranks_bk,
                                                          files_wr, files_bk)
    return f"neg(f({i})).", [f"cell({i},[{rank1}, {file1}], {color1}, {type1}).\n",
           f"cell({i},[{rank2}, {file2}], {color2}, {type2}).\n",
           f"cell({i},[{rank3}, {file3}], {color3}, {type3}).\n"]


def generate_piece_diff_pos(set, ranks_wr, ranks_bk, files_wr, files_bk):
    color = random.choice(['w', 'b'])
    piece_type = random.choice(['r', 'k'])
    ranks, files = [], []
    if (color, piece_type) == ('w', 'r'):
        ranks += ranks_bk
        files += files_bk
    elif (color, piece_type) == ('b', 'k'):
        ranks += ranks_wr
        files += files_wr
    (rank, file) = random.choice([(i, j) for i in range(1, 9) for j in range(1, 9) if i not in ranks and
                                  j not in files and (i, j) not in set])
    return rank, file, color, piece_type


def add(ranks_wr, ranks_bk, files_wr, files_bk, rank, file, color, piece_type):
    if (color, piece_type) == ("w", "r"):
        ranks_wr += [rank]
        files_wr += [file]
    elif (color, piece_type) == ("b", "k"):
        ranks_bk += [rank]
        files_bk += [file]
    return ranks_wr, ranks_bk, files_wr, files_bk


def write_exs(fpath, exs, split, trial_):
    with open(f"{fpath}/{split}/exs-{trial_}.pl", 'w') as f:
        f.write(exs)


def write_bk(fpath, bk, split, trial_):
    Path(f"{fpath}/{split}/").mkdir(parents=True, exist_ok=True)
    with open(f"data/bk-krk.pl", 'r') as tmp:
        initial_bk = "".join(tmp.readlines())
    with open(f"{fpath}/{split}/bk-swi-{trial_}.pl", 'w') as f:
        f.write(":-style_check(-discontiguous).\n")
        f.write(initial_bk + '\n' + bk)
    # with open(f"{fpath}/{split}/bk-asp-{trial_}.pl", 'w') as f:
    #     f.write(initial_bk + '\n' + bk)


def make_aleph(fpath, task, bk, pos, neg, trial_):
    Path(f'{fpath}/aleph/').mkdir(parents=True, exist_ok=True)
    with open(f"{fpath}/aleph/{trial_}.pl", 'w+') as f:
        with open(f"data/aleph-{task}.pl") as tmp:
            f.write(tmp.read() + '\n')
        f.write(':-begin_bg.\n')
        with open(f"data/bk-krk.pl", 'r') as tmp:
            f.write(tmp.read() + '\n')
        f.write(bk + '\n')
        f.write(':-end_bg.\n')
        f.write(':-begin_in_pos.\n')
        for x in pos:
            x = x[4:].replace('))', ')')
            f.write(x + '\n')
        f.write(':-end_in_pos.\n')
        f.write(':-begin_in_neg.\n')
        for x in neg:
            x = x[4:].replace('))', ')')
            f.write(x + '\n')
        f.write(':-end_in_neg.\n')



def make_louise(fpath, task, bk, pos, neg, trial_):
    Path(f'{fpath}/louise/').mkdir(parents=True, exist_ok=True)
    with open(f"{fpath}/louise/{trial_}.pl", 'w+') as f:
        with open(f"data/exp-file-{task}.pl") as tmp:
            f.write(tmp.read() + '\n')
        with open(f"data/bk-krk.pl", 'r') as tmp:
            f.write(tmp.read() + '\n')
        f.write(bk + '\n')
        for x in pos:
            f.write(x + '\n')
        for x in neg:
            f.write(x + '\n')
