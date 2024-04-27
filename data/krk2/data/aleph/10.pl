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
:- modeb(*,samerank(+pos, -pos)).
:- modeb(*,samefile(+pos, -pos)).
:- modeb(*,nextrank(+pos, -pos)).
:- modeb(*,nextfile(+pos, -pos)).
:- modeb(*,distance(+pos, +pos, -int)).
:- modeb(*,king(+piecetype)).
:- modeb(*,rook(+piecetype)).
:- modeb(*,white(+color)).
:- modeb(*,black(+color)).
:- modeb(*,one(+int)).
:- modeb(*,two(+int)).
:- modeb(*,three(+int)).

:- determination(f/1,cell/4).
:- determination(f/1,samerank/2).
:- determination(f/1,samefile/2).
:- determination(f/1,nextrank/2).
:- determination(f/1,nextfile/2).
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

cell(0,[2, 7], w, k).
cell(0,[4, 7], b, k).
cell(0,[5, 8], w, r).
cell(1,[5, 3], w, k).
cell(1,[5, 1], b, k).
cell(1,[4, 8], w, r).
cell(2,[1, 6], w, k).
cell(2,[3, 6], b, k).
cell(2,[6, 3], w, r).
cell(3,[1, 8], w, k).
cell(3,[1, 6], b, k).
cell(3,[4, 3], w, r).
cell(4,[7, 6], w, k).
cell(4,[7, 8], b, k).
cell(4,[4, 6], w, r).
cell(5,[1, 6], w, k).
cell(5,[3, 6], b, k).
cell(5,[7, 5], w, r).
cell(6,[6, 4], w, k).
cell(6,[6, 2], b, k).
cell(6,[7, 4], w, r).
cell(7,[6, 3], w, k).
cell(7,[4, 3], b, k).
cell(7,[5, 2], w, r).
cell(8,[8, 7], w, k).
cell(8,[6, 7], b, k).
cell(8,[6, 2], w, r).
cell(9,[4, 8], w, k).
cell(9,[4, 6], b, k).
cell(9,[3, 4], w, r).
cell(10,[1, 1], w, k).
cell(10,[3, 1], b, k).
cell(10,[7, 5], w, r).
cell(11,[1, 5], w, k).
cell(11,[3, 5], b, k).
cell(11,[6, 1], w, r).
cell(12,[6, 2], w, k).
cell(12,[6, 4], b, k).
cell(12,[2, 5], w, r).
cell(13,[4, 5], w, k).
cell(13,[4, 7], b, k).
cell(13,[6, 3], w, r).
cell(14,[5, 4], w, k).
cell(14,[7, 4], b, k).
cell(14,[2, 1], w, r).
cell(15,[4, 8], w, k).
cell(15,[4, 6], b, k).
cell(15,[4, 2], w, r).
cell(16,[6, 2], w, k).
cell(16,[4, 2], b, k).
cell(16,[2, 4], w, r).
cell(17,[6, 7], w, k).
cell(17,[6, 5], b, k).
cell(17,[1, 7], w, r).
cell(18,[7, 2], w, k).
cell(18,[7, 4], b, k).
cell(18,[7, 5], w, r).
cell(19,[3, 3], w, k).
cell(19,[1, 3], b, k).
cell(19,[6, 2], w, r).
cell(20,[7, 6], b, r).
cell(20,[6, 7],  w, k).
cell(20,[3, 5], b, k).
cell(21,[8, 2], w, k).
cell(21,[1, 7],  w, k).
cell(21,[6, 8], b, k).
cell(22,[4, 1], w, k).
cell(22,[8, 8],  b, k).
cell(22,[3, 8], b, r).
cell(23,[7, 4], w, r).
cell(23,[1, 5],  w, r).
cell(23,[7, 5], w, r).
cell(24,[7, 4], b, k).
cell(24,[4, 3],  w, r).
cell(24,[2, 7], w, r).
cell(25,[6, 7], b, k).
cell(25,[7, 1],  b, r).
cell(25,[7, 8], w, k).
cell(26,[4, 3], b, r).
cell(26,[7, 8],  w, k).
cell(26,[2, 4], w, r).
cell(27,[4, 3], w, k).
cell(27,[8, 7],  w, r).
cell(27,[1, 1], b, k).
cell(28,[2, 8], w, k).
cell(28,[1, 6],  w, r).
cell(28,[3, 1], w, r).
cell(29,[8, 3], w, r).
cell(29,[3, 7],  b, r).
cell(29,[7, 3], b, k).
cell(30,[3, 2], b, r).
cell(30,[3, 5],  b, k).
cell(30,[7, 1], w, r).
cell(31,[4, 4], b, k).
cell(31,[5, 2],  w, k).
cell(31,[7, 1], w, r).
cell(32,[5, 3], b, k).
cell(32,[5, 2],  w, k).
cell(32,[5, 8], b, k).
cell(33,[4, 4], w, k).
cell(33,[5, 8],  w, k).
cell(33,[7, 3], b, k).
cell(34,[7, 3], b, k).
cell(34,[2, 7],  b, k).
cell(34,[8, 4], b, k).
cell(35,[1, 6], b, r).
cell(35,[6, 2],  b, r).
cell(35,[1, 3], b, k).
cell(36,[8, 1], w, r).
cell(36,[4, 2],  b, k).
cell(36,[6, 6], w, k).
cell(37,[6, 1], w, r).
cell(37,[8, 7],  w, k).
cell(37,[5, 2], w, k).
cell(38,[8, 8], w, r).
cell(38,[7, 5],  b, r).
cell(38,[3, 2], w, k).
cell(39,[6, 3], w, r).
cell(39,[3, 1],  b, k).
cell(39,[7, 2], w, r).

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
