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
:- modeb(*,cons(+element,+list,-list)).

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
:- determination(f/2,element/2).
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
f([33, 85, 42, 40, 85, 82],85).
f([1, 89, 45, 50, 4, 100, 23, 77, 68, 9, 84, 72, 36, 31, 3, 84, 84, 38, 81, 21, 50],84).
f([98, 94, 9, 7, 53, 44, 64, 34, 46, 95, 55, 17, 7, 9, 80, 98, 73, 23, 79, 89, 4, 77, 58, 86, 39, 92, 87, 41, 25, 71, 25, 10, 68, 52, 26, 1, 7, 43, 78, 70, 18, 10, 19, 59, 70, 47, 34, 51, 89],98).
f([69, 95, 2, 23, 100, 85, 23, 5, 1, 95, 60, 67, 101, 49, 19, 42, 92, 49, 61, 78, 96, 16, 52, 84, 29, 86, 44, 46, 45, 10, 1, 90, 54],23).
f([38, 48, 44, 39, 88, 41, 71, 58, 52, 5, 26, 68, 54, 39, 38, 81, 13, 58, 34],38).
f([81, 88, 101, 2, 74, 27, 85, 96, 59, 91, 58, 42, 32, 100, 97, 13, 7, 63, 31, 39, 66, 39, 47, 91, 61, 56, 17, 88, 57, 26, 60, 58],58).
f([44, 49, 61, 16, 81, 82, 15, 69, 46, 57, 69, 26, 79, 74, 71, 85, 23, 101, 92, 49, 96, 50, 13, 99, 25, 59, 80, 71, 1, 17, 13, 83, 50, 15, 42, 15, 10, 46, 25, 85, 10, 28, 96, 54, 57, 51, 35, 69, 83, 44, 17],15).
f([93, 92, 91, 8, 8, 1],8).
f([36, 12, 40, 63, 17, 89, 97, 7, 38, 92, 89, 11, 29, 10, 35, 11, 41, 22, 43, 15, 81, 21, 26, 36, 31, 8],89).
f([49, 25, 35, 13, 96, 1, 52, 7, 71, 73, 54, 57, 63, 53, 81, 33, 93, 68, 47, 29, 33, 39, 31, 76, 38, 91, 92, 13, 47, 82, 65, 18, 9, 95, 93, 8, 73, 28, 62, 78],13).
:-end_in_pos.
:-begin_in_neg.
f([75, 3, 2, 92, 21, 25, 38, 41, 50, 59, 52, 52, 21, 52, 63, 56, 100, 99, 38, 70],25).
f([34, 68, 78, 55, 85, 33, 85, 29, 51, 24, 72, 7, 62, 18],18).
f([48, 71, 75, 54, 33, 90, 59, 66, 88, 26, 42, 66, 91, 54, 99, 95, 41, 80, 60, 85, 10, 13, 75],42).
f([25, 6, 65, 7, 9, 31, 19, 81, 4, 38, 57, 37, 54, 79, 91, 30, 9, 48, 6, 5, 71, 95, 46, 97, 40, 13, 2, 94, 74, 17, 98, 101],46).
f([20, 89, 50, 42, 95, 41, 43, 78, 69, 13, 68, 6, 19, 39, 42, 74, 4, 30, 83, 74, 81, 34, 99, 67, 84, 32, 84, 60, 28, 18, 80, 76, 82, 25, 8, 39, 94, 56, 20, 67, 32, 9, 29, 28, 96, 23, 92, 92, 54, 99, 67],68).
f([20, 55, 83, 81, 23, 68, 77, 12, 4, 53, 75, 95, 20, 98, 12, 3, 37, 28, 94, 100, 35, 13],53).
f([44, 64, 28, 56, 5, 54, 59, 40],64).
f([5, 43, 60, 3, 8, 74, 60, 85, 28, 38, 71, 15, 68, 10, 58, 57, 38, 96, 2, 6, 46, 65, 88, 72, 91, 64, 57, 72],5).
f([76, 92, 89, 38, 5, 38, 87, 64, 11, 21, 28, 51, 8, 98, 50, 87, 14, 14, 30, 4, 4, 98, 92, 51, 5, 63, 16, 12, 6, 45, 24, 82, 53],11).
f([70, 7, 93, 72, 12, 44, 65, 73, 26, 22, 58, 27, 95, 88, 71, 24, 32, 45, 57, 6, 97, 54],7).
:-end_in_neg.
