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

cell(0,[3, 5], w, r).
cell(0,[7, 5], b, k).
cell(0,[6, 6], w, k).
cell(1,[1, 3], w, r).
cell(1,[1, 4], b, k).
cell(1,[6, 8], w, k).
cell(2,[4, 1], w, r).
cell(2,[4, 3], b, k).
cell(2,[3, 8], w, k).
cell(3,[6, 7], w, r).
cell(3,[6, 8], b, k).
cell(3,[1, 4], w, k).
cell(4,[7, 8], w, r).
cell(4,[7, 1], b, k).
cell(4,[3, 3], w, k).
cell(5,[3, 1], w, r).
cell(5,[6, 1], b, k).
cell(5,[6, 6], w, k).
cell(6,[8, 3], w, r).
cell(6,[8, 8], b, k).
cell(6,[7, 7], w, k).
cell(7,[6, 8], w, r).
cell(7,[6, 7], b, k).
cell(7,[3, 5], w, k).
cell(8,[8, 6], w, r).
cell(8,[3, 6], b, k).
cell(8,[8, 2], w, k).
cell(9,[2, 2], w, r).
cell(9,[2, 7], b, k).
cell(9,[2, 3], w, k).
cell(10,[8, 1], w, r).
cell(10,[4, 1], b, k).
cell(10,[2, 8], w, k).
cell(11,[6, 5], w, r).
cell(11,[6, 6], b, k).
cell(11,[7, 1], w, k).
cell(12,[2, 5], w, r).
cell(12,[2, 1], b, k).
cell(12,[4, 7], w, k).
cell(13,[6, 6], w, r).
cell(13,[6, 1], b, k).
cell(13,[6, 8], w, k).
cell(14,[2, 7], w, r).
cell(14,[2, 4], b, k).
cell(14,[3, 5], w, k).
cell(15,[7, 3], w, r).
cell(15,[7, 8], b, k).
cell(15,[6, 7], w, k).
cell(16,[3, 5], w, r).
cell(16,[3, 3], b, k).
cell(16,[5, 5], w, k).
cell(17,[5, 1], w, r).
cell(17,[8, 1], b, k).
cell(17,[1, 6], w, k).
cell(18,[8, 2], w, r).
cell(18,[1, 2], b, k).
cell(18,[1, 4], w, k).
cell(19,[3, 1], w, r).
cell(19,[3, 4], b, k).
cell(19,[2, 2], w, k).
cell(20,[4, 8], w, k).
cell(20,[8, 7], b, r).
cell(20,[7, 2], w, r).
cell(21,[4, 7], b, k).
cell(21,[3, 8], b, k).
cell(21,[4, 6], w, k).
cell(22,[6, 3], b, k).
cell(22,[2, 8], w, k).
cell(22,[5, 6], w, r).
cell(23,[6, 4], b, k).
cell(23,[8, 4], w, k).
cell(23,[7, 2], b, k).
cell(24,[3, 5], w, r).
cell(24,[5, 4], w, k).
cell(24,[8, 6], w, r).
cell(25,[1, 7], b, r).
cell(25,[1, 4], w, r).
cell(25,[7, 2], w, k).
cell(26,[2, 8], b, r).
cell(26,[7, 8], w, r).
cell(26,[8, 7], w, r).
cell(27,[7, 3], b, k).
cell(27,[2, 5], b, r).
cell(27,[1, 7], b, r).
cell(28,[3, 7], b, k).
cell(28,[8, 3], b, k).
cell(28,[5, 7], b, k).
cell(29,[8, 3], w, r).
cell(29,[1, 4], b, r).
cell(29,[3, 4], b, k).
cell(30,[2, 4], b, k).
cell(30,[3, 3], w, k).
cell(30,[4, 4], b, r).
cell(31,[3, 6], w, r).
cell(31,[4, 3], b, r).
cell(31,[5, 2], b, r).
cell(32,[3, 3], w, k).
cell(32,[6, 1], w, k).
cell(32,[8, 7], b, k).
cell(33,[7, 2], w, k).
cell(33,[4, 8], b, k).
cell(33,[1, 1], b, k).
cell(34,[6, 1], b, k).
cell(34,[6, 2], b, k).
cell(34,[3, 3], b, r).
cell(35,[8, 1], w, k).
cell(35,[1, 3], w, k).
cell(35,[7, 6], b, r).
cell(36,[7, 1], b, r).
cell(36,[1, 3], w, r).
cell(36,[4, 3], w, r).
cell(37,[6, 1], w, r).
cell(37,[1, 8], b, k).
cell(37,[4, 7], w, r).
cell(38,[2, 2], b, r).
cell(38,[2, 5], b, k).
cell(38,[1, 2], b, k).
cell(39,[1, 2], w, r).
cell(39,[7, 1], b, k).
cell(39,[3, 8], b, r).
