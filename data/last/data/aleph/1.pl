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
f([74, 69, 8, 32, 7, 20, 57, 34, 5, 22, 70, 90, 90, 6, 96, 73, 37, 84, 67, 82, 94, 1, 73, 69, 66, 90, 63, 35, 16, 59, 61, 58, 29, 28, 100, 28, 86, 35, 75, 3, 85, 62, 1, 44, 31, 42, 27, 10, 22, 87],87).
f([5, 63, 86, 94, 14, 14, 14, 43, 56, 38, 92, 79, 5],5).
f([18, 12, 28, 70, 48, 61, 8, 36, 11, 63, 95, 80, 85, 64, 89, 10, 54, 57, 92, 20, 42, 66, 61, 79, 4, 30, 19, 62, 35, 25, 65, 25, 97, 101, 4, 23, 58, 94, 27, 20, 13, 39, 46, 44, 9, 53, 61, 91],91).
f([5, 9, 57, 99, 101, 44, 72, 19, 93, 36, 97, 8, 88, 21, 69, 50, 24, 72, 65, 54, 16, 10, 50, 5, 6, 47, 91, 66, 72],72).
f([90, 64, 44, 75, 1, 86, 9, 8, 55, 87, 49, 15, 64, 40, 57],57).
f([58, 11, 47, 87, 13, 24],24).
f([94, 24, 77, 28, 86, 16, 12, 41, 71, 40, 75, 57, 29, 87, 76, 41, 25, 17, 29, 33, 89, 32, 60, 87, 63, 92, 5],5).
f([6, 72, 14, 71, 38, 69, 39, 83, 63, 55, 39, 66, 74, 42, 75, 79, 49, 86, 20, 45, 70, 65, 52, 42, 23, 10, 43, 31, 82, 55, 26, 12, 31, 81, 39, 36, 56, 100],100).
f([96, 31, 95, 91, 56, 11, 99, 95, 1, 19, 49, 99, 64, 58, 40, 26, 70, 95, 80, 73, 91, 41, 28, 59, 60, 29, 93, 86, 96, 49, 61, 100, 98, 14, 83, 63, 81, 96, 39, 38, 6, 13, 87, 7, 82, 41, 47, 26, 17, 2],2).
f([63, 33, 13, 40, 25, 6, 93, 57, 100, 70, 20, 98, 64, 94, 19, 75, 41, 10, 98, 74, 32, 64, 8, 41, 41, 52, 31],31).
:-end_in_pos.
:-begin_in_neg.
f([83, 75, 40, 32, 64, 25, 78, 41, 54, 87, 43, 43, 43, 7, 16, 66, 42, 56],16).
f([78, 81, 34, 24, 12, 57, 63, 80, 2, 86, 8, 2, 37, 75, 68, 55, 68, 45, 58, 96, 41, 37, 64, 21, 51, 35, 39, 24, 81, 79, 56, 25, 92, 1, 19, 47, 2, 63, 72, 84, 6, 26, 43, 13, 26],45).
f([47, 90, 11, 80, 13, 38, 36, 47, 47, 4, 7, 94, 83, 37, 17, 89, 82, 1, 9, 10, 93, 45, 58, 27, 44, 48, 98, 13, 13, 97, 41, 85, 15, 70],9).
f([20, 37, 69, 84, 50],37).
f([26, 39, 7, 81, 71, 55, 96, 64, 75, 16, 32, 47, 72, 82, 42, 70, 94, 92, 95, 7, 58, 48, 51],47).
f([53, 95, 70, 8, 92, 61, 53, 57, 9, 76],70).
f([6, 60, 62, 66, 67, 65, 62, 26, 73, 67, 42, 18, 101, 5, 34, 6, 88, 13, 26, 87, 84, 83, 48, 28, 92, 43, 21, 12, 30, 50, 31, 20],21).
f([94, 49, 70, 96, 20, 51, 13, 35, 27, 91, 23, 72, 42, 99, 66],72).
f([16, 71, 46, 66, 18, 64, 84, 42, 40, 101, 3, 13, 88, 31, 91, 34],66).
f([17, 83, 4, 82, 38, 61, 80, 94, 19, 73, 90, 62, 42, 33, 11],80).
:-end_in_neg.
