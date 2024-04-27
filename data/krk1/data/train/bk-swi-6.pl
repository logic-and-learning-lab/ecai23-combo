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

cell(0,[5, 1], w, r).
cell(0,[3, 3], b, k).
cell(0,[6, 1], w, k).
cell(1,[6, 1], w, r).
cell(1,[3, 6], b, k).
cell(1,[6, 2], w, k).
cell(2,[2, 1], w, r).
cell(2,[1, 7], b, k).
cell(2,[1, 2], w, k).
cell(3,[1, 5], w, r).
cell(3,[8, 3], b, k).
cell(3,[1, 6], w, k).
cell(4,[6, 1], w, r).
cell(4,[3, 8], b, k).
cell(4,[7, 2], w, k).
cell(5,[8, 7], w, r).
cell(5,[1, 1], b, k).
cell(5,[8, 6], w, k).
cell(6,[4, 3], w, r).
cell(6,[2, 2], b, k).
cell(6,[5, 2], w, k).
cell(7,[3, 1], w, r).
cell(7,[1, 5], b, k).
cell(7,[2, 2], w, k).
cell(8,[6, 2], w, r).
cell(8,[5, 7], b, k).
cell(8,[5, 1], w, k).
cell(9,[7, 2], w, r).
cell(9,[7, 4], b, k).
cell(9,[6, 2], w, k).
cell(10,[4, 8], w, r).
cell(10,[6, 7], b, k).
cell(10,[5, 7], w, k).
cell(11,[7, 8], w, r).
cell(11,[2, 1], b, k).
cell(11,[7, 7], w, k).
cell(12,[7, 1], w, r).
cell(12,[5, 4], b, k).
cell(12,[6, 1], w, k).
cell(13,[6, 4], w, r).
cell(13,[8, 2], b, k).
cell(13,[5, 4], w, k).
cell(14,[1, 7], w, r).
cell(14,[4, 6], b, k).
cell(14,[2, 7], w, k).
cell(15,[7, 6], w, r).
cell(15,[2, 1], b, k).
cell(15,[8, 7], w, k).
cell(16,[1, 6], w, r).
cell(16,[8, 8], b, k).
cell(16,[2, 7], w, k).
cell(17,[5, 8], w, r).
cell(17,[5, 5], b, k).
cell(17,[4, 8], w, k).
cell(18,[4, 7], w, r).
cell(18,[3, 5], b, k).
cell(18,[5, 8], w, k).
cell(19,[1, 4], w, r).
cell(19,[4, 1], b, k).
cell(19,[2, 5], w, k).
cell(20,[2, 2], b, k).
cell(20,[3, 7], w, k).
cell(20,[5, 5], w, k).
cell(21,[6, 1], w, r).
cell(21,[2, 8], b, r).
cell(21,[1, 4], w, r).
cell(22,[7, 8], b, k).
cell(22,[4, 5], b, r).
cell(22,[7, 2], b, r).
cell(23,[1, 2], w, k).
cell(23,[7, 8], b, r).
cell(23,[4, 7], b, k).
cell(24,[3, 4], b, k).
cell(24,[1, 2], w, r).
cell(24,[5, 6], b, r).
cell(25,[8, 2], b, r).
cell(25,[6, 5], w, r).
cell(25,[2, 5], w, r).
cell(26,[5, 3], w, r).
cell(26,[7, 8], w, r).
cell(26,[1, 5], w, k).
cell(27,[2, 5], b, r).
cell(27,[7, 4], w, r).
cell(27,[6, 8], w, r).
cell(28,[6, 1], w, r).
cell(28,[8, 5], b, k).
cell(28,[6, 7], w, r).
cell(29,[6, 7], w, r).
cell(29,[7, 5], w, k).
cell(29,[4, 1], b, k).
cell(30,[6, 6], b, k).
cell(30,[1, 4], w, k).
cell(30,[7, 4], b, k).
cell(31,[1, 2], w, r).
cell(31,[6, 1], b, k).
cell(31,[2, 7], b, k).
cell(32,[1, 8], w, r).
cell(32,[4, 2], b, r).
cell(32,[1, 1], b, k).
cell(33,[5, 3], w, r).
cell(33,[2, 2], w, k).
cell(33,[8, 6], b, k).
cell(34,[4, 1], w, r).
cell(34,[5, 2], w, r).
cell(34,[2, 7], w, k).
cell(35,[7, 7], b, r).
cell(35,[4, 7], b, k).
cell(35,[5, 1], b, r).
cell(36,[7, 5], w, r).
cell(36,[2, 2], b, k).
cell(36,[5, 6], w, k).
cell(37,[8, 2], w, k).
cell(37,[4, 6], w, r).
cell(37,[2, 4], w, k).
cell(38,[4, 8], b, r).
cell(38,[7, 6], w, k).
cell(38,[4, 7], b, r).
cell(39,[5, 7], w, k).
cell(39,[2, 2], b, r).
cell(39,[1, 7], b, k).
