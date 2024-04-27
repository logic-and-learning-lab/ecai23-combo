    #!/usr/bin/env python3
import os
import sys
import psutil
import pathlib
import subprocess
import numpy as np
import scipy.stats as stats
# import dcc.split
import dcc2.dcc
import dcc2.util
import dcc.utils
import popper2.util
import popper2.loop
from pyswip import Prolog
from multiprocessing.pool import Pool, ThreadPool
from multiprocessing import Process
import multiprocessing
import gen_data
import time
import pathlib
import logging
import random
import math
from datetime import datetime
from gen_zendodata1 import generate_example_zendo1
from gen_zendodata2 import generate_example_zendo2
from gen_zendodata3 import generate_example_zendo3
from gen_zendodata4 import generate_example_zendo4
from gen_krk import generate_example_krk
import gen_graphdata

NUM_TRAIN_EXAMPLES = 20
NUM_TEST_EXAMPLES = 1000

GRAPH_TASKS = ['adjacent_to_red', 'connectedness', 'cyclic', 'graph_colouring', 'undirected_edge', 'two_children']

NUM_CPUS = 1
# NUM_CPUS = 4
# NUM_CPUS = 2
# NUM_CPUS = 16
# NUM_CPUS = 8
# NUM_CPUS = 12
# NUM_CPUS = 10
# NUM_CPUS = 5
# TIMEOUT = 300
# TIMEOUTS = [60]
# TIMEOUT = 60
# TIMEOUT = 600
TIMEOUT = 3600 # 1hr

TRIALS = [1,2,3,4,5,6,7,8,9,10]
# TRIALS = [4,5]
# TRIALS = [1,2,3]
TASKS = []

TASKS += ['trains1']
TASKS += ['trains2']
TASKS += ['trains3']
TASKS += ['trains4']

TASKS += ['zendo1']
TASKS += ['zendo2']
TASKS += ['zendo3']
TASKS += ['zendo4']

TASKS += ['imdb1']
TASKS += ['imdb2']
TASKS += ['imdb3']

TASKS += ['krk1']
TASKS += ['krk2']
TASKS += ['krk3']

TASKS += ['iggp-minimal-decay']
TASKS += ['iggp-buttons']
TASKS += ['iggp-rps']
TASKS += ['iggp-coins']
TASKS += ['iggp-buttons-goal']
TASKS += ['iggp-coins-goal']
TASKS += ['iggp-attrition']
TASKS += ['iggp-centipede']

TASKS += ['adjacent_to_red'] # SEE README
TASKS += ['connectedness'] # SEE README
TASKS += ['cyclic'] # SEE README
TASKS += ['graph_colouring'] # SEE README
TASKS += ['undirected_edge'] # SEE README
TASKS += ['two_children'] # SEE README

TASKS += ['dropk']
TASKS += ['droplast']
TASKS += ['evens']
TASKS += ['finddup']
TASKS += ['last']
TASKS += ['contains2']
TASKS += ['len']
TASKS += ['reverse']
TASKS += ['sorted']
TASKS += ['sumlist']

path = pathlib.Path().resolve()

def partmap(func, jobs, num_cups = NUM_CPUS):
    with ThreadPool(num_cups) as p:
        return list(p.map(func, jobs))

def get_time():
    now = datetime.now()
    current_time = now.strftime("%H:%M:%S")
    return current_time

# # old and horrible code
def call_(cmd, action=None, timeout=None):
    cmd = cmd.split(' ')
    p = subprocess.Popen(cmd, stdin=subprocess.PIPE, stdout=subprocess.PIPE)
    if action != None:
        p.stdin.write(action.encode('utf-8'))
    try:
        output, _err = p.communicate(timeout = timeout)
        return output.decode()
    except subprocess.TimeoutExpired:
        pass
    finally:
        try:
            parent = psutil.Process(p.pid)
            for child in parent.children(recursive=True):
                child.kill()
        except psutil.NoSuchProcess:
            pass
        p.kill()

def call_prolog(files, action, timeout):
    files = ','.join((f"'{x}'" for x in files))
    cmd = f"load_files([{files}],[silent(true)]). {action}."
    # print(cmd)
    return call_('swipl -q', cmd, timeout)

def train_metagol(settings):
    task = settings.task
    trial = settings.trial
    metarules = 'metarules'
    if 'iggp' in task:
        ex_file = f'data/{task}/data/train/exs.pl'
        prim_file = f'data/{task}/metagol.pl'
        bk_file = f'data/{task}/data/train/bk.pl'
    elif 'train' in task:
        ex_file = f'data/{task}/data/train/{trial}.pl'
        prim_file = f'data/prims-trains.pl'
        bk_file = f'data/bk-trains.pl'
    elif 'imdb' in task:
        ex_file = f'data/{task}/data/train/{trial}.pl'
        prim_file = f'data/prims-imdb.pl'
        bk_file = f'data/{task}/bk.pl'
    elif task in GRAPH_TASKS:
        ex_file = f'data/{task}/data/train/{trial}.pl'
        with open(f'data/{task}/data/train/prim-{trial}.pl', 'w+') as f:
            with open(f'data/prims-graph.pl') as initial_bk:
                f.write(initial_bk.read() + '\n')
            if task in ['connectedness']:
                f.write("body_pred(diff/2).\n")
        prim_file = f'data/{task}/data/train/prim-{trial}.pl'
        bk_file = f'data/{task}/data/train/bk_{trial}.pl'
        if task in ['connectedness', 'cyclic']:
            metarules = 'metarules-rec'
    elif "zendo" in task:
        ex_file = f'data/{task}/data/train/exs-{trial}.pl'
        prim_file = f'data/prims-zendo.pl'
        bk_file = f'data/{task}/data/train/bk-swi-{trial}.pl'
    elif "krk" in task:
        ex_file = f'data/{task}/data/train/exs-{trial}.pl'
        prim_file = f'data/prims-{task}.pl'
        bk_file = f'data/{task}/data/train/bk-swi-{trial}.pl'
    else:
        ex_file = f'data/{task}/data/train/{trial}.pl'
        prim_file = f'data/prims-lists.pl'
        bk_file = f'data/bk-lists.pl'
        metarules = 'metarules-rec'

    load_files = ['metagol', prim_file, metarules, ex_file, bk_file]
    t1 = time.time()
    prog = call_prolog(load_files, 'run', settings.timeout)
    t2 = time.time()
    if prog != None:
        prog = [x for x in prog.split('\n') if ':-' in x]
    save_prog(settings, prog, t2-t1)


def train_louise(settings):
    task = settings.task
    trial = settings.trial
    target = settings.target
    # train_file = f'{path}/data/{task}/data/louise/{trial}.pl'
    if "iggp" in task:
        train_file = f'./data/{task}/louise.pl'
    else:
        train_file = f'./data/{task}/data/louise/{trial}.pl'
    load_files = ['./run_louise.pl']
    t1 = time.time()
    prog = call_prolog(load_files, f'run("{train_file}", {target})', settings.timeout)
    t2 = time.time()
    if prog != None:
        prog = [x for x in prog.split('\n') if x.startswith(target[:-2])]
        print(prog)
    save_prog(settings, prog, t2-t1)


def train_aleph(settings):
    task = settings.task
    trial = settings.trial
    if 'iggp' in task:
        train_file = f'{path}/data/{task}/aleph.pl'
    else:
        train_file = f'{path}/data/{task}/data/aleph/{trial}.pl'
    cmd = "induce(P),writeln('<PROG>'),numbervars(P,0,_),foreach(member(C,P),(write(C),write('. '))),writeln('</PROG>'),halt"
    load_files = [train_file]
    t1 = time.time()
    try:
        prog = call_prolog(load_files, cmd, settings.timeout)
    except:
        prog = None
    t2 = time.time()
    if prog != None:
        xs = prog.split('<PROG>')
        if len(xs) > 1:
            prog = xs[1].split('</PROG>')[0]
            prog = prog.replace('\n', ' ')
            prog = [x.strip() for x in prog.split('.') if len(x.strip()) > 0]
        else:
            prog = None
    save_prog(settings, prog, t2-t1)

def train_popper(settings):
    if 'iggp' in settings.task:
        train_iggp(settings)
    elif 'train' in settings.task:
        train_trains(settings)
    elif 'imdb' in settings.task:
        train_imdb(settings)
    elif 'zendo' in settings.task:
        train_zendo(settings)
    elif 'krk' in settings.task:
        train_krk(settings)
    elif settings.task in GRAPH_TASKS:
        train_graph(settings)
    else:
        train_lists(settings)
    t1 = time.time()
    # prog = dcc.split.runner(settings)
    prog = dcc2.dcc.runner(settings)
    # print(prog)
    # print(type(prog))
    t2 = time.time()
    if prog != None:
        prog = dcc2.util.format_program_(prog)
        # prog = dcc.split.prog_to_code(prog)
        # print(prog)
        # print(t2-t1,prog)
    save_prog(settings, prog, t2-t1)

def train_popper2(settings):
    if 'iggp' in settings.task:
        train_iggp(settings)
    elif 'train' in settings.task:
        train_trains(settings)
    elif 'imdb' in settings.task:
        train_imdb(settings)
    elif 'zendo' in settings.task:
        train_zendo(settings)
    elif 'krk' in settings.task:
        train_krk(settings)
    elif settings.task in GRAPH_TASKS:
        train_graph(settings)
    else:
        train_lists(settings)
    t1 = time.time()

    settings2 = popper2.util.Settings(ex_file = settings.ex_file, bk_file=settings.bk_file, bias_file=settings.bias_file, timeout=settings.timeout, info=False, debug=False)
    prog = popper2.loop.learn_solution(settings2)
    t2 = time.time()
    if prog != None:
        # print('P1')
        # for rule in prog:
            # print(popper2.util.format_rule(rule))
        # print('P2')
        # for rule in prog:
            # print(popper2.util.format_rule(popper2.util.order_rule(rule)))
        # print('P3')
        # for rule in popper2.util.order_prog(prog):
            # print(popper2.util.format_rule(popper2.util.order_rule(rule)))
        prog = [popper2.util.format_rule(popper2.util.order_rule(rule)) for rule in popper2.util.order_prog(prog)]
        # print('P2',prog)
        # for r in prog:
            # print(r)
    save_prog(settings, prog, t2-t1)

def gen_aleph_input(pos, neg, bk_file, bias_file, out_file):
    with open(out_file, 'w') as f:
        # read general aleph settings
        with open(bias_file) as tmp:
            f.write(tmp.read() + '\n')
        f.write(':-begin_bg.\n')
        with open(bk_file) as tmp:
            f.write(tmp.read() + '\n')
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


def gen_louise_input(pos, neg, bk_file, bias_file, out_file, bk=None):
    with open(out_file, 'w') as f:
        with open(bias_file) as tmp:
            f.write(tmp.read() + '\n')
        with open(bk_file) as tmp:
            f.write(tmp.read() + '\n')
        if bk:
            f.write(bk)
        for x in pos:
            f.write(x + '\n')
        for x in neg:
            f.write(x + '\n')

def gen_list_data():
    probs = []
    # probs += [('dropk', gen_data.DropK)]
    # probs += [('droplast', gen_data.DropLast)]
    # probs += [('evens', gen_data.Evens)]
    # probs += [('finddup', gen_data.FindDupl)]
    # probs += [('last', gen_data.Last)]
    # probs += [('len', gen_data.Len)]
    # probs += [('member', gen_data.Member)]
    probs += [('sorted', gen_data.Sorted)]
    # probs += [('sumlist', gen_data.SumList)]
    # probs += [('reverse', gen_data.Reverse)]
    # probs += [('contains2', gen_data.Contains2)]
    # probs += [('contains3', gen_data.Contains3)]

    for (task, _) in probs:
        with open(f'data/{task}/all-bias.pl', 'w') as f:
            with open(f'data/bias-list.pl') as tmp:
                for line in tmp:
                    f.write(line)
            f.write('\n')
            with open(f'data/{task}/bias.pl') as tmp:
                for line in tmp:
                    f.write(line)

    for (task, x) in probs:
        pathlib.Path(f'{path}/data/{task}/data/train/').mkdir(parents=True, exist_ok=True)
        pathlib.Path(f'{path}/data/{task}/data/test/').mkdir(parents=True, exist_ok=True)
        pathlib.Path(f'{path}/data/{task}/data/programs').mkdir(parents=True, exist_ok=True)
        pathlib.Path(f'{path}/data/{task}/data/results').mkdir(parents=True, exist_ok=True)
        for trial in TRIALS:
            print(get_time(),f'GEN DATA: task:{task}\t trial:{trial}')
            # TRAIN DATA
            train_ex_file = f'{path}/data/{task}/data/train/{trial}.pl'
            train_pos = [x.gen_pos() for i in range(NUM_TRAIN_EXAMPLES)]
            train_neg = [x.gen_neg() for i in range(NUM_TRAIN_EXAMPLES)]
            with open(train_ex_file, 'w') as f:
                for ex in train_pos:
                    f.write(f'pos({ex}).\n')
                for ex in train_neg:
                    f.write(f'neg({ex}).\n')

            # TEST DATA
            train_ex_file = f'{path}/data/{task}/data/test/{trial}.pl'
            test_pos = [x.gen_pos() for i in range(NUM_TEST_EXAMPLES)]
            test_neg = [x.gen_neg() for i in range(NUM_TEST_EXAMPLES)]
            with open(train_ex_file, 'w') as f:
                for ex in test_pos:
                    f.write(f'pos({ex}).\n')
                for ex in test_neg:
                    f.write(f'neg({ex}).\n')

            # WRITE ALEPH INPUT

            pathlib.Path(f'{path}/data/{task}/data/aleph/').mkdir(parents=True, exist_ok=True)
            train_ex_file = f'{path}/data/{task}/data/aleph/{trial}.pl'
            with open(train_ex_file, 'w') as f:
                # read general aleph settings
                with open('aleph-lists.pl') as tmp:
                    f.write(tmp.read() + '\n')
                # read task-specific aleph settings
                with open(f'{path}/data/{task}/aleph.pl') as tmp:
                    f.write(tmp.read() + '\n')
                f.write(':-begin_bg.\n')
                with open('data/bk-lists.pl') as tmp:
                    f.write(tmp.read() + '\n')
                f.write(':-end_bg.\n')
                f.write(':-begin_in_pos.\n')
                for ex in train_pos:
                    f.write(ex + '.\n')
                f.write(':-end_in_pos.\n')
                f.write(':-begin_in_neg.\n')
                for ex in train_neg:
                    f.write(ex + '.\n')
                f.write(':-end_in_neg.\n')

            pathlib.Path(f'{path}/data/{task}/data/louise/').mkdir(parents=True, exist_ok=True)
            train_ex_file = f'{path}/data/{task}/data/louise/{trial}.pl'
            train_pos = [f'pos({ex}).' for ex in train_pos]
            train_neg = [f'neg({ex}).' for ex in train_neg]
            gen_louise_input(train_pos, train_neg, 'data/bk-lists.pl', f'data/exp-file-list.pl', train_ex_file)

def gen_zendo_data():
    tasks = ["zendo1"]
    tasks += ["zendo2"]
    tasks += ["zendo3"]
    tasks += ["zendo4"]
    for task in tasks:
        if task == 'zendo1':
            for t in TRIALS:
                print(get_time(), f'GEN DATA: task:{task}\t trial:{t}')
                generate_example_zendo1(["train"], 0, 2*NUM_TRAIN_EXAMPLES, t)
                generate_example_zendo1(["test"], 2*NUM_TRAIN_EXAMPLES, 2*NUM_TEST_EXAMPLES, t)
        elif task == 'zendo2':
            for t in TRIALS:
                print(get_time(), f'GEN DATA: task:{task}\t trial:{t}')
                generate_example_zendo2(["train"], 0, 2*NUM_TRAIN_EXAMPLES, t)
                generate_example_zendo2(["test"], 2*NUM_TRAIN_EXAMPLES, 2*NUM_TEST_EXAMPLES, t)
        elif task == 'zendo3':
            for t in TRIALS:
                print(get_time(), f'GEN DATA: task:{task}\t trial:{t}')
                generate_example_zendo3(["train"], 0, 2*NUM_TRAIN_EXAMPLES, t)
                generate_example_zendo3(["test"], 2*NUM_TRAIN_EXAMPLES, 2*NUM_TEST_EXAMPLES, t)
        elif task == 'zendo4':
            for t in TRIALS:
                print(get_time(), f'GEN DATA: task:{task}\t trial:{t}')
                generate_example_zendo4(["train"], 0, 2*NUM_TRAIN_EXAMPLES, t)
                generate_example_zendo4(["test"], 2*NUM_TRAIN_EXAMPLES, 2*NUM_TEST_EXAMPLES, t)


def gen_krk_data():
    tasks = ["krk1"]
    tasks += ["krk2"]
    tasks += ["krk3"]
    for task in tasks:
        if task == 'krk1':
            for t in TRIALS:
                print(get_time(), f'GEN DATA: task:{task}\t trial:{t}')
                generate_example_krk("krk1", ["train"], 0, 2*NUM_TRAIN_EXAMPLES, t)
                generate_example_krk("krk1", ["test"], 2*NUM_TRAIN_EXAMPLES, 2*NUM_TEST_EXAMPLES, t)
        elif task == 'krk2':
            for t in TRIALS:
                print(get_time(), f'GEN DATA: task:{task}\t trial:{t}')
                generate_example_krk("krk2", ["train"], 0, 2*NUM_TRAIN_EXAMPLES, t)
                generate_example_krk("krk2", ["test"], 2*NUM_TRAIN_EXAMPLES, 2*NUM_TEST_EXAMPLES, t)
        elif task == 'krk3':
            for t in TRIALS:
                print(get_time(), f'GEN DATA: task:{task}\t trial:{t}')
                generate_example_krk("krk3", ["train"], 0, 2*NUM_TRAIN_EXAMPLES, t)
                generate_example_krk("krk3", ["test"], 2*NUM_TRAIN_EXAMPLES, 2*NUM_TEST_EXAMPLES, t)


def gen_graph_data():
    probs = []
    probs += [('adjacent_to_red', gen_graphdata.AdjacentToRed)]
    probs += [('cyclic', gen_graphdata.Cyclic)]
    probs += [('connectedness', gen_graphdata.Connectedness)]
    probs += [('undirected_edge', gen_graphdata.UndirectedEdge)]
    probs += [('two_children', gen_graphdata.TwoChildren)]
    probs += [('graph_colouring', gen_graphdata.GraphColouring)]


    for (task, _) in probs:
        pathlib.Path(f'{path}/data/{task}').mkdir(parents=True, exist_ok=True)
        with open(f'data/{task}/bias.pl', 'w+') as f:
            with open(f'data/bias-graph.pl') as tmp:
                for line in tmp:
                    f.write(line)
            f.write('\n')
            if task in ['cyclic', 'connectedness']:
                f.write("enable_recursion.\n")
            if task not in ['undirected_edge', 'connectedness']:
                f.write("head_pred(f,1).\n")
                f.write("type(f,(node,)).\n")
                f.write("direction(f,(in,)).\n")
            else:
                f.write("head_pred(f,2).\n")
                f.write("type(f,(node,node)).\n")
                f.write("direction(f,(in,out)).\n")
            if task in ['two_children']:
                f.write("body_pred(diff,2).\n")
                f.write("type(diff,(node,node)).\n")
                f.write("direction(diff,(in,in)).\n")


            with open(f'{path}/data/{task}/bias.pl', "w+") as tmp:
                for line in tmp:
                    f.write(line)

    for (task, x) in probs:
        pathlib.Path(f'{path}/data/{task}/data/train/').mkdir(parents=True, exist_ok=True)
        pathlib.Path(f'{path}/data/{task}/data/test/').mkdir(parents=True, exist_ok=True)
        pathlib.Path(f'{path}/data/{task}/data/programs').mkdir(parents=True, exist_ok=True)
        pathlib.Path(f'{path}/data/{task}/data/results').mkdir(parents=True, exist_ok=True)
        for trial in TRIALS:
            print(get_time(),f'GEN DATA: task:{task}\t trial:{trial}')
            # TRAIN DATA
            train_ex_file = f'{path}/data/{task}/data/train/{trial}.pl'
            train_bk_file = f'{path}/data/{task}/data/train/bk_{trial}.pl'
            train_pos = [x.gen_pos(i) for i in range(0, NUM_TRAIN_EXAMPLES)]
            train_neg = [x.gen_neg(i) for i in range(NUM_TRAIN_EXAMPLES, 2*NUM_TRAIN_EXAMPLES)]
            with open(train_ex_file, 'w') as f:
                for _, ex in train_pos:
                    f.write(f'pos({ex}).\n')
                for _, ex in train_neg:
                    f.write(f'neg({ex}).\n')
            with open(train_bk_file, 'w') as f:
                with open(f'{path}/data/bk-graph.pl', 'r') as base:
                    for line in base:
                        f.write(line)
                for bk, _ in train_pos:
                    f.write(gen_graphdata.bk_exs(bk))
                for bk, _ in train_neg:
                    f.write(gen_graphdata.bk_exs(bk))

            # TEST DATA
            test_ex_file = f'{path}/data/{task}/data/test/{trial}.pl'
            test_bk_file = f'{path}/data/{task}/data/test/bk_{trial}.pl'
            test_pos = [x.gen_pos(i) for i in range(2*NUM_TRAIN_EXAMPLES, 2*NUM_TRAIN_EXAMPLES+NUM_TEST_EXAMPLES)]
            test_neg = [x.gen_neg(i) for i in range(2*NUM_TRAIN_EXAMPLES+NUM_TEST_EXAMPLES, 2*NUM_TRAIN_EXAMPLES+2*NUM_TEST_EXAMPLES)]
            with open(test_ex_file, 'w') as f:
                for _, ex in test_pos:
                    f.write(f'pos({ex}).\n')
                for _, ex in test_neg:
                    f.write(f'neg({ex}).\n')
            with open(test_bk_file, 'w') as f:
                with open(f'{path}/data/bk-graph.pl', 'r') as base:
                    for line in base:
                        f.write(line)
                for bk, _ in test_pos:
                    f.write(gen_graphdata.bk_exs(bk))
                for bk, _ in test_neg:
                    f.write(gen_graphdata.bk_exs(bk))

            # WRITE ALEPH INPUT

            pathlib.Path(f'{path}/data/{task}/data/aleph/').mkdir(parents=True, exist_ok=True)
            train_ex_file = f'{path}/data/{task}/data/aleph/{trial}.pl'
            with open(train_ex_file, 'w') as f:
                # read general aleph settings
                with open('aleph-graph.pl') as tmp:
                    f.write(tmp.read() + '\n')
                # read task-specific aleph settings
                with open(f'{path}/data/{task}/aleph.pl') as tmp:
                    f.write(tmp.read() + '\n')
                f.write(':-begin_bg.\n')
                with open('data/bk-graph.pl') as tmp:
                    f.write(tmp.read() + '\n')
                for _, ex in train_pos:
                    f.write(gen_graphdata.bk_exs(bk))
                for _, ex in train_neg:
                    f.write(gen_graphdata.bk_exs(bk))
                f.write(':-end_bg.\n')
                f.write(':-begin_in_pos.\n')
                for _, ex in train_pos:
                    f.write(ex + '.\n')
                f.write(':-end_in_pos.\n')
                f.write(':-begin_in_neg.\n')
                for _, ex in train_neg:
                    f.write(ex + '.\n')
                f.write(':-end_in_neg.\n')

            train_pos1 = [f'pos({ex}).' for _, ex in train_pos]
            train_neg1 = [f'neg({ex}).' for _, ex in train_neg]
            problem_bk = ""
            for bk, _ in train_pos:
                problem_bk += gen_graphdata.bk_exs(bk)
            for bk, _ in train_neg:
                problem_bk += gen_graphdata.bk_exs(bk)
            pathlib.Path(f'{path}/data/{task}/data/louise/').mkdir(parents=True, exist_ok=True)
            train_ex_file = f'{path}/data/{task}/data/louise/{trial}.pl'
            if task == 'two_children':
                exp_file = f'data/exp-file-two_children.pl'
            else:
                exp_file = f'data/exp-file-graph.pl'
            gen_louise_input(train_pos1, train_neg1, 'data/bk-graph.pl', exp_file, train_ex_file, bk=problem_bk)

def partition(xs, rate=80):
    k = int((len(xs) / 100)*rate)
    return xs[:k], xs[k:]

def gen_train_data():
    probs = []
    probs += ['trains1']
    probs += ['trains2']
    probs += ['trains3']
    probs += ['trains4']
    probs += ['imdb1']
    probs += ['imdb2']
    probs += ['imdb3']
    max_samples = {'imdb1':2000, 'imdb2':2000, 'imdb3':2000}
    for task in probs:
        pos = []
        neg = []
        with open(f'data/{task}/exs.pl') as f:
            for line in f:
                line = line.strip()
                if line.startswith('pos'):
                    pos.append(line)
                elif line.startswith('neg'):
                    neg.append(line)

        for trial in TRIALS:
            random.shuffle(pos)
            random.shuffle(neg)
            pos_ = pos
            neg_ = neg

            if task in max_samples:
                pos_ = pos[:max_samples[task]]
                neg_ = neg[:max_samples[task]]

            train_pos, test_pos = partition(pos_)
            train_neg, test_neg = partition(neg_)

            path = f'data/{task}/data/train/'
            pathlib.Path(path).mkdir(parents=True, exist_ok=True)
            with open(f'{path}/{trial}.pl', 'w') as f:
                for x in train_pos + train_neg:
                    f.write(x + '\n')
            path = f'data/{task}/data/test/'
            pathlib.Path(path).mkdir(parents=True, exist_ok=True)
            with open(f'{path}/{trial}.pl', 'w') as f:
                for x in test_pos + test_neg:
                    f.write(x + '\n')

            if 'train' in task:
                path = f'data/{task}/data/aleph/'
                pathlib.Path(path).mkdir(parents=True, exist_ok=True)
                # ALEPH
                gen_aleph_input(pos, neg, 'data/bk-trains.pl', f'data/aleph-trains.pl', f'{path}/{trial}.pl',)

                path = f'data/{task}/data/louise/'
                pathlib.Path(path).mkdir(parents=True, exist_ok=True)
                gen_louise_input(pos, neg, 'data/bk-trains.pl', f'data/exp-file-trains.pl', f'{path}/{trial}.pl')


def get_prog_file(settings):
    path = f'data/{settings.task}/programs'
    pathlib.Path(path).mkdir(parents=True, exist_ok=True)
    fname = f'{path}/{settings.name}-{settings.timeout}-{settings.trial}.csv'
    return fname

def save_prog(settings, prog, duration):
    fname = get_prog_file(settings)
    with open(fname, 'w') as f:
        if prog != None:
            for rule in prog:
                if rule[-1] != '.':
                    rule += '.'
                f.write(rule + '\n')
        f.write(f'%time,{duration}\n')

def save_res(settings, tp, fn, tn, fp):
    path = f'data/{settings.task}/results/'
    pathlib.Path(path).mkdir(parents=True, exist_ok=True)
    fname = f'{path}/{settings.name}-{settings.timeout}-{settings.trial}.csv'
    with open(fname, 'w') as f:
        f.write(f'{tp}, {fn}, {tn}, {fp}')

def test_(settings):
    from multiprocessing import Process
    p = Process(target=test__, args=(settings,))
    p.start()
    p.join()

def test__(settings):
    prolog = Prolog()
    prolog.consult(settings.ex_file)
    prolog.consult(settings.bk_file)
    prolog.consult('test.pl')
    prolog.consult(f'data/{settings.task}/programs/{settings.name}-{settings.timeout}-{settings.trial}.csv')
    t1 = time.time()
    res = list(prolog.query('do_test(TP,FN,TN,FP)'))[0]
    t2 = time.time()
    if (t2-t1) > 1:
        print(settings.task, settings.name, settings.trial, t2-t1)
    save_res(settings, res['TP'], res['FN'], res['TN'], res['FP'])

def train_lists(settings):
    settings.ex_file = f'{path}/data/{settings.task}/data/train/{settings.trial}.pl'
    settings.bias_file = f'{path}/data/{settings.task}/all-bias.pl'
    settings.bk_file = f'{path}/data/bk-lists.pl'

def train_iggp(settings):
    settings.ex_file = f'{path}/data/{settings.task}/data/train/exs.pl'
    settings.bias_file = f'{path}/data/{settings.task}/bias.pl'
    settings.bk_file = f'{path}/data/{settings.task}/data/train/bk.pl'

def train_trains(settings):
    settings.ex_file = f'{path}/data/{settings.task}/data/train/{settings.trial}.pl'
    settings.bias_file = f'{path}/data/bias-trains.pl'
    settings.bk_file = f'{path}/data/bk-trains.pl'

def train_imdb(settings):
    settings.ex_file = f'{path}/data/{settings.task}/data/train/{settings.trial}.pl'
    settings.bias_file = f'{path}/data/{settings.task}/bias.pl'
    settings.bk_file = f'{path}/data/{settings.task}/bk.pl'

def train_zendo(settings):
    settings.ex_file = f'{path}/data/{settings.task}/data/train/exs-{settings.trial}.pl'
    settings.bias_file = f'{path}/data/bias-zendo.pl'
    settings.bk_file = f'{path}/data/{settings.task}/data/train/bk-swi-{settings.trial}.pl'

def train_krk(settings):
    settings.ex_file = f'{path}/data/{settings.task}/data/train/exs-{settings.trial}.pl'
    settings.bias_file = f'{path}/data/bias-{settings.task}.pl'
    settings.bk_file = f'{path}/data/{settings.task}/data/train/bk-swi-{settings.trial}.pl'

def train_graph(settings):
    settings.ex_file = f'{path}/data/{settings.task}/data/train/{settings.trial}.pl'
    settings.bias_file = f'{path}/data/{settings.task}/bias.pl'
    settings.bk_file = f'{path}/data/{settings.task}/data/train/bk_{settings.trial}.pl'

def test_lists(settings):
    settings.ex_file = f'{path}/data/{settings.task}/data/test/{settings.trial}.pl'
    settings.bias_file = f'{path}/data/{settings.task}/all-bias.pl'
    settings.bk_file = f'{path}/data/bk-lists.pl'

def test_iggp(settings):
    settings.ex_file = f'{path}/data/{settings.task}/data/test/exs.pl'
    settings.bias_file = f'{path}/data/{settings.task}/bias.pl'
    settings.bk_file = f'{path}/data/{settings.task}/data/test/bk.pl'

def test_trains(settings):
    settings.ex_file = f'{path}/data/{settings.task}/data/test/{settings.trial}.pl'
    settings.bias_file = f'{path}/data/{settings.task}/bias.pl'
    settings.bk_file = f'{path}/data/bk-trains.pl'

def test_imdb(settings):
    settings.ex_file = f'{path}/data/{settings.task}/data/test/{settings.trial}.pl'
    settings.bias_file = f'{path}/data/{settings.task}/bias.pl'
    settings.bk_file = f'{path}/data/{settings.task}/bk.pl'

def test_zendo(settings):
    settings.ex_file = f'{path}/data/{settings.task}/data/test/exs-{settings.trial}.pl'
    settings.bias_file = f'{path}/data/{settings.task}/bias.pl'
    settings.bk_file = f'{path}/data/{settings.task}/data/test/bk-swi-{settings.trial}.pl'

def test_krk(settings):
    settings.ex_file = f'{path}/data/{settings.task}/data/test/exs-{settings.trial}.pl'
    settings.bias_file = f'{path}/data/{settings.task}/bias.pl'
    settings.bk_file = f'{path}/data/{settings.task}/data/test/bk-swi-{settings.trial}.pl'

def test_graph(settings):
    settings.ex_file = f'{path}/data/{settings.task}/data/test/{settings.trial}.pl'
    settings.bias_file = f'{path}/data/{settings.task}/bias.pl'
    settings.bk_file = f'{path}/data/{settings.task}/data/test/bk_{settings.trial}.pl'

def get_metagol_settings(task, trial, timeout):
    settings = dcc.utils.Settings(cmd_line=False)
    settings.task = task
    settings.trial = trial
    settings.name = 'metagol'
    settings.timeout = timeout
    return settings

def get_louise_settings(task, trial, timeout):
    settings = dcc.utils.Settings(cmd_line=False)
    settings.task = task
    settings.trial = trial
    settings.name = 'louise'
    settings.timeout = timeout
    if isinstance(settings.task, str):
        if 'zendo' in settings.task:
            settings.target = 'zendo/1'
        elif settings.task in GRAPH_TASKS:
            if settings.task in ['connectedness', 'undirected_edge']:
                settings.target = 'f/2'
            else:
                settings.target = 'f/1'
        elif 'zendo' in settings.task or 'trains' in settings.task:
            settings.target = 'f/1'
        elif settings.task in ['dropk']:
            settings.target = 'f/3'
        elif settings.task in ['addhead', 'droplast', 'finddup', 'last', 'len', 'member', 'reverse', 'sumlist']:
            settings.target = 'f/2'
        elif settings.task in ['contains2', 'evens', 'sorted', 'threesame']:
            settings.target = 'f/1'
        elif "krk" in settings.task:
            settings.target = 'f/1'
        elif settings.task == 'iggp-buttons':
            settings.target = 'next/2'
        elif settings.task == 'iggp-buttons-goal':
            settings.target = 'goal/3'
        elif settings.task == 'iggp-coins':
            settings.target = 'next_cell/3'
        elif settings.task == 'iggp-coins-goal':
            settings.target = 'goal/3'
        elif settings.task == 'iggp-minimal-decay':
            settings.target = 'next_value/2'
        elif settings.task == 'iggp-rps':
            settings.target = 'next_score/3'
        else:
            print(f"TASK not implemented {settings.task}")
    return settings

def get_aleph_settings(task, trial, timeout):
    settings = dcc.utils.Settings(cmd_line=False)
    settings.task = task
    settings.trial = trial
    settings.name = 'aleph'
    settings.timeout = timeout
    return settings

def get_popper_settings(trial, task, timeout, baseline):
    settings = dcc.utils.Settings(cmd_line=False)
    settings.eval_timeout = 0.001
    settings.timeout = timeout
    settings.trial = trial
    settings.task = task
    settings.baseline = baseline
    if baseline:
        settings.name = 'popper'
    else:
        settings.name = 'dcc'
    return settings

def get_popper2_settings(trial, task, timeout):
    settings = dcc.utils.Settings()
    settings.eval_timeout = 0.001
    settings.timeout = timeout
    settings.trial = trial
    settings.task = task
    settings.name = 'popper2'
    return settings

def test_popper(settings):
    print(get_time(),f'TEST: task:{settings.task}\t task:{settings.name}\t task:{settings.timeout}\t trial:{settings.trial}')
    if 'iggp' in settings.task:
        test_iggp(settings)
    elif 'train' in settings.task:
        test_trains(settings)
    elif 'imdb' in settings.task:
        test_imdb(settings)
    elif 'zendo' in settings.task:
        test_zendo(settings)
    elif 'krk' in settings.task:
        test_krk(settings)
    elif settings.task in GRAPH_TASKS:
        test_graph(settings)
    else:
        test_lists(settings)
    test_(settings)

def myround(x):
    if x < 1:
        x = round(x,1)
        if x == 0:
            return 0
        return x
    return round(x)

def get_predictions(settings, stuff):
    prolog = Prolog()
    print(settings.ex_file)
    print(settings.bk_file)
    prolog.consult(settings.ex_file)
    prolog.consult(settings.bk_file)
    prolog.consult('test.pl')
    prolog.consult(f'data/{settings.task}/programs/{settings.name}-{settings.timeout}-{settings.trial}.csv')
    res = list(prolog.query('get_predictions(S0,S1)'))[0]
    stuff['stuff'] = res['S0']+res['S1']

def get_acc_array(task, settings, trial):
    with multiprocessing.Manager() as manager:
        l = manager.dict()
        l['stuff'] = None
        p = Process(target=get_predictions, args=(settings, l))
        p.start()
        p.join()
        # print(l['stuff'])
        return l['stuff']

def get_accs(task, settings):
    path = f'data/{task}/results'
    accs = []
    for trial in TRIALS:
        fname = f'{path}/{settings.name}-{settings.timeout}-{trial}.csv'
        with open(fname) as f:
            for line in f:
                xs = line.split(',')
                if len(xs) > 1:
                    # print(task, settings.name, line)
                    tp, fn, tn, fp = int(xs[0]), int(xs[1]), int(xs[2]), int(xs[3])
                    # print(tp,fn,tn,fp)
                    # accs.append(tp / (tp+fn))
                    accs.append((tp + tn) / (tp+fn+tn+fp))
    return int(np.mean(accs)*100), int(stats.sem(accs)*100)

def get_time_(task, settings, trial):
    settings.task = task
    settings.trial = trial
    fname = get_prog_file(settings)
    with open(fname) as f:
        for line in f:
            if line.startswith('%time'):
                return float(line.split(',')[1])

def get_times(task, settings):
    settings.task = task
    times = []
    for trial in TRIALS:
        settings.trial = trial
        fname = get_prog_file(settings)
        with open(fname) as f:
            for line in f:
                if line.startswith('%time'):
                    times.append(float(line.split(',')[1]))
    return myround(np.mean(times)), myround(stats.sem(times))

def print_rows(systems, func, bold_max_value):
    break_tasks = set(['zendo1', 'imdb1', 'krk1', 'iggp-minimal-decay', 'adjacent_to_red', 'dropk'])
    for task in TASKS:
        x = ''
        if task in break_tasks:
            x += '\midrule\n'

        renamed = task.replace('iggp-', '').replace('_','\_')
        renamed = renamed.replace('minimal-decay', 'md')
        renamed = renamed.replace('adjacent\_to\_red', 'adj\_red')
        renamed = renamed.replace('connectedness', 'connected')
        renamed = renamed.replace('graph\_colouring', 'colouring')
        renamed = renamed.replace('undirected\_edge', 'undirected')
        renamed = renamed.replace('two\_children', '2children')
        renamed = renamed.replace('-goal', '-g')
         # 'connectedness', 'cyclic', 'graph_colouring', '', 'two_children']
        x += '\\emph{' + renamed + '}'
        tmp = []
        for system in systems:
            value,err = func(task, system)
            tmp.append((value,err))
        if bold_max_value:
            bold_value = max(k for k,v in tmp)
        else:
            bold_value = min(k for k,v in tmp)
        for value, err in tmp:
            if func == get_times and value >= TIMEOUT:
                x += ' & \\emph{timeout}'
            elif value == bold_value:
                # x += ' & \\textbf{' + str(value) + '} ' + f'$\pm$ {err}'
                x += ' & \\textbf{' + str(value) + ' $\pm$ ' + str(err) + '} '
            else:
                x += f' & {value} $\pm$ {err}'
        x+= ' \\\\'
        print(x)

# def tests():
#     # dcc
#     x = get_settings(1, 1)
#     # popper
#     # y = get_settings(1, 1, baseline=True)
#     # no constraints
#     # y = get_settings(1, 1, constraints=False)
#     # lazy
#     # y = get_settings(1, 1, lazy=False)
#     # compression
#     y = get_settings(1, 1, chunking=False)
#     accs = {system:[] for system in [x, y]}
#     times = {system:[] for system in [x, y]}
#     for system in [x, y]:
#         for task in TASKS:
#             for trial in TRIALS:
#                 acc = get_acc_(task, system, trial)
#                 time = get_time_(task, system, trial)
#                 accs[system].append(acc)
#                 times[system].append(time)
#     # xs = accs[x]
#     # ys = accs[y]

#     # McN = math.pow((b-c),2) / (b+c)
#     # print(f'accuracies p-value: {1-stats.chi2.cdf(McN,1):.3f}')

#     xs = times[x]
#     ys = times[y]
#     print(xs)
#     print(ys)
#     res = stats.ttest_rel(xs, ys)
#     print(f'times p-value: {res.pvalue:.5f}')

def tests():
    timeout = TIMEOUT
    # popper2

    x = get_popper2_settings(1, 1, timeout)
    # x = get_aleph_settings(1, 1, timeout)
    # x = get_popper_settings(1, 1, timeout, baseline=True)
    # popper
    y = get_popper_settings(1, 1, timeout, baseline=True)

    print('HERE!!1')
    predictions = {system:[] for system in [x, y]}
    for settings in [x, y]:
        for task in TASKS:
            settings.task = task
            for trial in TRIALS:
                settings.trial = trial
                if 'iggp' in settings.task:
                    test_iggp(settings)
                elif 'train' in settings.task:
                    test_trains(settings)
                elif 'imdb' in settings.task:
                    test_imdb(settings)
                elif 'zendo' in settings.task:
                    test_zendo(settings)
                elif 'krk' in settings.task:
                    test_krk(settings)
                elif settings.task in GRAPH_TASKS:
                    # pass
                    test_graph(settings)
                else:
                    test_lists(settings)

                predictions[settings].extend(get_acc_array(task, settings, trial))
    xs = predictions[x]
    ys = predictions[y]
    print('xs',xs)
    print('ys',ys)
    b = sum(1.0 for (x, y) in zip(xs, ys) if x == 1 and y == 0)
    c = sum(1.0 for (x, y) in zip(xs, ys) if x == 0 and y == 1)
    print(b, c)
    McN = math.pow((b-c),2) / (b+c)
    print(f'accuracies p-value: {1-stats.chi2.cdf(McN,1):.3f}')


    # times = {system:[] for system in [x, y]}
    # TIMES
    # for system in [x, y]:
    #     for task in TASKS:
    #         for trial in TRIALS:
    #             time = get_time_(task, system, trial)
    #             times[system].append(time)

    # xs = times[x]
    # ys = times[y]
    # print(xs)
    # print(ys)
    # res = stats.ttest_rel(xs, ys)
    # print(f'times p-value: {res.pvalue:.5f}')

def print_rows2(systems, func, bold_max_value, bold_max_or_min=False, ratios=False):
    break_tasks = set(['zendo1', 'imdb1', 'krk1', 'iggp-minimal-decay', 'adjacent_to_red', 'dropk'])
    for task in TASKS:
        x = ''
        if task in break_tasks:
            x += '\midrule\n'

        renamed = task.replace('iggp-', '').replace('_','\_')
        renamed = renamed.replace('minimal-decay', 'md')
        renamed = renamed.replace('adjacent\_to\_red', 'adj\_red')
        renamed = renamed.replace('connectedness', 'connected')
        renamed = renamed.replace('graph\_colouring', 'colouring')
        renamed = renamed.replace('undirected\_edge', 'undirected')
        renamed = renamed.replace('two\_children', 'two-children')

        x = '\\emph{' + renamed + '}'

        tmp = []
        for system in systems:
            value,err = func(task, system)
            tmp.append((value,err))
            # x += f' & {value} $\pm$ {err}'

        if bold_max_value:
            bold_value = max(k for k,v in tmp)
        else:
            bold_value = min(k for k,v in tmp)

        # if not ratios:
        for value, err in tmp:
            if value == bold_value and bold_max_or_min:
                x += ' & \\textbf{' + str(value) + '} ' + f'$\pm$ {err}'
            else:
                x += f' & {value} $\pm$ {err}'

        if ratios:
            # print(tmp[0])
            # print(tmp[1])
            x1,_err1 = tmp[0]
            x2,_err2 = tmp[1]
            # c = (x2-x1)/x1

            c = (x2-x1)/x1
            if c > 0:
                c = f'+{int(c*100)}\%'
                if func == get_accs:
                    c = '\\textbf{' + c + '}'
            elif c == 0:
                c = f'{int(c*100)}\%'
            else:
                c = f'{int(c*100)}\%'
                if func == get_times:
                    c = '\\textbf{' + c + '}'

            x += f' & {c}'



        # if ratios:
        #     # v = round(tmp[1]/tmp[0],2)
        #     # v = r
        #     v = c
        #     # if v < 1:
        #         # pass
        #         # x += f' & \\textbf{ {v}}'
        #     # else:
        #     x += f' & {v}'

        x+= ' \\\\'
        print(x)

def print_results1():
    # for timeout in TIMEOUTS:
    timeout = TIMEOUT
    systems = []
    # popper2
    systems.append(get_popper2_settings(1, 1, timeout))
    # popper
    systems.append(get_popper_settings(1, 1, timeout, baseline=True))
    # dcc
    systems.append(get_popper_settings(1, 1, timeout, baseline=False))
    # aleph
    systems.append(get_aleph_settings(1, 1, timeout))
    # metagol
    systems.append(get_metagol_settings(1, 1, timeout))
    # louise
    # systems.append(get_louise_settings(1, 1, timeout))

    print('ACCS'*10)
    print_rows(systems, get_accs, bold_max_value=True)
    print('TIMES'*10)
    print_rows(systems, get_times, bold_max_value=False)



def print_results2():
    timeout = TIMEOUT
    systems = []
    # popper
    systems.append(get_popper_settings(1, 1, timeout, baseline=True))
    # popper2
    systems.append(get_popper2_settings(1, 1, timeout))
    print('ACCS'*10)
    # should_bold_max_values = len(systems) != 2
    # print(should_bold_max_values)
    print_rows2(systems, get_accs, bold_max_value=True, bold_max_or_min=len(systems)!=2, ratios=len(systems)==2)
    print('TIMES'*10)
    print_rows2(systems, get_times, bold_max_value=False, bold_max_or_min=len(systems)!=2, ratios=len(systems)==2)

def train_aux(job):
    print(get_time(), f'TRAIN {job.name}: task:{job.task}\t timeout:{job.timeout}\t trial:{job.trial}')
    if job.name == 'metagol':
        train_metagol(job)
    elif job.name == 'aleph':
        train_aleph(job)
    elif job.name == 'dcc':
        train_popper(job)
    elif job.name == 'popper':
        train_popper(job)
    elif job.name == 'popper2':
        train_popper2(job)
    elif job.name == 'louise':
        train_louise(job)

def run_exp(mode):
    jobs = []

    for trial in TRIALS:
        for task in TASKS:
            timeout = TIMEOUT
            # aleph
            jobs.append(get_aleph_settings(task, trial, timeout))
            # metagol
            jobs.append(get_metagol_settings(task, trial, timeout))
            # louise
            # jobs.append(get_louise_settings(task, trial, timeout))
            # popper
            jobs.append(get_popper_settings(trial, task, timeout, baseline=True))
            # dcc
            jobs.append(get_popper_settings(trial, task, timeout, baseline=False))
            # popper+
            jobs.append(get_popper2_settings(trial, task, timeout))
    if mode == 'train':
        partmap(train_aux, jobs)
    elif mode == 'test':
        print('testing')
        partmap(test_popper, jobs)
    elif mode == 'results':
        print_results1()
        # print_results2()
            
if __name__ == '__main__':
    # pass
    mode = sys.argv[1]
    # GENERATE THE DATA
    if mode == 'gen':
        gen_train_data()
        gen_zendo_data()
        gen_krk_data()
        gen_graph_data()
        gen_list_data()

    run_exp(mode)
