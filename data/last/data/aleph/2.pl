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
f([41, 100, 95, 75, 19, 74, 78, 62, 29, 87, 75, 31, 84, 13, 9, 90, 92, 88, 58, 76, 2, 88, 83, 88, 66, 60, 77, 39, 63, 34],34).
f([87, 61, 55, 46, 61, 61, 5, 30, 40, 4, 73, 46, 13, 2, 27, 63, 97, 1, 89, 81, 35, 74, 78, 80, 92, 66, 9, 63, 43, 39, 45, 75, 82, 65, 3],3).
f([10, 32, 26, 21],21).
f([52, 54, 30, 88, 22, 21, 35, 75, 83, 95, 4, 3, 17, 62, 25, 21, 30, 19, 98, 1, 67, 41, 44, 46, 68, 58, 11, 26, 44, 64, 49, 97, 92, 88, 23, 85, 1, 65, 89, 80, 18, 49, 9],9).
f([81, 21, 101, 28, 87, 96, 11, 67, 33, 13, 81, 13, 5, 52, 13, 76, 52, 6, 41, 88, 43, 59, 85, 64, 26, 22, 18, 34, 39, 4, 63, 38, 56, 79, 77, 11, 70],70).
f([68, 89, 33, 79, 35, 8, 25, 66, 90, 5, 100, 52, 55, 9, 31, 44, 66, 21],21).
f([10, 70, 22, 85, 40, 55, 19, 45, 77, 36, 45],45).
f([62, 15, 94, 56, 6, 24, 56, 17, 83, 1, 6, 79, 30, 54, 88, 23, 37, 89, 39, 68, 46, 28, 78, 16, 56, 54, 40, 60, 69, 10, 16, 80, 29, 63, 35, 89, 12, 29, 99, 70, 86, 1, 29],29).
f([4, 30, 11, 29, 1, 47, 82, 31],31).
f([48, 76, 67, 49, 49, 46, 55, 48, 16, 25, 14, 81, 84, 36, 53, 36, 20, 85, 79, 55, 100, 98, 36, 37, 56, 69, 80, 8],8).
:-end_in_pos.
:-begin_in_neg.
f([73, 90, 74, 90, 11, 10, 25],90).
f([14, 44, 83, 4, 16],14).
f([89, 28, 77, 79, 28, 62, 88, 90, 78, 3, 86, 34],78).
f([6, 25, 17],25).
f([61, 81, 18, 94, 35, 68, 21, 53, 72, 83, 54, 101, 73, 47, 27, 85, 86, 74, 84, 80, 92, 89, 75, 52, 45, 97, 96, 64, 59, 51],27).
f([21, 15, 32, 89, 70, 53, 12, 75, 74, 47, 1, 43],12).
f([94, 80, 20, 71, 53, 68, 25, 78, 37, 50, 67, 97, 3, 100, 81, 68, 12, 66, 69, 36, 11, 9, 3, 80, 5, 82, 98, 68, 81, 64, 69, 21, 65, 82, 85, 21, 17],81).
f([88, 97, 87, 95, 45, 71, 28, 73, 8, 27, 34],71).
f([17, 59, 65, 96, 12, 8, 23, 35, 37, 71, 91, 48, 98, 38, 7, 53, 18, 8, 27, 80, 58, 18, 40, 26, 75, 23, 100, 21, 54, 15, 57, 21, 96, 16, 71, 17, 57, 10, 90, 87, 35, 45, 56, 59, 2, 81, 60, 36, 100, 49, 18],8).
f([54, 76, 12, 6, 74, 47, 79, 43, 12, 33, 76, 33, 50, 58, 21, 1, 73, 32, 61, 30, 71, 58, 17, 41, 84, 60, 48, 10, 94, 26],1).
:-end_in_neg.
