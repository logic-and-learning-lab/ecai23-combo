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
f([84, 12, 4, 50, 66, 40, 20, 56, 48, 60, 68, 40, 16, 8, 68, 32, 92, 18, 56, 40, 82, 62, 96, 92, 62, 44, 100, 98, 94, 36, 24, 26, 58, 64, 76]).
f([78, 74, 92, 18, 36, 100, 98, 34, 8, 80, 14, 98, 14, 78, 56, 72, 100]).
f([50, 72, 94, 74, 8, 54, 98, 36, 60, 4, 2, 82, 6, 42, 28, 10, 90, 50, 86, 70, 38, 84, 84, 26, 60, 50, 90, 60, 2, 30, 88, 58, 32, 92, 94, 100, 78, 56, 74]).
f([8, 78, 38, 46, 64, 14, 12, 28, 96, 76, 46, 70, 42, 60, 90, 20, 36, 24, 88, 30, 86, 98, 68, 88, 20, 70, 22, 66, 60, 18, 4, 68, 30, 80, 90]).
f([60, 8, 32, 18, 66, 70, 92, 86, 22, 76, 100, 74, 38]).
f([54, 36, 74, 16, 90, 32, 58, 22, 98, 54, 76, 60, 82, 96, 50, 56, 18, 92, 62, 32]).
f([54, 2, 70, 10, 78, 34, 68, 100, 82, 84, 42, 96, 56, 72, 22]).
f([98, 74, 46, 24, 22, 66, 56, 86, 58, 16, 16, 44, 78, 58, 68, 8, 100, 46, 98, 20, 4, 52, 76, 14, 92, 30, 68, 96, 38, 52, 100, 22, 22, 44, 98, 30, 64, 86, 96, 100, 94, 8, 82]).
f([12, 92, 50, 94, 38, 46, 46, 58, 4, 34, 60, 76, 96, 18, 62, 82, 70, 60, 72, 38]).
f([76, 68, 80, 34, 4, 76, 38, 28, 58, 6, 16, 4, 14, 14, 78, 96, 92, 100, 22, 92, 14, 56, 70, 20, 98]).
:-end_in_pos.
:-begin_in_neg.
f([33, 48, 50, 44, 70, 42, 70, 14, 90, 88, 46, 94, 27, 8, 30, 49, 100, 54, 90, 56, 56, 52, 78, 36, 29, 74, 80, 14, 72, 57, 60, 56, 32, 72, 4, 21, 4, 72, 32, 16, 46, 94, 93, 29, 56, 82, 34]).
f([97, 24, 55, 33, 29, 43, 71, 12, 87, 15, 93, 65, 27, 75, 29, 89, 29, 49, 58, 47, 45, 5, 35, 89, 98, 27, 29, 29, 64, 35, 61, 51, 65, 24, 39, 9, 59]).
f([4, 58, 94, 85]).
f([19, 81, 6, 21, 1, 35, 4, 70, 47, 19, 91, 91, 21, 65, 49, 53, 1, 2, 52, 85, 15, 80]).
f([75, 83, 75, 4, 85, 49, 51, 1, 33, 27, 2, 23, 79, 17, 39, 19, 77, 55, 43, 67, 23, 93, 97, 93, 95, 51, 77, 33, 33, 5, 17, 21, 51, 49, 1, 2, 55, 7, 82, 94, 11]).
f([86, 19, 95, 3, 13, 65, 93, 65, 81, 63, 48, 33, 89, 91, 27, 81, 13, 67, 71, 23, 27, 39, 79, 98, 63, 9, 9, 7, 17, 63]).
f([74, 6, 52, 36, 40, 46, 87, 10, 24, 66, 32, 4, 50, 52, 82, 60]).
f([77, 46, 87, 46, 74, 41, 22, 6, 98, 20, 82, 64, 19, 94, 41, 28, 88, 1, 82, 8, 74, 30, 62, 12, 63, 38, 88, 28, 16, 36, 38, 90, 13, 62, 27, 90, 72, 72]).
f([43, 36, 62, 32, 58, 86, 6, 59, 88, 14, 40, 58, 54, 4, 12, 24, 30, 40, 42, 42, 94, 10, 96, 38, 18, 20, 90, 80, 58, 18, 14, 16, 12, 42, 36, 28, 98, 96, 52]).
f([12, 8, 25, 30, 56, 29, 43, 4, 45, 24]).
:-end_in_neg.
