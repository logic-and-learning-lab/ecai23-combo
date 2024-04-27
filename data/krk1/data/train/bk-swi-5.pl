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

cell(0,[3, 7], w, r).
cell(0,[1, 8], b, k).
cell(0,[2, 6], w, k).
cell(1,[3, 7], w, r).
cell(1,[8, 4], b, k).
cell(1,[4, 6], w, k).
cell(2,[3, 7], w, r).
cell(2,[7, 1], b, k).
cell(2,[3, 8], w, k).
cell(3,[4, 3], w, r).
cell(3,[7, 8], b, k).
cell(3,[5, 4], w, k).
cell(4,[3, 2], w, r).
cell(4,[1, 2], b, k).
cell(4,[3, 3], w, k).
cell(5,[4, 7], w, r).
cell(5,[6, 2], b, k).
cell(5,[5, 7], w, k).
cell(6,[8, 1], w, r).
cell(6,[3, 1], b, k).
cell(6,[7, 1], w, k).
cell(7,[3, 6], w, r).
cell(7,[8, 3], b, k).
cell(7,[3, 7], w, k).
cell(8,[5, 6], w, r).
cell(8,[7, 6], b, k).
cell(8,[5, 7], w, k).
cell(9,[1, 5], w, r).
cell(9,[2, 7], b, k).
cell(9,[2, 5], w, k).
cell(10,[2, 2], w, r).
cell(10,[2, 6], b, k).
cell(10,[2, 1], w, k).
cell(11,[4, 1], w, r).
cell(11,[1, 5], b, k).
cell(11,[3, 2], w, k).
cell(12,[3, 6], w, r).
cell(12,[3, 4], b, k).
cell(12,[4, 5], w, k).
cell(13,[6, 5], w, r).
cell(13,[8, 8], b, k).
cell(13,[6, 4], w, k).
cell(14,[7, 1], w, r).
cell(14,[3, 6], b, k).
cell(14,[8, 2], w, k).
cell(15,[6, 4], w, r).
cell(15,[1, 5], b, k).
cell(15,[5, 5], w, k).
cell(16,[4, 8], w, r).
cell(16,[5, 8], b, k).
cell(16,[5, 7], w, k).
cell(17,[4, 7], w, r).
cell(17,[4, 6], b, k).
cell(17,[3, 6], w, k).
cell(18,[6, 5], w, r).
cell(18,[4, 5], b, k).
cell(18,[6, 4], w, k).
cell(19,[6, 7], w, r).
cell(19,[7, 3], b, k).
cell(19,[7, 8], w, k).
cell(20,[3, 5], w, k).
cell(20,[1, 4], b, r).
cell(20,[6, 3], b, r).
cell(21,[8, 8], w, k).
cell(21,[1, 5], b, k).
cell(21,[1, 7], b, k).
cell(22,[4, 1], b, k).
cell(22,[4, 7], w, k).
cell(22,[4, 4], b, k).
cell(23,[5, 7], w, r).
cell(23,[3, 2], w, k).
cell(23,[3, 3], w, k).
cell(24,[4, 7], b, r).
cell(24,[7, 1], w, r).
cell(24,[6, 5], w, k).
cell(25,[8, 8], b, r).
cell(25,[3, 2], w, k).
cell(25,[2, 3], w, k).
cell(26,[2, 2], w, k).
cell(26,[6, 4], b, k).
cell(26,[8, 7], w, r).
cell(27,[5, 5], w, r).
cell(27,[1, 6], w, k).
cell(27,[2, 5], w, k).
cell(28,[5, 1], b, k).
cell(28,[2, 4], w, k).
cell(28,[7, 2], w, k).
cell(29,[2, 5], w, r).
cell(29,[4, 2], b, r).
cell(29,[1, 8], b, r).
cell(30,[8, 2], b, k).
cell(30,[5, 5], b, k).
cell(30,[4, 2], b, r).
cell(31,[7, 4], w, r).
cell(31,[3, 2], w, k).
cell(31,[5, 3], b, r).
cell(32,[1, 6], b, r).
cell(32,[3, 2], w, k).
cell(32,[3, 8], b, k).
cell(33,[2, 3], w, r).
cell(33,[6, 8], w, r).
cell(33,[1, 2], b, k).
cell(34,[1, 2], w, r).
cell(34,[3, 1], b, k).
cell(34,[5, 8], w, r).
cell(35,[6, 2], b, r).
cell(35,[5, 4], w, r).
cell(35,[1, 4], w, r).
cell(36,[4, 2], w, k).
cell(36,[5, 5], w, r).
cell(36,[7, 8], w, r).
cell(37,[7, 4], w, k).
cell(37,[4, 1], b, k).
cell(37,[2, 5], w, r).
cell(38,[3, 1], b, k).
cell(38,[2, 2], b, k).
cell(38,[3, 2], w, r).
cell(39,[8, 1], w, k).
cell(39,[6, 8], w, k).
cell(39,[5, 7], b, r).
