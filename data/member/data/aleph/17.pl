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
f([95, 73, 73, 65, 34, 57, 81, 94, 8, 5, 87, 83, 41, 49, 69, 31, 58, 88, 34, 85, 68, 12, 41, 6, 70, 22, 13, 49, 60, 15, 100, 14, 3, 10, 85],73).
f([13, 29, 67, 81, 15, 65, 48, 63, 71, 59, 57, 21, 25, 85, 52, 91, 44, 67, 3, 3, 15, 48, 4, 41, 33, 55, 87, 3, 71, 21, 1, 38, 3, 74, 55, 61, 17],65).
f([34, 95, 17, 94, 25, 73, 91, 42, 44, 45, 59, 16, 98, 55, 44, 13, 6, 34, 3, 58, 64, 101, 96, 77, 23, 38, 12],73).
f([64, 22, 61, 40, 55, 43, 19, 17, 87, 25, 5, 49, 5, 3, 75, 1, 83, 32, 79, 70, 9, 36, 76, 33],70).
f([16, 97, 48, 50, 79, 72, 85, 13, 29, 95, 75, 52, 75, 93, 85, 29, 39, 29, 18, 46, 53, 95, 68, 99, 91, 71, 44, 49, 54, 4, 77, 40],85).
f([74, 73, 86, 68, 73, 14, 30, 32, 82, 49, 21, 96, 11, 33, 63, 79, 24, 54, 67, 28, 41, 86, 60, 50, 67, 100, 28, 40, 34, 38, 8, 8, 14, 89, 43],40).
f([94, 72, 14, 23, 47, 75, 29, 90, 22, 90, 56, 57, 56, 86, 1, 34, 54, 49, 88, 101, 53, 62, 73, 44, 18, 48, 31, 50, 46, 13, 53, 61, 12, 22, 98, 52],47).
f([47, 81, 54, 56, 34, 40, 25, 51, 36, 99, 94, 79, 93, 19, 53, 63, 81, 84, 24, 89, 59, 2, 23, 6, 32, 59, 27, 82, 24, 41, 17, 46, 19, 79, 87, 96, 70, 76, 94, 71, 96, 35, 79, 78, 8, 2, 87, 88, 43, 8],41).
f([47, 101, 46, 97, 96, 7, 83, 23, 85, 38, 30, 83, 54, 7, 40, 88, 23, 36, 44, 42, 7, 9, 100, 45, 43, 10, 86, 21, 86, 85, 52, 35, 3, 38, 19, 20, 55],9).
f([100, 99, 4, 86, 49, 52, 70, 30, 57, 12, 5, 99, 52, 33, 70, 33, 81],4).
:-end_in_pos.
:-begin_in_neg.
f([67, 31, 10, 1, 89, 64, 34, 86, 27, 60, 91, 80, 60, 101, 49, 34, 49, 9, 73],75).
f([87, 26, 94, 81, 50, 24, 2, 62, 73, 87, 52, 48, 18, 4, 15, 74, 99, 29],30).
f([86],59).
f([17, 70, 9, 93, 77, 16, 1, 88, 101, 33, 58, 3, 46, 60, 97, 61, 28, 12, 8],7).
f([71, 66, 93, 63, 29, 60, 94, 37, 92, 3, 8, 8, 93, 36, 85, 68, 21, 87, 89, 8, 31, 94, 72, 88, 97, 23, 21, 81, 56, 29, 87, 70, 9, 26, 87, 58, 42, 18, 80, 98, 1, 62, 64, 76, 91],38).
f([71, 58, 78, 13, 95, 27, 100, 52, 29, 8, 1, 53, 98, 24, 87, 89],42).
f([88, 91, 77, 6, 12, 11, 41, 73, 5, 44, 49, 61, 16, 36, 98, 100, 31, 55, 45, 93, 39],4).
f([11, 63, 83, 7, 20, 40, 32, 8, 19, 47, 52, 1, 94, 5, 33, 46, 56, 74, 73, 38, 94, 54, 70],58).
f([36, 43, 100, 51, 82, 44, 94, 63, 101, 56, 47, 88, 33, 7, 18, 87, 76, 68, 55, 12, 99, 52, 68, 55, 5, 56, 44, 52, 71, 31, 45, 64, 76, 10, 71, 11, 71, 16, 54, 92, 8, 6, 45, 79, 35, 53, 51, 3, 75],1).
f([24, 99, 37, 26, 10, 51, 21, 29, 9, 17, 70, 37, 96, 69, 35, 81, 57, 1, 19, 58, 21, 84, 98, 62, 15, 10, 96, 33, 36, 42, 24, 45, 67, 12],85).
:-end_in_neg.
