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
:- determination(f/2,element/2).
:- determination(f/2,increment/2).
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
f([6, 32, 17, 41],4).
f([21, 24, 31, 1, 72, 100, 83, 19, 59, 38, 62, 8, 33, 28, 55, 49, 99, 70, 38, 56, 50, 62, 28, 39, 25, 31, 52, 26, 89, 33, 8, 15, 62, 68],34).
f([72],1).
f([33, 75, 99, 38],4).
f([94, 46, 7, 14, 32, 83, 88, 90, 60],9).
f([83, 97, 29],3).
f([24, 36, 83, 33, 43, 39],6).
f([75, 34, 52, 11, 5, 60, 77, 56, 91, 67, 90],11).
f([49, 60, 95, 80, 91, 41, 31, 34, 59, 51, 35, 4, 60, 75, 22, 37, 13, 43, 22, 78, 82, 18, 52, 92],24).
f([81, 101, 50, 77, 68, 45, 32, 41, 100, 34, 27, 78, 18, 67, 40, 76, 71, 88, 6, 70, 18, 78, 97, 66, 81, 96, 37, 68, 27, 28, 43],31).
:-end_in_pos.
:-begin_in_neg.
f([52, 79, 11, 17, 95, 87, 100, 78, 6, 76, 62, 68, 16, 67, 91, 11, 51, 48, 68, 76, 51, 45, 75, 9, 45, 101, 48, 91, 27, 9, 97, 96, 9],100).
f([57, 88, 72, 66],72).
f([19, 49, 59, 92, 101, 52, 57, 7, 69, 63, 38, 46, 56, 60, 23, 7, 75, 100, 96, 82, 37, 75, 87, 93, 96, 67, 46, 91, 16, 49, 76, 12, 86, 90, 40, 49, 52, 75, 38, 55, 5, 87, 34, 54, 52, 97, 47, 68, 56],80).
f([59, 21, 87, 26, 36, 83, 56, 28, 55, 38, 8, 51, 60, 34, 17, 13, 8, 59, 100, 65, 70, 93, 14, 16, 80, 21],87).
f([31, 35, 4, 29, 10, 67, 85, 83, 1, 69, 4, 83, 13, 85, 94, 7, 57, 7, 67, 63, 16, 21, 65, 59, 23],45).
f([2, 90, 90, 17, 24, 72, 13, 101, 29, 18, 19, 88, 68, 56, 13, 17, 54, 101, 34, 68, 92, 19, 49],82).
f([44, 9, 55],94).
f([75, 77, 43, 62, 41, 64, 99, 31, 23, 25, 32, 87, 28, 72, 96, 30, 76, 33, 41, 17, 55, 2, 61, 27, 7, 99, 19, 81, 94, 44, 31, 64, 10, 85, 8, 63, 38, 2, 27, 66, 39, 4, 36, 63, 94],28).
f([51, 17, 8, 48, 23, 86, 96, 47, 57, 59, 20, 43, 64, 41, 34, 101, 72, 59, 59, 101, 3, 26, 7, 45, 52, 96, 99, 63, 15, 69, 61, 29],47).
f([74, 27, 80, 5, 74, 58, 42, 67, 94, 15, 28, 15, 2, 78, 65, 5, 47, 66, 31, 62, 76, 85, 22, 88, 57, 100, 38, 14, 30, 47],74).
:-end_in_neg.
