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
:- modeh(*,f(+list)).
:- modeb(*,f(+list)).
%% :- modeb(*,cons(+element,+list,-list)).

:- determination(f/1,head/2).
:- determination(f/1,tail/2).
:- determination(f/1,geq/2).
:- determination(f/1,empty/1).
:- determination(f/1,even/1).
:- determination(f/1,odd/1).
:- determination(f/1,one/1).
:- determination(f/1,zero/1).
:- determination(f/1,decrement/2).
:- determination(f/1,f/1).
%% :- determination(f/1,increment/2).
%% :- determination(f/1,element/2).
%% :- determination(f/1,cons/3).
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
f([36, 72, 52, 42, 40, 74, 46, 94, 36, 34, 8, 60, 32, 84, 6, 66, 52, 34, 26, 40, 96, 60, 78, 56, 94, 56, 98, 48, 34, 62, 38, 12, 70, 70, 40, 48, 32, 76, 74, 38, 24, 60, 100, 44, 98, 18, 66, 66, 8]).
f([88, 76, 34, 36, 64, 32, 66, 36, 18, 22, 64, 10, 70, 28, 64, 12, 28, 58, 18, 66, 10, 22, 38, 32, 72, 90, 18, 100, 54, 92, 30, 46, 10, 34, 76, 70, 78, 16, 20, 52, 20, 18, 4, 56, 72, 94]).
f([88, 90, 98, 68, 48, 40, 92, 12, 16, 66, 94, 12, 2, 22, 24, 42, 2, 4, 72, 96, 26, 52, 68, 68, 8, 36, 62, 52, 96, 2, 10, 56, 34, 12, 86, 18, 96, 44, 22, 14, 34, 16, 84, 100]).
f([80, 42, 48, 48, 38, 28, 56, 96, 74, 96, 48, 32, 32, 94, 28, 64, 64, 96, 18, 76, 24, 90, 50, 100, 52, 66, 84, 16, 52, 68, 78, 26, 44, 96, 80, 76, 8, 44, 92]).
f([78, 52, 16, 60, 2, 44, 8, 44, 40, 92, 42, 98, 56, 24, 22, 32, 76, 74, 58, 96, 4, 70, 36, 52, 92, 50, 70, 46, 76, 12, 56, 10]).
f([60, 46, 36, 76, 34, 4, 32, 2, 78, 54, 12, 14, 18, 4, 66, 34, 30, 8, 54, 98, 54, 82, 50, 6, 20, 100, 68, 96, 30, 74, 4, 46, 38, 16, 60, 14, 60, 36]).
f([18, 70, 88, 30, 98, 74]).
f([36, 12, 74, 64, 44, 10, 98, 50, 98, 88, 10, 24, 28, 86, 50, 12, 30, 40, 52, 42, 22]).
f([68, 60, 44, 6]).
f([34, 64, 84, 8, 14, 66, 94, 94, 66, 12, 26, 4, 74, 56, 42, 26, 56, 72, 62, 68, 82, 34, 100, 30, 82, 46, 80, 54, 38, 34, 66, 88, 58, 78]).
:-end_in_pos.
:-begin_in_neg.
f([74, 24, 20, 78, 84, 32, 24, 100, 28, 48, 10, 54, 58, 88, 48, 74, 14, 14, 28, 13]).
f([23, 26, 54, 59, 12, 51, 96, 95, 81, 29, 18, 23, 72, 91, 64, 91, 43, 15, 86, 65, 7, 39, 22, 34, 27, 99, 15, 5, 73, 81, 71, 27, 35, 93, 57, 56, 12, 80, 92, 75]).
f([82, 86, 80, 84, 46, 12, 82, 88, 58, 46, 54, 62, 80, 2, 48, 80, 74, 84, 30, 34, 8, 82, 10, 89, 54, 50, 22, 80, 16, 10, 46, 87, 42, 70, 90, 67, 80, 44, 12, 46, 12]).
f([42, 98, 40, 53, 100, 2, 8, 44, 56, 39, 88, 33, 9, 42, 8, 48, 26, 27, 68, 86, 36, 98, 67, 79, 46]).
f([100, 90, 36, 37, 22, 33, 43, 54, 94, 46, 69, 50, 98, 72, 22, 39, 84, 94, 94, 97, 47, 81, 25, 18, 52, 25, 7, 60, 65, 83, 26, 63, 35, 8, 49, 42, 19, 10, 90, 27, 84, 55, 26, 11]).
f([27, 92, 50, 25, 9, 86, 70, 94, 14, 76, 9, 58, 22, 86, 24, 8, 61, 72, 73]).
f([96, 59, 31, 32, 56, 2, 79, 80, 60]).
f([35, 80, 18, 5, 2, 21, 24, 32, 17, 27, 37, 42, 83]).
f([2, 16, 84, 18, 76, 96, 64, 66, 12, 64, 19, 63, 46, 38, 10, 5, 82, 64, 44, 42, 54, 8, 82, 30, 20, 91, 14, 80, 52, 43, 62, 39, 12, 20, 30, 28, 80, 6, 18, 89, 86]).
f([90, 75, 71, 19, 52, 72, 45, 21, 23]).
:-end_in_neg.
