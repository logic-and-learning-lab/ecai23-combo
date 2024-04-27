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

cell(0,[6, 4], w, k).
cell(0,[6, 6], b, k).
cell(0,[7, 1], w, r).
cell(1,[3, 7], w, k).
cell(1,[3, 5], b, k).
cell(1,[5, 5], w, r).
cell(2,[6, 6], w, k).
cell(2,[6, 4], b, k).
cell(2,[4, 7], w, r).
cell(3,[5, 8], w, k).
cell(3,[5, 6], b, k).
cell(3,[2, 3], w, r).
cell(4,[7, 7], w, k).
cell(4,[7, 5], b, k).
cell(4,[4, 6], w, r).
cell(5,[6, 4], w, k).
cell(5,[4, 4], b, k).
cell(5,[4, 1], w, r).
cell(6,[2, 5], w, k).
cell(6,[2, 7], b, k).
cell(6,[1, 6], w, r).
cell(7,[5, 4], w, k).
cell(7,[5, 6], b, k).
cell(7,[5, 7], w, r).
cell(8,[8, 5], w, k).
cell(8,[6, 5], b, k).
cell(8,[7, 3], w, r).
cell(9,[8, 4], w, k).
cell(9,[8, 2], b, k).
cell(9,[5, 2], w, r).
cell(10,[1, 5], w, k).
cell(10,[1, 3], b, k).
cell(10,[2, 4], w, r).
cell(11,[2, 1], w, k).
cell(11,[2, 3], b, k).
cell(11,[3, 1], w, r).
cell(12,[6, 3], w, k).
cell(12,[6, 5], b, k).
cell(12,[7, 2], w, r).
cell(13,[4, 7], w, k).
cell(13,[4, 5], b, k).
cell(13,[7, 1], w, r).
cell(14,[1, 2], w, k).
cell(14,[3, 2], b, k).
cell(14,[4, 6], w, r).
cell(15,[7, 7], w, k).
cell(15,[5, 7], b, k).
cell(15,[8, 4], w, r).
cell(16,[4, 2], w, k).
cell(16,[2, 2], b, k).
cell(16,[5, 3], w, r).
cell(17,[1, 8], w, k).
cell(17,[3, 8], b, k).
cell(17,[4, 5], w, r).
cell(18,[5, 5], w, k).
cell(18,[7, 5], b, k).
cell(18,[6, 8], w, r).
cell(19,[6, 3], w, k).
cell(19,[8, 3], b, k).
cell(19,[3, 5], w, r).
cell(20,[5, 1], w, r).
cell(20,[2, 1],  w, k).
cell(20,[6, 3], b, k).
cell(21,[8, 8], w, r).
cell(21,[2, 8],  b, r).
cell(21,[3, 8], w, k).
cell(22,[2, 7], b, k).
cell(22,[2, 1],  b, r).
cell(22,[7, 6], w, k).
cell(23,[6, 2], w, r).
cell(23,[5, 3],  b, k).
cell(23,[5, 4], w, k).
cell(24,[5, 8], b, r).
cell(24,[1, 5],  w, k).
cell(24,[8, 8], w, k).
cell(25,[4, 5], b, r).
cell(25,[6, 4],  b, k).
cell(25,[7, 3], b, k).
cell(26,[8, 1], w, k).
cell(26,[6, 5],  w, r).
cell(26,[6, 1], w, r).
cell(27,[1, 2], w, k).
cell(27,[8, 3],  b, k).
cell(27,[6, 4], w, k).
cell(28,[5, 6], b, r).
cell(28,[5, 5],  w, r).
cell(28,[8, 6], b, k).
cell(29,[8, 1], w, r).
cell(29,[5, 8],  b, r).
cell(29,[2, 3], b, r).
cell(30,[5, 7], w, r).
cell(30,[7, 6],  w, k).
cell(30,[2, 5], b, r).
cell(31,[3, 6], b, r).
cell(31,[4, 2],  w, k).
cell(31,[2, 5], b, r).
cell(32,[6, 2], b, k).
cell(32,[7, 8],  w, r).
cell(32,[5, 3], w, r).
cell(33,[5, 1], b, r).
cell(33,[7, 4],  b, r).
cell(33,[2, 3], w, r).
cell(34,[6, 8], b, k).
cell(34,[1, 6],  w, r).
cell(34,[5, 6], b, r).
cell(35,[6, 6], b, r).
cell(35,[3, 3],  w, r).
cell(35,[4, 4], w, k).
cell(36,[8, 2], b, k).
cell(36,[7, 6],  w, k).
cell(36,[4, 7], w, k).
cell(37,[7, 3], b, k).
cell(37,[3, 4],  b, r).
cell(37,[1, 7], w, k).
cell(38,[7, 8], b, r).
cell(38,[7, 3],  b, r).
cell(38,[1, 4], w, k).
cell(39,[5, 7], b, r).
cell(39,[5, 2],  w, r).
cell(39,[8, 7], w, r).
