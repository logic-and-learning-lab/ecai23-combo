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
:- modeh(*,f(+list,+element,-list)).
:- modeb(*,f(+list,+element,-list)).

:- determination(f/3,head/2).
:- determination(f/3,tail/2).
:- determination(f/3,geq/2).
:- determination(f/3,empty/1).
:- determination(f/3,even/1).
:- determination(f/3,odd/1).
:- determination(f/3,one/1).
:- determination(f/3,zero/1).
:- determination(f/3,decrement/2).
:- determination(f/3,f/3).
%% :- determination(f/3,increment/2).
%% :- determination(f/3,element/2).
%% :- determination(f/3,cons/3).
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
f([6, 30, 87, 17, 93, 82, 16, 29, 71, 43, 56, 23, 29, 33, 100, 49, 11, 78, 60, 75, 91, 7, 30, 64, 62, 68, 20, 3, 42, 9, 42, 5, 26, 60, 51, 94, 77, 54, 73, 27, 92, 9, 26, 1, 41, 37, 41, 86, 71, 37],25,[68, 20, 3, 42, 9, 42, 5, 26, 60, 51, 94, 77, 54, 73, 27, 92, 9, 26, 1, 41, 37, 41, 86, 71, 37]).
f([49, 62, 46, 88, 16, 86, 92, 89, 9, 3, 32, 48, 90, 97, 99, 59, 64, 8, 87, 28, 91, 90, 39, 8, 26, 54, 19, 49, 46, 62, 18, 37, 7, 47, 94, 33, 9, 52, 12],34,[94, 33, 9, 52, 12]).
f([2, 88, 101, 11, 52, 84, 84, 89, 80, 80, 73, 25, 55, 27, 42, 15, 68, 35, 59, 9, 50, 67, 66, 37, 74, 9, 86, 54, 39, 24, 21, 11, 9, 73, 46, 36],28,[39, 24, 21, 11, 9, 73, 46, 36]).
f([14, 53, 75, 64, 85, 32, 60, 13, 9, 88, 82, 98, 77, 4, 65, 55, 50, 56, 7, 3, 68, 84, 81, 55, 92, 96, 80, 52, 25, 63, 59, 47, 24, 14, 55, 61, 13, 97, 21, 31, 66, 101],18,[7, 3, 68, 84, 81, 55, 92, 96, 80, 52, 25, 63, 59, 47, 24, 14, 55, 61, 13, 97, 21, 31, 66, 101]).
f([96, 18, 66, 50, 20, 15, 41, 7, 75, 26, 54, 22, 61, 87, 60, 40, 83, 85, 70, 3, 14, 28, 67, 92, 21],14,[60, 40, 83, 85, 70, 3, 14, 28, 67, 92, 21]).
f([7, 24, 45, 75, 64, 15, 9, 57, 85, 86, 44, 62, 53, 90, 53, 53, 101, 45, 50, 16, 62, 64, 87, 79, 81, 15, 14, 48, 74, 50, 12, 85, 76, 57],11,[62, 53, 90, 53, 53, 101, 45, 50, 16, 62, 64, 87, 79, 81, 15, 14, 48, 74, 50, 12, 85, 76, 57]).
f([77, 70, 29, 16, 42, 38, 79, 63, 4, 62, 38, 32, 28, 85, 41, 50, 61, 55, 86, 22, 66, 92, 84, 61, 67, 78, 77, 97, 34, 37, 83, 100, 80, 91, 51, 54, 66, 42, 23, 91, 64, 89, 59, 88],42,[59, 88]).
f([99, 61, 23, 22, 92, 2, 19, 99, 1, 17, 58, 14, 4, 2, 88, 3, 7, 62, 67, 54, 63, 74, 60, 59, 23, 85, 18, 92, 87, 29, 43, 64, 23, 78, 5, 76, 62, 21, 101],11,[14, 4, 2, 88, 3, 7, 62, 67, 54, 63, 74, 60, 59, 23, 85, 18, 92, 87, 29, 43, 64, 23, 78, 5, 76, 62, 21, 101]).
f([1, 78, 74, 89, 11, 9, 19, 54, 93, 26, 19, 54, 58, 50, 31, 66, 101, 34, 91, 96, 67, 19, 91, 38, 27, 27, 51, 37, 101, 55, 39, 17, 79, 63, 7, 44, 32, 54, 12, 41, 69, 93, 59, 17],4,[11, 9, 19, 54, 93, 26, 19, 54, 58, 50, 31, 66, 101, 34, 91, 96, 67, 19, 91, 38, 27, 27, 51, 37, 101, 55, 39, 17, 79, 63, 7, 44, 32, 54, 12, 41, 69, 93, 59, 17]).
f([94, 18, 6, 90, 71, 51, 76, 39, 3, 67, 80, 68, 3, 70, 68, 88, 75, 60, 41, 45, 82, 29, 100, 93, 36, 50, 87, 91, 67, 63, 88, 94, 72, 18, 5, 88, 80, 4, 25, 54, 81, 60, 79, 71, 72, 16, 95, 35, 33, 69, 17],50,[17]).
:-end_in_pos.
:-begin_in_neg.
f([94, 22, 80, 93, 100, 81, 21, 40, 67, 86, 23, 40, 63, 16, 78, 66, 80, 73, 83, 62, 36, 57, 8, 68, 41, 59, 57, 17, 34, 82, 101, 25, 14, 81, 6, 6, 15, 16, 74],15,[22, 80, 93, 100, 81, 21, 40, 67, 86, 23, 40, 63, 16, 78, 66, 80, 73, 83, 62, 36, 57, 8, 68, 41, 59, 57, 17, 34, 82, 101, 25, 14, 81, 6, 6, 15, 16, 74]).
f([97, 30, 69, 43, 8, 27, 41, 62, 79, 71, 55, 72, 70, 87, 31, 25, 63],6,[97, 30, 69, 43, 8, 27, 41, 62, 79, 71, 55, 72, 70, 87, 31, 25, 63]).
f([55, 60, 60, 22, 27, 46, 18, 86, 58],2,[55, 60, 60, 22, 27, 46, 18, 86, 58]).
f([12, 33, 47, 59, 60, 85, 21, 8, 85, 22, 38, 92, 62, 25, 80, 92, 35, 53, 51, 42, 66, 23, 74, 65, 90, 22, 80, 43, 1, 6, 81, 85, 2, 80, 27, 47, 41, 45, 82, 99, 79, 52, 86, 18, 83],27,[6, 81, 85, 2, 80, 27, 47, 41, 45, 82, 99, 79, 52, 86, 18, 83]).
f([12, 41, 42, 51, 20, 77, 9, 1, 10, 42, 25, 6, 100, 27, 38],11,[27, 38]).
f([42, 18, 74, 16, 15, 30, 16, 55, 92, 92, 34, 2, 41, 87, 92, 5, 5, 15, 16, 45, 64, 100, 12, 3, 86, 3, 2, 13, 27, 67, 40, 44, 23, 5, 15, 58, 56, 55],14,[100, 12, 3, 86, 3, 2, 13, 27, 67, 40, 44, 23, 5, 15, 58, 56, 55]).
f([40, 38, 2, 70, 52, 50, 40, 62, 62, 49, 96, 43, 46, 75, 14, 71, 52, 65, 86, 20, 3, 25, 90, 57, 89, 67, 11, 47, 48, 14, 46, 28, 8, 27, 77, 15, 54, 29, 8, 39, 77, 25, 80, 27, 84, 53, 53, 30, 15],18,[77, 15, 54, 29, 8, 39, 77, 25, 80, 27, 84, 53, 53, 30, 15]).
f([20, 93],1,[20, 93]).
f([92, 13, 32, 88, 8, 53, 101, 78, 18, 69, 75, 46, 46, 85, 4],7,[75, 46, 46, 85, 4]).
f([35, 72, 14, 58, 60],3,[72, 14, 58, 60]).
:-end_in_neg.