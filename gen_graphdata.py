
import random
import numpy as np
import sys

MAX_GRAPH_SIZE = 50
COLOURS = ['green', 'red']
THRESHOLD = 0.5

np.set_printoptions(threshold=sys.maxsize)


def gen_graph(min_node=1, max_node=MAX_GRAPH_SIZE, prob=THRESHOLD):
    n = random.randint(min_node, max_node)
    colours = [random_colour() for _ in range(n)]
    edges = make_edges(n, prob=prob)
    return colours, edges


def random_colour():
    return random.choice(COLOURS)


def make_edges(n, prob=THRESHOLD):
    edges = np.random.rand(n, n)
    edges[edges > prob] = 1
    edges[edges <= prob] = 0
    for i in range(n):
        edges[i][i] = 0
    return edges


def is_connected(edges, i, j):
    visited, neighbour = set(), [i]
    while neighbour:
        neighbour = [j for n in neighbour for j in range(len(edges)) if edges[n][j] and j not in visited]
        visited.update(neighbour)
        if j in neighbour:
            return True
    return False


def path(edges, s, d):
    visited = [False] * len(edges)

    queue = []
    queue.append([s, [s]])

    while queue:
        [n, path] = queue.pop(0)
        for i in range(len(edges)):
            if edges[n][i] and visited[i] == False:
                queue.append([i, path + [i]])
                visited[i] = True
                if i == d:
                    return path + [i]
    return False

class AdjacentToRed:
    @staticmethod
    def gen_pos(k):
        colours, edges = gen_graph(min_node=2)
        [i, j] = random.sample(list(range(len(edges))), 2)
        edges[i][j] = 1
        colours[j] = "red"
        return [k, colours, edges], f"f(n_{k}_{i})"

    @staticmethod
    def gen_neg(k):
        colours, edges = gen_graph(min_node=2)
        while True:
            [i] = random.sample(list(range(len(edges))), 1)
            adjacent_red = [j for j in range(len(edges)) if edges[i][j] and colours[j] == 'red']
            for j in adjacent_red:
                edges[i][j] = 0
            return [k, colours, edges], f"f(n_{k}_{i})"


class Connectedness:
    @staticmethod
    def gen_pos(k):
        while True:
            colours, edges = gen_graph(min_node=2, prob=0.9)
            [start] = random.sample(list(range(len(edges))), 1)
            n = random.randint(1, len(edges))
            i, j, unvisited = start, start, set([i for i in range(len(edges))])
            while n:
                [j] = random.sample(unvisited, 1)
                unvisited.remove(j)
                edges[i][j] = 1
                i = j
                n -= 1
            return [k, colours, edges], f"f(n_{k}_{start}, n_{k}_{j})"

    @staticmethod
    def gen_neg(k):
        colours, edges = gen_graph(min_node=2, prob=0.9)
        [i, j] = random.sample(list(range(len(edges))), 2)
        while path(edges, i, j):
            path_i_j = path(edges, i, j)
            u = random.randint(0, len(path_i_j)-1)
            edges[path_i_j[u], path_i_j[(u+1) % len(path_i_j)]] = 0
        assert not is_connected(edges, i, j)
        return [k, colours, edges], f"f(n_{k}_{i}, n_{k}_{j})"



class Cyclic:
    @staticmethod
    def gen_pos(k):
        while True:
            colours, edges = gen_graph(min_node=2, prob=0.9)
            [start] = random.sample(list(range(len(edges))), 1)
            n = random.randint(1, len(edges))
            i, j, unvisited = start, start, set([i for i in range(len(edges))])
            while n:
                [j] = random.sample(unvisited, 1)
                unvisited.remove(j)
                edges[i][j] = 1
                i = j
                n -= 1
            edges[j][start] = 1
            return [k, colours, edges], f"f(n_{k}_{start})"

    @staticmethod
    def gen_neg(k):
        colours, edges = gen_graph(min_node=2, prob=0.9)
        [i] = random.sample(list(range(len(edges))), 1)
        while path(edges, i, i):
            cyclic_path = path(edges, i, i)
            u = random.randint(0, len(cyclic_path)-1)
            edges[cyclic_path[u], cyclic_path[(u+1) % len(cyclic_path)]] = 0
        assert not is_connected(edges, i, i)
        return [k, colours, edges], f"f(n_{k}_{i})"


class GraphColouring:
    @staticmethod
    def gen_pos(k):
        colours, edges = gen_graph(min_node=2)
        [i, j] = random.sample(list(range(len(edges))), 2)
        edges[i][j] = 1
        colours[j] = colours[i]
        return [k, colours, edges], f"f(n_{k}_{i})"

    @staticmethod
    def gen_neg(k):
        while True:
            colours, edges = gen_graph(min_node=2)
            [i] = random.sample(list(range(len(edges))), 1)
            bad_neighbors = [j for j in range(len(edges)) if edges[i][j] and colours[j] == colours[i]]
            if not bad_neighbors:
                return [k, colours, edges], f"f(n_{k}_{i})"


class TwoChildren:
    @staticmethod
    def gen_pos(k):
        colours, edges = gen_graph(min_node=3)
        [i, j, l] = random.sample(list(range(len(edges))), 3)
        edges[i][j] = 1
        edges[i][l] = 1
        return [k, colours, edges], f"f(n_{k}_{i})"

    @staticmethod
    def gen_neg(k):
        while True:
            colours, edges = gen_graph(min_node=3)
            [i] = random.sample(list(range(len(edges))), 1)
            if sum(edges[i]) <= 1:
                return [k, colours, edges], f"f(n_{k}_{i})"


class UndirectedEdge:
    @staticmethod
    def gen_pos(k):
        colours, edges = gen_graph(min_node=2)
        [i, j] = random.sample(list(range(len(edges))), 2)
        x = random.random()
        if x > 0.5:
            edges[i][j] = 1
        else:
            edges[j][i] = 1
        return [k, colours, edges], f"f(n_{k}_{i}, n_{k}_{j})"

    @staticmethod
    def gen_neg(k):
        while True:
            colours, edges = gen_graph(min_node=2)
            [i, j] = random.sample(list(range(len(edges))), 2)
            if not edges[i][j] and not edges[j][i]:
                return [k, colours, edges], f"f(n_{k}_{i}, n_{k}_{j})"


def bk_exs(bk_data):
    bk = ""
    [name, colours, edges] = bk_data
    for i, c in enumerate(colours):
        bk += f"colour(n_{name}_{i},{c}).\n"
    for i in range(len(edges)):
        for j in range(len(edges)):
            if edges[i][j]:
                bk += f"edge(n_{name}_{i},n_{name}_{j}).\n"
    return bk