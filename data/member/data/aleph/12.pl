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
f([41, 100, 33],100).
f([18, 2, 92, 22, 53, 28, 26, 20, 68, 29, 42, 13, 21, 19, 64, 53, 87, 34, 45, 59, 32, 14, 69, 31, 10, 63, 48, 10, 8, 79, 51, 49, 35, 99, 75, 20, 17],34).
f([42, 56, 66, 31, 65, 58, 5, 51, 46, 23, 54, 86, 30, 58, 48, 2, 5, 54, 19, 42, 44, 64, 15, 81, 88, 64, 30, 63, 3, 45, 67, 12, 87, 10, 24, 36, 95, 24, 94],19).
f([77, 37, 16, 67, 38, 10, 4, 61],38).
f([20, 7, 71, 37, 85, 78, 14, 63, 52, 48, 47, 101, 14, 89, 19, 55, 7, 38, 90, 35, 76, 46, 89, 72, 15, 37, 28, 10, 34, 26, 75, 26, 98, 57, 75, 7],75).
f([100, 35, 8, 2, 32, 28, 50, 58, 12, 38, 30, 5, 69, 58, 86, 19, 60, 30, 91, 48, 24, 61, 94, 41, 93, 70, 15, 73, 47, 3, 67, 39, 10, 99, 75, 6, 35, 82],82).
f([4, 26, 29, 63, 59, 12, 86, 84, 26, 95, 5, 68, 81, 67, 66, 33, 38, 86, 97, 57, 63, 36, 53, 23, 80],26).
f([47, 79, 83, 51, 95, 70, 38, 21, 43, 83, 4, 91, 46, 6, 6, 12, 44, 70, 25, 44, 39, 101, 81, 13, 7, 13, 92, 52, 5, 24, 63, 22, 16, 65, 73, 29, 45, 83, 3, 84, 100, 29, 65, 14, 26, 12, 37, 100, 25, 14],47).
f([58, 21, 44, 81],58).
f([5, 21, 75, 41, 92, 67, 86, 93, 31, 34, 82, 6, 100, 60],93).
:-end_in_pos.
:-begin_in_neg.
f([10, 65, 38, 100, 28, 94, 15, 23, 27, 36, 54, 41, 49, 65, 88, 35, 21, 46, 5, 90, 13, 17, 48, 47, 84, 21, 30, 30, 100, 86, 26, 57, 61, 14, 55, 7, 26, 67],33).
f([3, 19, 46, 73, 15, 74, 94, 14, 59, 28, 39, 12, 40, 83, 62, 9, 95, 68, 1, 45, 30, 43, 96, 67, 53, 23, 71, 54, 20, 43, 56, 43, 93, 9, 21, 59, 29, 42, 29, 19, 89, 89, 48, 16, 68, 12, 92, 26, 79, 11],82).
f([18, 34, 60, 53, 37, 27, 89, 93, 101, 71, 26, 78, 2, 4, 58, 93, 99, 7, 24, 59, 100, 62, 56, 94, 33, 95, 47, 84, 37, 99, 58, 67, 3, 42, 68, 90, 101, 49, 83, 60, 73, 67, 63],11).
f([3, 80, 87, 15, 17, 85, 26, 26],41).
f([58, 58, 61, 66, 37, 16, 20, 30, 75, 37],6).
f([54, 82, 92, 72, 55, 84, 80, 80, 33, 58, 54, 20, 25, 37, 99, 56, 20, 62, 70, 7, 32, 48, 47, 69, 79, 14, 44, 16, 58, 78, 85, 61, 55, 38, 1, 24, 61, 73, 57, 66],22).
f([11, 97, 6, 77, 60, 40, 86, 95, 6, 83, 98, 16, 77, 98],30).
f([15, 76, 76, 83, 24, 38, 42, 20, 19],7).
f([56, 50, 66, 13, 26, 48, 42, 30, 26, 77, 38, 31],89).
f([51, 90, 56, 57, 28, 27, 56, 38, 26, 84, 5, 24, 55, 56, 101],10).
:-end_in_neg.
