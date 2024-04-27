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

cell(0,[5, 7], w, r).
cell(0,[5, 3], b, k).
cell(0,[6, 6], w, k).
cell(1,[7, 7], w, r).
cell(1,[8, 7], b, k).
cell(1,[6, 5], w, k).
cell(2,[1, 5], w, r).
cell(2,[8, 5], b, k).
cell(2,[7, 2], w, k).
cell(3,[1, 8], w, r).
cell(3,[1, 5], b, k).
cell(3,[8, 1], w, k).
cell(4,[8, 4], w, r).
cell(4,[8, 2], b, k).
cell(4,[6, 1], w, k).
cell(5,[5, 8], w, r).
cell(5,[3, 8], b, k).
cell(5,[2, 8], w, k).
cell(6,[7, 2], w, r).
cell(6,[3, 2], b, k).
cell(6,[4, 4], w, k).
cell(7,[4, 3], w, r).
cell(7,[1, 3], b, k).
cell(7,[2, 1], w, k).
cell(8,[4, 6], w, r).
cell(8,[4, 3], b, k).
cell(8,[3, 1], w, k).
cell(9,[8, 5], w, r).
cell(9,[8, 1], b, k).
cell(9,[6, 4], w, k).
cell(10,[8, 6], w, r).
cell(10,[8, 5], b, k).
cell(10,[2, 4], w, k).
cell(11,[4, 6], w, r).
cell(11,[4, 5], b, k).
cell(11,[3, 3], w, k).
cell(12,[7, 1], w, r).
cell(12,[4, 1], b, k).
cell(12,[3, 8], w, k).
cell(13,[5, 4], w, r).
cell(13,[2, 4], b, k).
cell(13,[5, 3], w, k).
cell(14,[2, 5], w, r).
cell(14,[2, 1], b, k).
cell(14,[1, 5], w, k).
cell(15,[7, 5], w, r).
cell(15,[7, 3], b, k).
cell(15,[4, 5], w, k).
cell(16,[4, 8], w, r).
cell(16,[4, 7], b, k).
cell(16,[8, 5], w, k).
cell(17,[2, 2], w, r).
cell(17,[8, 2], b, k).
cell(17,[4, 1], w, k).
cell(18,[5, 6], w, r).
cell(18,[7, 6], b, k).
cell(18,[8, 4], w, k).
cell(19,[5, 8], w, r).
cell(19,[5, 5], b, k).
cell(19,[6, 7], w, k).
cell(20,[8, 7], b, k).
cell(20,[3, 8], w, k).
cell(20,[3, 2], w, k).
cell(21,[1, 2], b, r).
cell(21,[8, 1], b, r).
cell(21,[4, 5], w, k).
cell(22,[5, 5], w, r).
cell(22,[4, 7], w, k).
cell(22,[7, 4], b, k).
cell(23,[7, 3], b, k).
cell(23,[2, 1], w, r).
cell(23,[3, 5], w, r).
cell(24,[2, 4], b, k).
cell(24,[6, 7], b, r).
cell(24,[7, 4], b, k).
cell(25,[1, 8], w, k).
cell(25,[4, 5], b, k).
cell(25,[7, 1], w, k).
cell(26,[1, 5], w, k).
cell(26,[2, 8], w, k).
cell(26,[8, 3], b, k).
cell(27,[6, 4], w, r).
cell(27,[7, 4], b, r).
cell(27,[7, 2], b, k).
cell(28,[6, 2], b, r).
cell(28,[5, 6], w, r).
cell(28,[6, 1], w, k).
cell(29,[3, 8], w, k).
cell(29,[3, 5], b, k).
cell(29,[8, 1], b, k).
cell(30,[5, 2], w, k).
cell(30,[7, 5], w, r).
cell(30,[8, 4], w, k).
cell(31,[1, 7], b, r).
cell(31,[1, 6], b, k).
cell(31,[4, 7], w, k).
cell(32,[1, 6], b, r).
cell(32,[7, 1], b, r).
cell(32,[3, 2], w, k).
cell(33,[4, 2], w, k).
cell(33,[2, 1], w, r).
cell(33,[1, 8], b, r).
cell(34,[7, 5], b, r).
cell(34,[3, 2], w, k).
cell(34,[8, 8], b, k).
cell(35,[1, 5], w, r).
cell(35,[1, 4], w, r).
cell(35,[6, 6], b, k).
cell(36,[1, 5], w, k).
cell(36,[5, 2], w, r).
cell(36,[6, 4], w, k).
cell(37,[8, 1], b, k).
cell(37,[4, 2], w, r).
cell(37,[6, 1], b, k).
cell(38,[3, 6], b, r).
cell(38,[4, 8], w, k).
cell(38,[4, 1], w, k).
cell(39,[7, 1], w, k).
cell(39,[4, 4], w, r).
cell(39,[2, 3], b, k).
