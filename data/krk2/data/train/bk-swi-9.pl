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

cell(0,[5, 8], w, k).
cell(0,[7, 8], b, k).
cell(0,[6, 7], w, r).
cell(1,[6, 1], w, k).
cell(1,[6, 3], b, k).
cell(1,[2, 4], w, r).
cell(2,[7, 8], w, k).
cell(2,[5, 8], b, k).
cell(2,[6, 6], w, r).
cell(3,[2, 7], w, k).
cell(3,[4, 7], b, k).
cell(3,[7, 4], w, r).
cell(4,[3, 6], w, k).
cell(4,[3, 4], b, k).
cell(4,[6, 8], w, r).
cell(5,[8, 2], w, k).
cell(5,[6, 2], b, k).
cell(5,[8, 1], w, r).
cell(6,[4, 4], w, k).
cell(6,[2, 4], b, k).
cell(6,[5, 3], w, r).
cell(7,[1, 7], w, k).
cell(7,[1, 5], b, k).
cell(7,[7, 7], w, r).
cell(8,[4, 2], w, k).
cell(8,[6, 2], b, k).
cell(8,[8, 1], w, r).
cell(9,[3, 4], w, k).
cell(9,[1, 4], b, k).
cell(9,[8, 2], w, r).
cell(10,[3, 4], w, k).
cell(10,[5, 4], b, k).
cell(10,[3, 7], w, r).
cell(11,[1, 3], w, k).
cell(11,[3, 3], b, k).
cell(11,[4, 6], w, r).
cell(12,[7, 2], w, k).
cell(12,[5, 2], b, k).
cell(12,[4, 4], w, r).
cell(13,[6, 3], w, k).
cell(13,[4, 3], b, k).
cell(13,[7, 4], w, r).
cell(14,[3, 4], w, k).
cell(14,[5, 4], b, k).
cell(14,[7, 8], w, r).
cell(15,[1, 8], w, k).
cell(15,[1, 6], b, k).
cell(15,[7, 6], w, r).
cell(16,[5, 2], w, k).
cell(16,[3, 2], b, k).
cell(16,[1, 7], w, r).
cell(17,[2, 4], w, k).
cell(17,[2, 6], b, k).
cell(17,[6, 4], w, r).
cell(18,[8, 1], w, k).
cell(18,[6, 1], b, k).
cell(18,[7, 2], w, r).
cell(19,[8, 3], w, k).
cell(19,[6, 3], b, k).
cell(19,[6, 5], w, r).
cell(20,[8, 7], b, r).
cell(20,[2, 4],  w, k).
cell(20,[8, 3], b, r).
cell(21,[8, 6], w, r).
cell(21,[4, 4],  w, r).
cell(21,[3, 7], w, k).
cell(22,[4, 5], w, r).
cell(22,[5, 6],  b, k).
cell(22,[4, 1], b, k).
cell(23,[1, 5], w, k).
cell(23,[7, 3],  b, r).
cell(23,[4, 8], b, r).
cell(24,[3, 8], w, k).
cell(24,[6, 7],  w, k).
cell(24,[2, 4], b, k).
cell(25,[6, 7], b, k).
cell(25,[1, 3],  w, k).
cell(25,[3, 4], b, r).
cell(26,[6, 2], b, k).
cell(26,[7, 4],  b, k).
cell(26,[1, 3], b, k).
cell(27,[6, 6], w, k).
cell(27,[1, 3],  b, k).
cell(27,[5, 2], b, r).
cell(28,[3, 7], b, k).
cell(28,[1, 2],  w, r).
cell(28,[6, 2], w, r).
cell(29,[8, 5], w, r).
cell(29,[7, 7],  b, r).
cell(29,[8, 8], b, k).
cell(30,[3, 3], w, k).
cell(30,[4, 6],  b, k).
cell(30,[4, 2], b, k).
cell(31,[4, 3], b, k).
cell(31,[5, 7],  b, k).
cell(31,[4, 7], w, r).
cell(32,[6, 8], w, k).
cell(32,[4, 6],  b, k).
cell(32,[3, 4], b, k).
cell(33,[3, 6], b, r).
cell(33,[6, 8],  w, r).
cell(33,[2, 3], b, r).
cell(34,[4, 4], b, k).
cell(34,[1, 6],  w, r).
cell(34,[2, 2], b, r).
cell(35,[6, 5], w, r).
cell(35,[7, 1],  w, k).
cell(35,[4, 2], b, r).
cell(36,[2, 7], w, k).
cell(36,[7, 5],  b, r).
cell(36,[4, 2], b, r).
cell(37,[7, 7], w, k).
cell(37,[6, 6],  w, k).
cell(37,[8, 2], w, r).
cell(38,[6, 8], b, k).
cell(38,[3, 7],  w, r).
cell(38,[1, 6], b, r).
cell(39,[6, 3], w, r).
cell(39,[4, 5],  b, k).
cell(39,[1, 1], b, r).
