:-style_check(-discontiguous).

:-style_check(-discontiguous).


distance([X1,Y1],[X2,Y2],D) :-
    nonvar(X1),
    nonvar(X2),
    nonvar(Y1),
    nonvar(Y2),
    D1 is abs(X1-X2),
    D2 is abs(Y1-Y2),
    D is max(D1,D2).

king(k).
rook(r).
white(w).
black(b).
one(1).
two(2).
three(3).

samerank([X,_],[X,_]).
samefile([_,Y],[_,Y]).

nextrank([1,_],[2,_]).
nextrank([2,_],[1,_]).
nextrank([2,_],[3,_]).
nextrank([3,_],[2,_]).
nextrank([3,_],[4,_]).
nextrank([4,_],[3,_]).
nextrank([4,_],[5,_]).
nextrank([5,_],[4,_]).
nextrank([5,_],[6,_]).
nextrank([6,_],[5,_]).
nextrank([6,_],[7,_]).
nextrank([7,_],[6,_]).
nextrank([7,_],[8,_]).
nextrank([8,_],[7,_]).

nextfile([_,1],[_,2]).
nextfile([_,2],[_,1]).
nextfile([_,2],[_,3]).
nextfile([_,3],[_,2]).
nextfile([_,3],[_,4]).
nextfile([_,4],[_,3]).
nextfile([_,4],[_,5]).
nextfile([_,5],[_,4]).
nextfile([_,5],[_,6]).
nextfile([_,6],[_,5]).
nextfile([_,6],[_,7]).
nextfile([_,7],[_,6]).
nextfile([_,7],[_,8]).
nextfile([_,8],[_,7]).

cell(0,[8, 3], w, k).
cell(0,[6, 3], b, k).
cell(0,[2, 3], w, r).
cell(1,[4, 8], w, k).
cell(1,[2, 8], b, k).
cell(1,[7, 4], w, r).
cell(2,[1, 1], w, k).
cell(2,[3, 1], b, k).
cell(2,[8, 6], w, r).
cell(3,[8, 7], w, k).
cell(3,[8, 5], b, k).
cell(3,[1, 1], w, r).
cell(4,[6, 6], w, k).
cell(4,[6, 8], b, k).
cell(4,[4, 5], w, r).
cell(5,[3, 2], w, k).
cell(5,[3, 4], b, k).
cell(5,[7, 3], w, r).
cell(6,[3, 8], w, k).
cell(6,[3, 6], b, k).
cell(6,[6, 4], w, r).
cell(7,[2, 8], w, k).
cell(7,[4, 8], b, k).
cell(7,[1, 8], w, r).
cell(8,[1, 6], w, k).
cell(8,[3, 6], b, k).
cell(8,[2, 7], w, r).
cell(9,[1, 1], w, k).
cell(9,[1, 3], b, k).
cell(9,[6, 4], w, r).
cell(10,[6, 1], w, k).
cell(10,[6, 3], b, k).
cell(10,[8, 7], w, r).
cell(11,[4, 4], w, k).
cell(11,[2, 4], b, k).
cell(11,[2, 1], w, r).
cell(12,[8, 2], w, k).
cell(12,[8, 4], b, k).
cell(12,[4, 2], w, r).
cell(13,[2, 2], w, k).
cell(13,[4, 2], b, k).
cell(13,[1, 8], w, r).
cell(14,[1, 1], w, k).
cell(14,[3, 1], b, k).
cell(14,[8, 7], w, r).
cell(15,[4, 5], w, k).
cell(15,[2, 5], b, k).
cell(15,[6, 3], w, r).
cell(16,[8, 6], w, k).
cell(16,[8, 8], b, k).
cell(16,[7, 4], w, r).
cell(17,[8, 1], w, k).
cell(17,[6, 1], b, k).
cell(17,[3, 2], w, r).
cell(18,[7, 6], w, k).
cell(18,[7, 8], b, k).
cell(18,[7, 5], w, r).
cell(19,[4, 4], w, k).
cell(19,[4, 2], b, k).
cell(19,[3, 4], w, r).
cell(20,[4, 6], b, k).
cell(20,[1, 7],  b, k).
cell(20,[7, 7], w, r).
cell(21,[5, 2], w, r).
cell(21,[7, 2],  b, k).
cell(21,[3, 4], b, k).
cell(22,[2, 3], b, k).
cell(22,[8, 5],  w, r).
cell(22,[4, 6], w, r).
cell(23,[2, 8], b, r).
cell(23,[5, 2],  w, r).
cell(23,[5, 4], b, k).
cell(24,[6, 1], w, k).
cell(24,[6, 8],  w, k).
cell(24,[1, 2], w, k).
cell(25,[8, 7], b, k).
cell(25,[8, 1],  w, r).
cell(25,[8, 4], b, k).
cell(26,[1, 1], w, r).
cell(26,[1, 2],  w, k).
cell(26,[2, 8], w, k).
cell(27,[1, 7], w, k).
cell(27,[8, 4],  w, k).
cell(27,[7, 3], b, k).
cell(28,[8, 6], b, k).
cell(28,[2, 3],  b, k).
cell(28,[4, 5], w, r).
cell(29,[1, 8], b, r).
cell(29,[7, 3],  b, r).
cell(29,[4, 2], b, k).
cell(30,[1, 8], w, r).
cell(30,[3, 1],  w, r).
cell(30,[6, 7], w, r).
cell(31,[5, 2], w, k).
cell(31,[7, 4],  b, r).
cell(31,[5, 7], b, r).
cell(32,[8, 5], b, k).
cell(32,[7, 1],  b, r).
cell(32,[4, 4], w, k).
cell(33,[6, 7], w, r).
cell(33,[7, 3],  b, k).
cell(33,[6, 5], w, r).
cell(34,[1, 1], w, k).
cell(34,[5, 2],  b, r).
cell(34,[3, 2], w, r).
cell(35,[2, 3], b, k).
cell(35,[8, 6],  w, k).
cell(35,[2, 7], w, k).
cell(36,[8, 2], w, r).
cell(36,[6, 8],  b, k).
cell(36,[4, 8], w, r).
cell(37,[8, 4], w, k).
cell(37,[8, 1],  b, r).
cell(37,[8, 3], w, k).
cell(38,[3, 7], b, r).
cell(38,[6, 2],  b, r).
cell(38,[1, 7], w, k).
cell(39,[5, 7], w, k).
cell(39,[1, 6],  b, r).
cell(39,[6, 4], b, k).
