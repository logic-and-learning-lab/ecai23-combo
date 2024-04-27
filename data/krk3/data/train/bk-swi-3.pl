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
cell(0,[3, 4], b, k).
cell(0,[7, 8], w, k).
cell(1,[6, 5], w, r).
cell(1,[6, 4], b, k).
cell(1,[5, 2], w, k).
cell(2,[2, 2], w, r).
cell(2,[1, 2], b, k).
cell(2,[3, 2], w, k).
cell(3,[7, 5], w, r).
cell(3,[3, 5], b, k).
cell(3,[4, 4], w, k).
cell(4,[7, 3], w, r).
cell(4,[7, 1], b, k).
cell(4,[8, 8], w, k).
cell(5,[4, 1], w, r).
cell(5,[1, 1], b, k).
cell(5,[5, 4], w, k).
cell(6,[4, 2], w, r).
cell(6,[4, 3], b, k).
cell(6,[5, 7], w, k).
cell(7,[5, 2], w, r).
cell(7,[3, 2], b, k).
cell(7,[5, 5], w, k).
cell(8,[3, 4], w, r).
cell(8,[8, 4], b, k).
cell(8,[1, 7], w, k).
cell(9,[7, 6], w, r).
cell(9,[7, 3], b, k).
cell(9,[4, 1], w, k).
cell(10,[3, 2], w, r).
cell(10,[3, 4], b, k).
cell(10,[2, 3], w, k).
cell(11,[6, 7], w, r).
cell(11,[4, 7], b, k).
cell(11,[5, 2], w, k).
cell(12,[6, 3], w, r).
cell(12,[6, 5], b, k).
cell(12,[5, 5], w, k).
cell(13,[4, 2], w, r).
cell(13,[2, 2], b, k).
cell(13,[1, 3], w, k).
cell(14,[2, 8], w, r).
cell(14,[8, 8], b, k).
cell(14,[7, 1], w, k).
cell(15,[8, 1], w, r).
cell(15,[5, 1], b, k).
cell(15,[3, 7], w, k).
cell(16,[8, 2], w, r).
cell(16,[6, 2], b, k).
cell(16,[8, 7], w, k).
cell(17,[2, 3], w, r).
cell(17,[8, 3], b, k).
cell(17,[6, 6], w, k).
cell(18,[4, 8], w, r).
cell(18,[3, 8], b, k).
cell(18,[2, 1], w, k).
cell(19,[3, 8], w, r).
cell(19,[1, 8], b, k).
cell(19,[7, 1], w, k).
cell(20,[4, 4], w, r).
cell(20,[7, 8], b, r).
cell(20,[1, 7], w, k).
cell(21,[2, 7], b, r).
cell(21,[1, 4], b, k).
cell(21,[3, 3], w, k).
cell(22,[2, 5], w, k).
cell(22,[2, 7], w, k).
cell(22,[8, 5], b, k).
cell(23,[4, 3], w, r).
cell(23,[3, 2], b, k).
cell(23,[8, 5], w, r).
cell(24,[2, 4], w, k).
cell(24,[1, 4], b, k).
cell(24,[2, 7], w, k).
cell(25,[1, 4], b, k).
cell(25,[2, 4], w, k).
cell(25,[8, 8], b, k).
cell(26,[3, 2], b, r).
cell(26,[1, 4], b, r).
cell(26,[3, 1], b, r).
cell(27,[8, 7], w, k).
cell(27,[2, 8], b, k).
cell(27,[7, 4], w, r).
cell(28,[7, 6], b, r).
cell(28,[5, 2], b, r).
cell(28,[7, 2], w, r).
cell(29,[4, 1], w, r).
cell(29,[3, 7], b, k).
cell(29,[5, 7], b, r).
cell(30,[5, 3], b, r).
cell(30,[5, 4], b, r).
cell(30,[4, 5], w, k).
cell(31,[4, 3], w, r).
cell(31,[3, 5], w, k).
cell(31,[8, 5], w, k).
cell(32,[2, 8], b, k).
cell(32,[2, 7], b, r).
cell(32,[1, 6], w, k).
cell(33,[6, 5], b, k).
cell(33,[1, 6], b, r).
cell(33,[5, 7], w, k).
cell(34,[7, 3], w, k).
cell(34,[6, 3], w, k).
cell(34,[2, 4], w, k).
cell(35,[2, 4], b, r).
cell(35,[4, 1], b, r).
cell(35,[4, 5], b, r).
cell(36,[5, 7], b, k).
cell(36,[6, 2], w, k).
cell(36,[8, 5], w, k).
cell(37,[3, 1], w, k).
cell(37,[4, 2], w, r).
cell(37,[1, 5], w, r).
cell(38,[8, 1], b, k).
cell(38,[5, 1], b, r).
cell(38,[2, 2], w, k).
cell(39,[8, 7], w, r).
cell(39,[7, 2], w, k).
cell(39,[5, 1], b, k).
