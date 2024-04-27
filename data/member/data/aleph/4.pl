:- use_module(library(aleph)).
:- if(current_predicate(use_rendering/1)).
:- use_rendering(prolog).
:- endif.
:- aleph.
:-style_check(-discontiguous).

:- aleph_set(i,6).
:- aleph_set(clauselength,6).
:- aleph_set(nodes,30000).

%% :- modeh(*,f(+list,-element)). % PROBLEM SPECIFIC
:- modeb(*,head(+list,-element)).
:- modeb(*,tail(+list,-list)).
:- modeb(*,geq(+element,+element)).
:- modeb(*,empty(+list)).
:- modeb(*,even(+element)).
:- modeb(*,odd(+element)).
:- modeb(*,one(+element)).
:- modeb(*,zero(-element)).
:- modeb(*,decrement(+element,-element)).
%% :- modeb(*,increment(+element,-element)). % PROBLEM SPECIFIC
%% :- modeb(*,element(+list,-element)). % PROBLEM SPECIFIC
%% :- modeb(*,cons(+element,+list,-list)). % PROBLEM SPECIFIC
:- modeh(*,f(+list,-element)).
:- modeb(*,f(+list,-element)).
%% :- modeb(*,cons(+element,+list,-list)).

:- determination(f/2,head/2).
:- determination(f/2,tail/2).
:- determination(f/2,geq/2).
:- determination(f/2,empty/1).
:- determination(f/2,even/1).
:- determination(f/2,odd/1).
:- determination(f/2,one/1).
:- determination(f/2,zero/1).
:- determination(f/2,decrement/2).
:- determination(f/2,f/2).
%% :- determination(f/2,element/2).
%% :- determination(f/2,increment/2).
%% :- determination(f/2,element/2).
%% :- determination(f/2,cons/3).
:-begin_bg.
is_list([]).
is_list([_|_]).

increment(A,B):-
    (nonvar(A) -> \+ is_list(A); true),
    (nonvar(B) -> \+ is_list(B); true),
    succ(A,B).

decrement(A,B):-
    (nonvar(A) -> \+ is_list(A); true),
    (nonvar(B) -> \+ is_list(B); true),
    succ(B,A).

my_length(A,B):-
    (nonvar(A) -> is_list(A); true),
    (nonvar(B) -> \+is_list(B); true),
    length(A,B).

cons(A,B,C):-
    append([A],B,C).
comps([H|T],H,T).

tail([_|T],T).
head([H|_],H).
sum(A,B,C):-
    (nonvar(A) -> \+ is_list(A); true),
    (nonvar(B) -> \+ is_list(B); true),
    (nonvar(C) -> \+ is_list(B); true),
    C is A+B.
empty([]).

element([X|_],X):-!.
element([_|T],X):-
    element(T,X).

empty_in([]).
empty_out([]).

zero(0).
one(1).

gt(A,B):-
    nonvar(A),
    nonvar(B),
    \+is_list(A),
    \+is_list(B),
    A > B.

geq(A,B):-
    nonvar(A),
    nonvar(B),
    \+is_list(A),
    \+is_list(B),
    A >= B.

even(A):-
    nonvar(A),
    \+ is_list(A),
    0 is A mod 2.

odd(A):-
    nonvar(A),
    \+ is_list(A),
    1 is A mod 2.
:-end_bg.
:-begin_in_pos.
f([9, 84, 56, 16, 94, 25, 71, 96, 69, 24, 53, 91, 85, 59, 57, 19, 27, 1, 73, 22, 70, 88, 26, 41, 86, 16, 98, 45, 74, 80, 93, 20, 89, 45, 44, 24, 71, 2, 97, 2, 72, 35],71).
f([28, 46, 86, 51, 62, 88, 37, 54, 34, 33, 38, 42, 68, 76, 29, 82, 58, 7, 98, 29, 64, 24, 28],42).
f([47, 6, 67, 3, 26, 9, 42, 84, 41, 54, 18, 41, 29, 90, 87, 64, 20, 62, 28, 26, 59, 51, 80, 3, 41, 78, 31, 24, 1, 75, 83, 14, 73, 96, 11, 22, 41, 88, 9, 11, 17, 73, 96],78).
f([18, 56, 28, 72, 35, 83, 39, 46, 40, 69, 2, 17, 61, 62, 10, 11, 11, 55, 73, 19, 1, 97, 30, 54, 45, 23, 6, 66, 28, 20, 4, 40, 78, 69, 37],83).
f([78, 56, 13, 101, 32, 57, 89, 37, 18, 90, 99, 76, 39, 23, 14, 69, 93, 63, 81, 65, 17, 24, 15, 56, 99, 63, 28, 50, 16, 56, 89, 82, 3, 77, 18, 63, 84, 68, 10, 16, 85, 17],69).
f([70, 83, 38, 58, 49, 69, 42, 9, 19, 97, 28, 92, 66, 55, 22, 74, 14],49).
f([98, 40, 57, 98, 44, 12, 48, 2, 23, 89, 2, 81, 26, 21, 33, 86, 56, 2, 6, 80, 67, 51, 90, 27, 48, 5, 19, 74, 70, 52, 6, 93, 14, 27, 68, 55, 101, 38],89).
f([69, 10, 26, 45, 24],45).
f([82, 70, 77, 87, 71, 28, 70, 93, 56, 46, 61, 84, 100, 39, 16, 74, 56, 40, 36, 2, 38, 24, 58, 50, 43, 38, 72, 98, 1, 100, 43, 5, 67, 78, 7, 36, 3, 3, 36, 33, 55, 46, 39, 17, 74],5).
f([12, 44, 99, 11, 85, 6, 98, 32, 68, 43, 68, 66, 46, 62, 49, 57, 52, 96, 38, 27, 62, 15, 61, 62, 81, 70, 82, 76, 48, 53, 77, 69, 11, 72, 61, 19, 88, 83, 61, 52, 93, 4, 16, 57, 56],27).
:-end_in_pos.
:-begin_in_neg.
f([26, 60, 50, 75, 53, 101, 41, 75, 76, 7, 99, 86, 89, 95, 21, 88, 17, 70, 100, 18, 25, 36],87).
f([3, 17, 99, 78, 3, 5, 37, 65, 89, 37, 63, 31, 73, 36, 98, 57, 63, 101, 75, 48, 77, 2, 14, 71],4).
f([42, 88, 38, 18, 71, 94, 55, 69, 3, 4, 49, 11, 27, 13, 97, 23, 63, 75, 1, 60, 8, 99, 26, 19],5).
f([58, 47, 83, 81, 66, 46, 73, 58, 66, 14],70).
f([36, 43, 53, 18, 8, 46, 19, 28, 48, 8, 57, 32, 24, 41, 1, 93, 69, 3, 27, 71, 96, 17, 44, 83, 88, 50, 53, 88, 7, 3, 41, 91],22).
f([54, 74, 77, 58, 43, 78, 52, 62, 22, 16, 65, 43, 16, 77, 61, 85, 83, 7, 7, 33, 54, 22, 49, 62, 8, 81, 87, 80, 68, 7, 84],44).
f([100, 81, 51, 32, 74, 77, 34, 53, 50, 51, 13, 63, 75, 59, 56, 9, 33, 67, 100, 74, 79, 12, 64, 27, 28, 39, 11, 39, 29, 69, 45, 75, 42, 68, 78, 86, 11, 92, 89, 88, 74, 84, 47, 97, 2, 91, 86, 62, 10, 35],21).
f([63, 3, 20, 86],90).
f([27, 78, 37, 21, 41, 44, 10, 99, 4, 96, 12, 54, 57, 63, 34, 41, 21, 67, 53, 30, 95, 55, 88, 78, 11, 61, 2, 95, 83, 49, 2, 54, 49, 72, 59, 49, 10, 39, 39, 77, 58, 29],43).
f([13, 65],74).
:-end_in_neg.
