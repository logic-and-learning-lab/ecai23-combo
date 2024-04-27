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
:- modeh(*,f(+list,-list)).
:- modeb(*,f(+list,-list)).
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
%% :- determination(f/2,increment/2).
%% :- determination(f/2,element/2).
:- determination(f/2,cons/3).
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
f([45, 76, 89, 21, 85, 90, 64, 28, 10, 68, 23, 20, 12, 83, 72, 98, 33, 81, 72, 59, 60, 95, 22, 9, 10, 48, 52, 6, 75, 21, 78, 40, 34],[45, 76, 89, 21, 85, 90, 64, 28, 10, 68, 23, 20, 12, 83, 72, 98, 33, 81, 72, 59, 60, 95, 22, 9, 10, 48, 52, 6, 75, 21, 78, 40]).
f([89, 62, 61, 89, 88, 19, 34, 44, 95, 5, 31, 64, 89, 63, 98, 76, 99, 55, 98, 31, 12, 35, 1, 39, 48, 40, 13, 55, 87, 35, 47, 18, 25, 88, 4, 55, 51, 74, 4, 56, 87, 41, 51, 74, 37],[89, 62, 61, 89, 88, 19, 34, 44, 95, 5, 31, 64, 89, 63, 98, 76, 99, 55, 98, 31, 12, 35, 1, 39, 48, 40, 13, 55, 87, 35, 47, 18, 25, 88, 4, 55, 51, 74, 4, 56, 87, 41, 51, 74]).
f([83, 64, 83, 32, 100, 20, 20, 60, 1, 43, 27, 81, 59, 87],[83, 64, 83, 32, 100, 20, 20, 60, 1, 43, 27, 81, 59]).
f([98, 27, 85, 42, 42, 58, 65, 90, 98, 22, 80, 10, 7, 13, 70, 15, 56, 49, 50, 33, 38, 35, 65, 20, 86, 66, 64, 83, 91, 25, 24, 10, 97, 46, 3, 42, 88, 64, 43, 86, 82, 56, 24, 36],[98, 27, 85, 42, 42, 58, 65, 90, 98, 22, 80, 10, 7, 13, 70, 15, 56, 49, 50, 33, 38, 35, 65, 20, 86, 66, 64, 83, 91, 25, 24, 10, 97, 46, 3, 42, 88, 64, 43, 86, 82, 56, 24]).
f([45, 48, 46, 8, 22, 81, 55, 81, 93, 39, 53, 69, 51, 61, 40, 56, 59, 73, 43, 100, 1, 62, 51, 67, 25, 48, 59, 38, 3, 86, 69, 83, 11, 75, 87, 7, 23, 36, 65, 60, 31, 69, 73, 86, 17, 49],[45, 48, 46, 8, 22, 81, 55, 81, 93, 39, 53, 69, 51, 61, 40, 56, 59, 73, 43, 100, 1, 62, 51, 67, 25, 48, 59, 38, 3, 86, 69, 83, 11, 75, 87, 7, 23, 36, 65, 60, 31, 69, 73, 86, 17]).
f([74, 94, 28, 19, 2, 89, 1, 51, 7, 26, 40, 95, 69, 9, 87, 45, 39, 42, 63, 4, 29, 87, 55, 18, 22, 73, 90, 3],[74, 94, 28, 19, 2, 89, 1, 51, 7, 26, 40, 95, 69, 9, 87, 45, 39, 42, 63, 4, 29, 87, 55, 18, 22, 73, 90]).
f([69, 76, 71, 9, 90, 26, 3, 63, 89, 39, 3, 44, 10, 10, 89, 75, 78, 69, 28, 52, 25, 11, 46, 80, 89, 41, 72, 71, 42, 69, 60, 74, 69, 39, 63, 78, 52, 15, 75, 68, 54, 77, 44, 98, 90, 56, 22],[69, 76, 71, 9, 90, 26, 3, 63, 89, 39, 3, 44, 10, 10, 89, 75, 78, 69, 28, 52, 25, 11, 46, 80, 89, 41, 72, 71, 42, 69, 60, 74, 69, 39, 63, 78, 52, 15, 75, 68, 54, 77, 44, 98, 90, 56]).
f([28, 9, 86, 13, 98, 27, 64, 66, 61, 100, 47, 81, 45, 79, 94, 5, 42, 12, 28, 50, 69, 5, 90, 67, 89, 82, 12, 47, 53, 28, 26, 57, 50, 51, 21, 12, 90, 63, 2, 4, 47, 48, 48, 34, 53],[28, 9, 86, 13, 98, 27, 64, 66, 61, 100, 47, 81, 45, 79, 94, 5, 42, 12, 28, 50, 69, 5, 90, 67, 89, 82, 12, 47, 53, 28, 26, 57, 50, 51, 21, 12, 90, 63, 2, 4, 47, 48, 48, 34]).
f([24, 82, 7],[24, 82]).
f([33, 30, 35, 85, 4, 15, 38, 52, 4, 82, 97, 55, 15, 92, 84, 77, 30, 92, 81, 4, 17, 22, 21],[33, 30, 35, 85, 4, 15, 38, 52, 4, 82, 97, 55, 15, 92, 84, 77, 30, 92, 81, 4, 17, 22]).
:-end_in_pos.
:-begin_in_neg.
f([77, 33, 90, 66, 57, 28, 97, 20, 80, 77, 75, 57, 29, 3, 94, 16, 61, 28, 5, 53, 39, 60, 60, 72, 8, 57, 76, 91, 94, 98, 30, 10, 82, 15, 22, 81, 57, 84, 39],[77, 33, 90, 66, 57, 28, 97, 20, 80, 77, 75, 57, 29, 3, 94, 16, 61, 28, 5, 53, 39, 60, 60, 72, 8, 57, 76, 91, 94, 98, 30, 10, 82, 15, 22, 81, 57, 84, 39]).
f([93, 60, 50, 48, 89, 59, 7, 5, 89, 2, 31, 88, 56, 14, 25, 67, 2, 34, 71, 74, 14, 78, 73, 62, 24, 45, 3, 18, 54, 68, 35, 66, 17, 86, 54, 9],[93, 60, 50, 48, 89, 59, 7, 5, 89, 2, 31, 88, 56, 14, 25, 67, 2, 34, 71, 74, 14, 78, 73, 62, 24, 45, 3, 18, 54, 68, 35, 66, 17, 86, 54, 9]).
f([62, 17, 54, 48, 25, 44, 4, 22, 34, 85, 97, 21, 78, 6, 69, 66, 36, 9, 63, 75, 11, 62, 26, 88, 92, 4, 67, 1, 27, 73, 101, 52, 73, 27, 31, 47, 39, 75, 32, 50, 21, 37, 81, 43],[62, 17, 54, 48, 25, 44, 4, 22, 34, 85, 97, 21, 78, 6, 69, 66, 36, 9, 63, 75, 11, 62, 26, 88, 92, 4, 67, 1, 27, 73, 101, 52, 73, 27, 31, 47, 39, 75, 32, 50, 21, 37, 81, 43]).
f([54, 85, 24, 17, 10, 54, 84, 42, 78, 42, 39, 82, 80, 67, 28, 90, 73, 54, 17, 51, 84, 13, 45, 45, 8, 42, 24, 34, 63, 71, 96, 90, 44, 28, 9, 31, 86, 3, 63, 81, 26, 98, 99, 5],[54, 85, 24, 17, 10, 54, 84, 42, 78, 42, 39, 82, 80, 67, 28, 90, 73, 54, 17, 51, 84, 13, 45, 45, 8, 42, 24, 34, 63, 71, 96, 90, 44, 28, 9, 31, 86, 3, 63, 81, 26, 98, 99, 5]).
f([100, 38, 18, 59, 62, 2, 17, 22, 11, 4, 60, 5, 13, 73, 3, 71, 6, 53, 36, 3, 56, 32, 68, 96, 74, 73],[100, 38, 18, 59, 62, 2, 17, 22, 11, 4, 60, 5, 13, 73, 3, 71, 6, 53, 36, 3, 56, 32, 68, 96, 74, 73]).
f([87, 21, 88],[87, 21, 88]).
f([27, 60],[27, 60]).
f([74, 9, 40, 8, 89, 29, 4, 2, 51, 72, 19, 73, 44, 36, 47, 90, 29, 75, 2, 49, 79, 54, 46, 14, 25, 56, 13, 47, 57, 88, 51, 89, 32, 100, 53, 52, 82, 15, 37, 27],[74, 9, 40, 8, 89, 29, 4, 2, 51, 72, 19, 73, 44, 36, 47, 90, 29, 75, 2, 49, 79, 54, 46, 14, 25, 56, 13, 47, 57, 88, 51, 89, 32, 100, 53, 52, 82, 15, 37, 27]).
f([52, 38, 57, 27, 83, 34, 58, 59, 70, 97, 14, 23, 9, 57, 101, 50, 66, 46, 55, 7, 21, 50, 35, 86, 29, 33, 86, 14, 39, 38, 92, 17, 68, 64, 76, 37, 43, 65, 88, 22, 58, 88, 67, 20, 37, 11, 48, 85],[52, 38, 57, 27, 83, 34, 58, 59, 70, 97, 14, 23, 9, 57, 101, 50, 66, 46, 55, 7, 21, 50, 35, 86, 29, 33, 86, 14, 39, 38, 92, 17, 68, 64, 76, 37, 43, 65, 88, 22, 58, 88, 67, 20, 37, 11, 48, 85]).
f([85, 8, 17, 3, 44, 94, 64, 77, 29, 57, 65, 24, 95, 48, 64, 99, 71, 71, 53, 92, 50, 35, 59, 88, 38, 66, 14, 28, 83, 82, 81, 101, 92, 50, 13, 70, 45, 50, 13, 62, 49, 1, 92, 93, 12],[85, 8, 17, 3, 44, 94, 64, 77, 29, 57, 65, 24, 95, 48, 64, 99, 71, 71, 53, 92, 50, 35, 59, 88, 38, 66, 14, 28, 83, 82, 81, 101, 92, 50, 13, 70, 45, 50, 13, 62, 49, 1, 92, 93, 12]).
:-end_in_neg.