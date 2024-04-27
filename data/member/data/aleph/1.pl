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
f([88, 61, 63, 32, 79, 53, 99, 83, 71, 13, 71, 34, 64, 27, 47, 80, 26, 50, 74, 28, 37, 25, 67, 99, 25, 56, 25, 13, 38, 89, 79, 83, 84, 45, 55, 46, 61],71).
f([25, 66, 65, 97],97).
f([96, 82, 44, 52, 92, 57, 28, 44, 52, 28, 78, 83, 6, 87, 28, 61, 93, 56, 46, 29, 22, 53, 71, 13, 60, 39, 93, 80, 61, 49, 94, 76],57).
f([71, 56, 73, 67, 100, 54, 29, 49, 86, 28, 81, 82, 48, 73, 62, 27, 61, 32, 16, 31, 55, 6, 93, 62, 4, 1, 59, 48, 71, 59, 5, 31, 44, 29, 49, 64, 20, 70, 13, 12, 98, 45, 65, 10, 20],49).
f([25, 11, 48, 85, 11, 1, 83, 90, 52, 56, 86, 51, 86, 3, 20, 27, 78, 69, 40, 91, 24, 99, 49, 41, 35, 94, 11, 83, 19, 19, 39, 89, 64, 79, 43, 60, 57, 34, 21],90).
f([82, 3, 18, 13, 76, 45, 25, 99, 82, 33, 6, 16, 87, 24, 100, 43, 70, 18, 55, 47, 23, 83, 80],45).
f([43, 30, 53, 88, 27, 97, 72, 18, 47, 66, 41, 98],72).
f([23, 53, 30, 2, 83, 23, 50, 56, 88, 59, 49, 46, 18, 63, 91, 27, 15, 61, 93, 14, 16],93).
f([42, 81, 12, 4, 12, 66, 75, 44, 75, 15, 30, 47, 52, 94, 80, 58, 26, 50, 72, 43, 90, 75, 33, 19, 64, 11, 99, 20, 66, 16, 23, 101, 52, 59],12).
f([66, 28, 73, 77, 59, 82, 77, 35, 15, 3, 92, 80, 46, 93, 59, 12, 22, 30, 100, 97, 10, 92, 68, 29, 17, 43, 43, 23, 33, 86, 42, 86, 21, 62, 13, 85, 98, 86],15).
:-end_in_pos.
:-begin_in_neg.
f([53, 22, 21, 89, 70, 7, 97, 47, 48, 49, 86, 30, 56, 97, 53, 32, 43, 49, 97, 88, 23, 94, 1, 77, 36, 91, 71, 62, 42, 65, 30, 87, 33, 44, 52, 79, 62, 45, 24, 23, 92, 4, 100, 1, 87, 33, 75, 62, 58, 26],3).
f([84, 9, 87, 95, 86, 21, 38, 3, 34, 46, 74, 40, 100, 43, 55, 55, 36, 68, 67, 95, 15, 75, 83, 72, 49, 14, 46, 43, 93, 79, 96, 27, 28, 22, 10],80).
f([52, 4, 74, 16, 43, 47, 29, 59, 77, 65, 35, 48, 54, 48, 70, 73, 82, 60, 57, 91, 77, 101, 71, 46, 41, 95, 56, 30, 93, 53, 21, 56, 17, 71, 59],81).
f([14, 91, 91, 45, 81, 100, 79, 47, 69],52).
f([51, 6, 28, 57, 60, 71, 2, 64, 25, 30, 80, 79, 90, 37, 92, 70, 12, 19, 78, 31, 43, 24, 11, 87, 94, 42, 58, 64, 13, 2, 33, 30, 24, 4, 5, 57, 44, 66, 52, 76, 50, 39, 33],18).
f([73, 12, 48, 21, 90, 60, 32, 25, 7, 98, 87, 1, 65, 19, 12, 13],61).
f([90, 25, 50, 74, 23, 35, 57, 88, 86, 26, 23, 68, 10, 45, 12, 9, 75, 38, 42, 3, 85, 97, 44, 95, 9, 40, 98, 25, 16, 16, 96, 84, 89, 38, 58, 56, 81, 4, 60, 94, 61, 35, 70, 71, 90, 98, 82],83).
f([86, 27, 64, 21, 31],34).
f([86, 41, 56, 78, 84, 63, 58, 46, 11, 31, 88],77).
f([35, 17, 92, 1, 51, 68, 40, 54, 27, 85, 65, 28, 67, 66, 26, 42, 79, 31, 95, 31, 40, 69, 16, 92, 53, 100, 16, 18, 45, 56, 4, 77, 44, 74],9).
:-end_in_neg.
