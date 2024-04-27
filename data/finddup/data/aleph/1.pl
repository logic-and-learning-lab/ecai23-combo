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
f([47, 53, 66, 21, 47, 83, 92, 80, 9, 99, 30, 51, 35, 82, 68, 21, 5, 73, 86, 1, 84, 98, 23, 35, 6, 100, 75, 3, 62, 40, 38, 20, 75, 50, 81, 15, 95, 89, 99],21).
f([17, 44, 41, 43, 10, 85, 24, 47, 18, 77, 94, 19, 85, 62, 2, 36, 93, 44, 35, 59, 63, 24, 66, 57, 5, 38, 94, 29, 44, 30, 43],44).
f([92, 54, 27, 33, 93, 30, 94, 94, 37, 83, 29, 33, 8, 37, 97, 89, 55, 41, 2, 53, 41, 47, 63, 67, 71, 46, 34, 83, 61, 27, 76, 54, 46, 14, 47, 37, 67, 99, 69, 38, 36, 79, 53, 10, 74, 99, 85, 88, 52],41).
f([54, 48, 80, 78, 76, 36, 90, 100, 96, 72, 23, 46, 13, 35, 46, 71, 85, 22, 45, 34, 20, 6, 49, 70, 77, 74, 70, 66, 10, 67, 23, 5, 73, 74, 7, 40, 75, 49, 37, 31, 31, 47, 14, 72, 89, 50, 55, 64, 64, 22, 18, 97],22).
f([24, 24, 85, 74, 23, 63],24).
f([66, 23, 18, 91, 46, 45, 56, 38, 84, 45, 23, 31, 73, 80, 66, 60, 73, 96, 100, 11, 73, 18, 52, 63, 97],73).
f([4, 94, 62, 7, 32, 100, 54, 11, 74, 5, 91, 66, 42, 4, 47, 54, 8, 44, 44, 84, 92, 4, 12, 89, 62, 87, 91, 38, 48, 20, 32, 75, 78],54).
f([75, 77, 15, 90, 92, 100, 97, 10, 32, 56, 42, 57, 64, 60, 29, 65, 18, 87, 30, 53, 53, 19, 90],53).
f([60, 84, 19, 90, 6, 58, 3, 58, 36, 28, 100, 20, 39, 62, 51, 63, 20, 9, 91, 48, 72, 73, 94, 87, 94, 78, 64, 69, 11, 28, 100, 31, 96, 75, 41, 91, 97, 36, 66, 27, 18, 78, 43],100).
f([20, 84, 61, 61, 11, 88, 62, 91, 54, 18, 63, 78, 79, 45, 17, 11, 81, 22, 89, 84, 35, 51, 74, 68, 35, 70, 90, 86, 49, 82, 46, 87, 1, 22, 7, 29, 79, 97, 12, 33, 29, 59, 23, 76, 65, 57, 59, 15],84).
:-end_in_pos.
:-begin_in_neg.
f([37, 4, 9, 47, 100, 5, 81, 93, 23, 39, 19, 80, 67, 41, 21, 42, 66, 76, 87, 85, 57, 48],81).
f([64, 19, 36, 13, 91, 83, 79, 96, 38, 67, 46, 38, 53, 62, 86, 42, 9, 36, 29, 54, 61, 89, 52, 93, 27, 40, 77, 4, 39, 61, 80, 97, 5, 12, 96, 71, 42, 75, 60, 59, 77, 37, 54, 37, 8, 23, 73, 62, 80, 78, 28],8).
f([78, 71, 17, 101],101).
f([96, 14, 51, 63, 7],7).
f([14, 67, 47, 22, 62, 27, 23, 44, 2, 94, 69, 30, 59, 56, 63, 47, 46, 93, 67, 45, 20, 85, 72, 62, 97, 4, 45, 22, 82, 33, 62, 11, 48, 5, 73, 40, 43, 47, 73, 90, 14, 23],40).
f([80, 30, 88, 71, 79, 92, 79, 62, 73, 89, 72, 15, 73, 32, 62, 54, 2, 2, 51, 34, 85, 20, 6, 19, 23, 45, 46, 87, 68, 61, 83],46).
f([73, 22, 32, 94, 60, 90, 69],73).
f([62, 20, 92, 13, 82, 40, 87, 59, 5, 3, 85, 75, 46, 53, 80, 63, 61, 52, 31, 72, 82, 32, 78, 75, 62, 4, 24, 42, 74, 36, 52, 30, 39, 28, 97, 37, 21, 82, 45, 12, 2, 64, 37, 75, 4],61).
f([46, 58, 78, 80, 30, 33, 96, 91, 64, 25, 3, 70, 23, 47, 7, 66, 82, 27, 59, 14, 62, 98, 81, 66, 27, 22, 3, 18, 55, 29, 7, 86, 92, 68, 25, 46, 15, 80, 30, 41, 28, 21, 31, 97, 21, 86, 39, 65, 38, 71],68).
f([94, 90, 74, 34, 95, 28, 80, 98, 22, 43, 57, 51, 81, 87],43).
:-end_in_neg.
