:- use_module(library(aleph)).
:- if(current_predicate(use_rendering/1)).
:- use_rendering(prolog).
:- endif.
:- aleph.
:-style_check(-discontiguous).

:- aleph_set(verbosity, 0).
:- aleph_set(interactive, false).
:- aleph_set(i,7).
:- aleph_set(clauselength,9).
:- aleph_set(nodes,30000).

:- modeh(*,f(+state)).
:- modeb(*,cell(+state, -pos, -color, -piecetype)).
:- modeb(*,distance(+pos, +pos, -int)).
:- modeb(*,king(+piecetype)).
:- modeb(*,rook(+piecetype)).
:- modeb(*,white(+color)).
:- modeb(*,black(+color)).
:- modeb(*,one(+int)).
:- modeb(*,two(+int)).
:- modeb(*,three(+int)).

:- determination(f/1,cell/4).
:- determination(f/1,distance/3).
:- determination(f/1,king/1).
:- determination(f/1,rook/1).
:- determination(f/1,white/1).
:- determination(f/1,black/1).
:- determination(f/1,one/1).
:- determination(f/1,two/1).
:- determination(f/1,three/1).
:-begin_bg.

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

cell(0,[6, 5], w, r).
cell(0,[6, 4], b, k).
cell(0,[7, 6], w, k).
cell(1,[5, 3], w, r).
cell(1,[7, 3], b, k).
cell(1,[6, 4], w, k).
cell(2,[1, 4], w, r).
cell(2,[8, 4], b, k).
cell(2,[2, 3], w, k).
cell(3,[2, 1], w, r).
cell(3,[6, 1], b, k).
cell(3,[1, 2], w, k).
cell(4,[1, 6], w, r).
cell(4,[4, 4], b, k).
cell(4,[2, 6], w, k).
cell(5,[5, 8], w, r).
cell(5,[1, 3], b, k).
cell(5,[6, 7], w, k).
cell(6,[5, 6], w, r).
cell(6,[4, 3], b, k).
cell(6,[5, 7], w, k).
cell(7,[7, 8], w, r).
cell(7,[1, 6], b, k).
cell(7,[6, 8], w, k).
cell(8,[4, 1], w, r).
cell(8,[7, 2], b, k).
cell(8,[3, 1], w, k).
cell(9,[1, 1], w, r).
cell(9,[8, 6], b, k).
cell(9,[2, 1], w, k).
cell(10,[4, 7], w, r).
cell(10,[3, 1], b, k).
cell(10,[5, 7], w, k).
cell(11,[6, 4], w, r).
cell(11,[6, 5], b, k).
cell(11,[7, 4], w, k).
cell(12,[3, 8], w, r).
cell(12,[6, 8], b, k).
cell(12,[4, 8], w, k).
cell(13,[2, 8], w, r).
cell(13,[3, 3], b, k).
cell(13,[1, 7], w, k).
cell(14,[6, 5], w, r).
cell(14,[7, 8], b, k).
cell(14,[5, 6], w, k).
cell(15,[4, 4], w, r).
cell(15,[3, 4], b, k).
cell(15,[5, 3], w, k).
cell(16,[6, 2], w, r).
cell(16,[1, 1], b, k).
cell(16,[5, 2], w, k).
cell(17,[2, 2], w, r).
cell(17,[6, 1], b, k).
cell(17,[1, 2], w, k).
cell(18,[3, 2], w, r).
cell(18,[1, 6], b, k).
cell(18,[3, 3], w, k).
cell(19,[4, 3], w, r).
cell(19,[4, 1], b, k).
cell(19,[4, 2], w, k).
cell(20,[1, 7], w, r).
cell(20,[4, 7], b, r).
cell(20,[2, 4], w, r).
cell(21,[8, 4], b, r).
cell(21,[4, 8], b, r).
cell(21,[2, 2], b, r).
cell(22,[7, 4], b, k).
cell(22,[8, 7], w, k).
cell(22,[4, 3], w, r).
cell(23,[4, 8], w, k).
cell(23,[2, 3], b, r).
cell(23,[8, 4], b, k).
cell(24,[5, 5], w, k).
cell(24,[2, 7], w, r).
cell(24,[5, 4], b, k).
cell(25,[5, 3], b, k).
cell(25,[4, 3], b, r).
cell(25,[1, 7], w, k).
cell(26,[8, 5], w, r).
cell(26,[6, 8], w, k).
cell(26,[5, 1], b, k).
cell(27,[7, 6], w, r).
cell(27,[2, 7], w, r).
cell(27,[7, 4], w, r).
cell(28,[8, 1], w, r).
cell(28,[6, 3], w, r).
cell(28,[3, 2], b, r).
cell(29,[7, 7], b, k).
cell(29,[4, 8], b, k).
cell(29,[6, 6], w, k).
cell(30,[6, 6], w, k).
cell(30,[6, 1], w, r).
cell(30,[8, 5], w, k).
cell(31,[7, 4], b, k).
cell(31,[4, 3], b, k).
cell(31,[5, 8], w, k).
cell(32,[3, 2], b, r).
cell(32,[4, 1], b, r).
cell(32,[8, 2], b, r).
cell(33,[1, 8], b, k).
cell(33,[5, 7], w, k).
cell(33,[3, 5], b, k).
cell(34,[4, 2], w, r).
cell(34,[5, 1], b, k).
cell(34,[2, 1], b, r).
cell(35,[8, 8], w, k).
cell(35,[3, 1], b, r).
cell(35,[8, 2], w, r).
cell(36,[8, 6], w, k).
cell(36,[4, 5], w, k).
cell(36,[3, 2], b, k).
cell(37,[1, 6], b, k).
cell(37,[3, 8], w, k).
cell(37,[8, 3], b, k).
cell(38,[8, 3], b, k).
cell(38,[7, 4], b, k).
cell(38,[8, 7], b, r).
cell(39,[3, 4], b, k).
cell(39,[2, 1], b, k).
cell(39,[6, 8], w, k).

:-end_bg.
:-begin_in_pos.
f(0).
f(1).
f(2).
f(3).
f(4).
f(5).
f(6).
f(7).
f(8).
f(9).
f(10).
f(11).
f(12).
f(13).
f(14).
f(15).
f(16).
f(17).
f(18).
f(19).
:-end_in_pos.
:-begin_in_neg.
f(20).
f(21).
f(22).
f(23).
f(24).
f(25).
f(26).
f(27).
f(28).
f(29).
f(30).
f(31).
f(32).
f(33).
f(34).
f(35).
f(36).
f(37).
f(38).
f(39).
:-end_in_neg.
