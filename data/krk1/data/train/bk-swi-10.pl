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

cell(0,[8, 7], w, r).
cell(0,[6, 1], b, k).
cell(0,[7, 8], w, k).
cell(1,[8, 8], w, r).
cell(1,[5, 6], b, k).
cell(1,[8, 7], w, k).
cell(2,[5, 5], w, r).
cell(2,[3, 8], b, k).
cell(2,[6, 6], w, k).
cell(3,[1, 2], w, r).
cell(3,[3, 7], b, k).
cell(3,[2, 1], w, k).
cell(4,[5, 8], w, r).
cell(4,[1, 4], b, k).
cell(4,[6, 8], w, k).
cell(5,[2, 4], w, r).
cell(5,[6, 8], b, k).
cell(5,[2, 5], w, k).
cell(6,[4, 3], w, r).
cell(6,[5, 6], b, k).
cell(6,[3, 2], w, k).
cell(7,[1, 3], w, r).
cell(7,[1, 1], b, k).
cell(7,[2, 4], w, k).
cell(8,[8, 8], w, r).
cell(8,[4, 5], b, k).
cell(8,[8, 7], w, k).
cell(9,[5, 3], w, r).
cell(9,[1, 1], b, k).
cell(9,[5, 4], w, k).
cell(10,[5, 5], w, r).
cell(10,[4, 6], b, k).
cell(10,[6, 4], w, k).
cell(11,[2, 6], w, r).
cell(11,[3, 4], b, k).
cell(11,[3, 6], w, k).
cell(12,[3, 8], w, r).
cell(12,[2, 5], b, k).
cell(12,[2, 7], w, k).
cell(13,[2, 1], w, r).
cell(13,[4, 3], b, k).
cell(13,[1, 2], w, k).
cell(14,[7, 1], w, r).
cell(14,[1, 4], b, k).
cell(14,[6, 1], w, k).
cell(15,[1, 8], w, r).
cell(15,[8, 1], b, k).
cell(15,[2, 8], w, k).
cell(16,[7, 3], w, r).
cell(16,[3, 4], b, k).
cell(16,[6, 3], w, k).
cell(17,[4, 4], w, r).
cell(17,[6, 8], b, k).
cell(17,[4, 3], w, k).
cell(18,[8, 8], w, r).
cell(18,[5, 1], b, k).
cell(18,[7, 7], w, k).
cell(19,[2, 1], w, r).
cell(19,[7, 4], b, k).
cell(19,[1, 1], w, k).
cell(20,[8, 7], w, r).
cell(20,[3, 5], b, r).
cell(20,[1, 3], b, r).
cell(21,[1, 1], b, k).
cell(21,[3, 4], w, k).
cell(21,[2, 4], b, r).
cell(22,[8, 8], w, r).
cell(22,[6, 1], w, k).
cell(22,[6, 7], w, r).
cell(23,[4, 3], b, k).
cell(23,[6, 6], w, r).
cell(23,[4, 1], b, r).
cell(24,[8, 3], w, r).
cell(24,[3, 2], w, k).
cell(24,[2, 7], w, k).
cell(25,[4, 7], b, r).
cell(25,[6, 1], b, k).
cell(25,[3, 4], w, r).
cell(26,[4, 7], w, k).
cell(26,[3, 3], b, r).
cell(26,[1, 4], b, k).
cell(27,[8, 4], b, k).
cell(27,[6, 8], w, r).
cell(27,[6, 7], b, k).
cell(28,[2, 6], w, r).
cell(28,[8, 4], w, k).
cell(28,[4, 4], b, r).
cell(29,[6, 2], w, r).
cell(29,[4, 4], w, k).
cell(29,[6, 8], w, r).
cell(30,[1, 4], b, k).
cell(30,[1, 1], b, k).
cell(30,[1, 7], b, k).
cell(31,[2, 7], w, k).
cell(31,[8, 1], w, r).
cell(31,[2, 4], b, k).
cell(32,[3, 3], w, k).
cell(32,[7, 8], b, r).
cell(32,[2, 3], w, k).
cell(33,[1, 5], b, k).
cell(33,[7, 3], b, r).
cell(33,[7, 4], w, k).
cell(34,[5, 2], w, r).
cell(34,[7, 8], b, r).
cell(34,[2, 4], b, k).
cell(35,[2, 2], b, r).
cell(35,[7, 7], w, r).
cell(35,[5, 3], w, k).
cell(36,[2, 4], w, r).
cell(36,[8, 7], b, r).
cell(36,[1, 8], b, k).
cell(37,[5, 6], b, k).
cell(37,[7, 5], w, r).
cell(37,[8, 2], b, r).
cell(38,[6, 6], b, k).
cell(38,[8, 3], b, r).
cell(38,[8, 8], b, r).
cell(39,[2, 7], b, k).
cell(39,[4, 6], b, k).
cell(39,[1, 5], w, r).
