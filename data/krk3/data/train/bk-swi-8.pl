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

cell(0,[2, 7], w, r).
cell(0,[4, 7], b, k).
cell(0,[8, 6], w, k).
cell(1,[7, 4], w, r).
cell(1,[2, 4], b, k).
cell(1,[3, 5], w, k).
cell(2,[4, 1], w, r).
cell(2,[6, 1], b, k).
cell(2,[4, 8], w, k).
cell(3,[1, 7], w, r).
cell(3,[1, 6], b, k).
cell(3,[2, 8], w, k).
cell(4,[5, 7], w, r).
cell(4,[7, 7], b, k).
cell(4,[1, 2], w, k).
cell(5,[6, 4], w, r).
cell(5,[6, 8], b, k).
cell(5,[5, 8], w, k).
cell(6,[8, 1], w, r).
cell(6,[1, 1], b, k).
cell(6,[7, 5], w, k).
cell(7,[7, 7], w, r).
cell(7,[2, 7], b, k).
cell(7,[2, 5], w, k).
cell(8,[5, 1], w, r).
cell(8,[5, 3], b, k).
cell(8,[2, 3], w, k).
cell(9,[7, 8], w, r).
cell(9,[8, 8], b, k).
cell(9,[7, 5], w, k).
cell(10,[5, 2], w, r).
cell(10,[5, 8], b, k).
cell(10,[7, 3], w, k).
cell(11,[3, 8], w, r).
cell(11,[4, 8], b, k).
cell(11,[7, 2], w, k).
cell(12,[5, 3], w, r).
cell(12,[7, 3], b, k).
cell(12,[4, 1], w, k).
cell(13,[1, 7], w, r).
cell(13,[2, 7], b, k).
cell(13,[8, 4], w, k).
cell(14,[3, 6], w, r).
cell(14,[6, 6], b, k).
cell(14,[1, 7], w, k).
cell(15,[1, 8], w, r).
cell(15,[6, 8], b, k).
cell(15,[2, 2], w, k).
cell(16,[8, 7], w, r).
cell(16,[8, 6], b, k).
cell(16,[2, 2], w, k).
cell(17,[6, 8], w, r).
cell(17,[8, 8], b, k).
cell(17,[3, 4], w, k).
cell(18,[2, 4], w, r).
cell(18,[2, 2], b, k).
cell(18,[3, 5], w, k).
cell(19,[7, 1], w, r).
cell(19,[7, 6], b, k).
cell(19,[5, 1], w, k).
cell(20,[8, 8], b, r).
cell(20,[3, 1], w, r).
cell(20,[6, 7], b, r).
cell(21,[3, 4], b, k).
cell(21,[7, 5], b, k).
cell(21,[8, 1], b, r).
cell(22,[1, 3], b, r).
cell(22,[3, 2], b, k).
cell(22,[4, 8], b, r).
cell(23,[5, 4], w, r).
cell(23,[1, 3], b, k).
cell(23,[8, 5], w, r).
cell(24,[8, 8], b, r).
cell(24,[6, 7], b, r).
cell(24,[1, 7], w, k).
cell(25,[6, 3], b, k).
cell(25,[8, 5], w, k).
cell(25,[4, 8], w, r).
cell(26,[8, 8], w, r).
cell(26,[7, 8], w, k).
cell(26,[2, 3], b, r).
cell(27,[2, 1], b, k).
cell(27,[3, 5], w, r).
cell(27,[4, 8], w, r).
cell(28,[6, 2], w, r).
cell(28,[3, 3], b, k).
cell(28,[1, 5], b, k).
cell(29,[2, 1], w, k).
cell(29,[8, 6], w, r).
cell(29,[6, 4], b, k).
cell(30,[5, 3], b, k).
cell(30,[2, 5], w, k).
cell(30,[4, 4], w, r).
cell(31,[7, 5], b, k).
cell(31,[2, 4], b, r).
cell(31,[6, 4], w, r).
cell(32,[2, 3], w, k).
cell(32,[3, 1], w, k).
cell(32,[8, 6], b, r).
cell(33,[7, 1], b, r).
cell(33,[1, 7], b, k).
cell(33,[4, 5], w, k).
cell(34,[6, 7], b, k).
cell(34,[3, 3], b, r).
cell(34,[5, 8], b, r).
cell(35,[2, 7], b, r).
cell(35,[6, 1], w, r).
cell(35,[3, 2], b, k).
cell(36,[6, 5], w, r).
cell(36,[7, 6], b, r).
cell(36,[5, 4], w, k).
cell(37,[5, 2], b, r).
cell(37,[4, 2], w, k).
cell(37,[2, 8], b, r).
cell(38,[5, 8], b, r).
cell(38,[5, 7], b, k).
cell(38,[1, 4], w, r).
cell(39,[3, 5], b, k).
cell(39,[6, 4], b, r).
cell(39,[6, 1], b, r).
