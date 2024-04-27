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

cell(0,[8, 2], w, r).
cell(0,[6, 2], b, k).
cell(0,[5, 3], w, k).
cell(1,[3, 6], w, r).
cell(1,[1, 6], b, k).
cell(1,[4, 3], w, k).
cell(2,[7, 4], w, r).
cell(2,[1, 4], b, k).
cell(2,[2, 1], w, k).
cell(3,[8, 2], w, r).
cell(3,[8, 5], b, k).
cell(3,[2, 6], w, k).
cell(4,[2, 5], w, r).
cell(4,[7, 5], b, k).
cell(4,[1, 5], w, k).
cell(5,[1, 5], w, r).
cell(5,[1, 1], b, k).
cell(5,[7, 5], w, k).
cell(6,[3, 8], w, r).
cell(6,[8, 8], b, k).
cell(6,[1, 1], w, k).
cell(7,[4, 1], w, r).
cell(7,[5, 1], b, k).
cell(7,[2, 7], w, k).
cell(8,[8, 6], w, r).
cell(8,[8, 5], b, k).
cell(8,[2, 7], w, k).
cell(9,[6, 5], w, r).
cell(9,[6, 4], b, k).
cell(9,[8, 4], w, k).
cell(10,[1, 1], w, r).
cell(10,[7, 1], b, k).
cell(10,[2, 2], w, k).
cell(11,[3, 8], w, r).
cell(11,[1, 8], b, k).
cell(11,[5, 6], w, k).
cell(12,[8, 2], w, r).
cell(12,[2, 2], b, k).
cell(12,[1, 5], w, k).
cell(13,[5, 2], w, r).
cell(13,[2, 2], b, k).
cell(13,[8, 1], w, k).
cell(14,[8, 7], w, r).
cell(14,[7, 7], b, k).
cell(14,[2, 4], w, k).
cell(15,[7, 6], w, r).
cell(15,[7, 3], b, k).
cell(15,[7, 7], w, k).
cell(16,[3, 3], w, r).
cell(16,[3, 6], b, k).
cell(16,[5, 4], w, k).
cell(17,[3, 4], w, r).
cell(17,[8, 4], b, k).
cell(17,[8, 7], w, k).
cell(18,[6, 2], w, r).
cell(18,[7, 2], b, k).
cell(18,[2, 8], w, k).
cell(19,[5, 4], w, r).
cell(19,[5, 7], b, k).
cell(19,[3, 2], w, k).
cell(20,[1, 3], b, r).
cell(20,[5, 3], b, r).
cell(20,[4, 3], b, k).
cell(21,[6, 5], w, k).
cell(21,[6, 7], b, r).
cell(21,[5, 4], w, k).
cell(22,[7, 3], w, r).
cell(22,[2, 6], b, r).
cell(22,[4, 5], b, k).
cell(23,[3, 2], w, k).
cell(23,[6, 2], b, r).
cell(23,[3, 1], b, r).
cell(24,[7, 7], b, r).
cell(24,[4, 7], w, k).
cell(24,[2, 5], w, r).
cell(25,[7, 5], b, r).
cell(25,[3, 7], w, k).
cell(25,[2, 2], w, k).
cell(26,[1, 6], w, r).
cell(26,[5, 4], b, r).
cell(26,[8, 4], b, r).
cell(27,[8, 6], w, r).
cell(27,[4, 3], b, r).
cell(27,[6, 3], w, k).
cell(28,[7, 3], w, r).
cell(28,[3, 1], w, k).
cell(28,[8, 7], b, k).
cell(29,[6, 5], w, r).
cell(29,[4, 1], w, r).
cell(29,[6, 7], w, k).
cell(30,[3, 5], b, k).
cell(30,[8, 6], w, k).
cell(30,[7, 1], b, r).
cell(31,[5, 3], b, r).
cell(31,[1, 1], b, k).
cell(31,[5, 7], b, r).
cell(32,[8, 5], b, k).
cell(32,[3, 7], w, r).
cell(32,[3, 2], w, r).
cell(33,[4, 7], w, k).
cell(33,[6, 6], w, k).
cell(33,[5, 5], b, k).
cell(34,[7, 8], b, k).
cell(34,[3, 8], b, k).
cell(34,[8, 1], b, r).
cell(35,[6, 7], w, k).
cell(35,[4, 6], b, k).
cell(35,[1, 5], w, r).
cell(36,[3, 7], w, r).
cell(36,[3, 8], b, r).
cell(36,[1, 8], b, k).
cell(37,[3, 4], w, r).
cell(37,[4, 6], w, k).
cell(37,[6, 3], b, k).
cell(38,[2, 7], w, r).
cell(38,[8, 6], b, k).
cell(38,[6, 4], w, r).
cell(39,[5, 8], b, r).
cell(39,[3, 3], b, k).
cell(39,[5, 4], b, r).
