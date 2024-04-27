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
f([37, 7, 2, 48, 75, 69, 31, 70, 19, 66, 79],11).
f([25, 69, 92, 59, 31, 64, 68, 57, 37, 49, 67, 1, 97, 55, 99, 60, 22, 32, 101, 46],20).
f([86, 9, 68, 42, 84, 71, 14, 96, 38, 100, 3, 54, 78, 27, 99, 96, 93, 7, 85, 43, 95, 8, 72, 50, 40, 36, 21, 37, 57, 68, 69, 76, 57, 35, 31, 27, 16, 46, 57, 60, 55, 94, 83, 82, 34, 21, 67, 82, 47],49).
f([33, 85, 96, 28, 94, 56, 73, 94, 87, 76, 99, 74, 90, 12, 45, 95, 34, 83, 58, 66, 58, 69, 6, 5, 19, 49, 36, 93, 17, 68, 57, 20, 69, 97, 85, 101, 48, 44, 84, 84, 35, 53, 70, 71, 45, 57, 48, 42, 6, 24],50).
f([30, 82, 32, 22, 76, 8, 88, 52, 18, 96, 78, 38, 12, 53, 20, 9, 37, 93, 45, 100, 96, 69],22).
f([7, 76, 6, 101, 65, 96, 27, 52, 62, 85, 100, 1, 20, 62, 31, 65, 94, 34, 51, 8, 93, 61, 98, 88],24).
f([59, 76, 83, 68, 59, 54, 96, 32],8).
f([73, 76, 34, 60, 25, 97, 57, 44, 21, 19, 1, 74, 40, 20, 53, 62, 63, 33, 20, 12, 58, 27, 100, 88, 64, 55, 93, 44, 54, 33, 40, 52, 11, 26],34).
f([20, 32, 66, 75, 36, 57, 10, 30, 13, 94, 2, 16, 40, 79, 101, 68, 70, 63, 37, 80],20).
f([33, 75, 32, 74, 33, 58, 16, 20, 48, 19, 90, 36, 55, 80, 53, 51, 5, 12, 95, 38, 48, 98, 27, 92, 30, 53, 57, 85, 101, 36, 48, 101, 40, 60, 60, 65, 60, 55, 60, 11, 30, 31, 11, 20, 80, 74, 70, 18],48).
:-end_in_pos.
:-begin_in_neg.
f([23, 84, 99, 35, 28, 51, 64, 43, 28, 89, 3, 18, 55, 91, 4, 62, 58, 26, 96, 57, 60, 37, 4, 47, 19, 41, 6, 28, 65, 68, 76, 74, 70, 5, 42, 20, 23, 8],83).
f([85, 28, 41, 66, 74, 47, 9, 47, 72, 56, 92, 27, 58, 4, 82, 40, 42, 8, 12, 97, 26, 40, 13, 44, 26, 96, 46, 22, 31, 38],81).
f([96, 50, 55, 94, 101, 87, 44, 43, 26, 52, 88, 2, 42, 23, 86],81).
f([85, 1, 5, 67, 90, 7, 30, 44, 65, 59, 84, 34, 21, 69, 10, 49, 17, 5, 13, 75, 52, 28, 96, 55, 45, 71, 99, 101, 1, 45, 69, 84, 34, 53, 82],28).
f([34, 6, 55, 76, 49, 56, 88, 28, 34, 86, 61, 46, 67, 12, 100, 70],14).
f([55, 70, 70, 27, 22, 18],55).
f([36, 20, 12, 31, 7, 2, 41, 76, 63, 77, 98, 52, 17, 60, 38, 77, 27, 101, 63, 45, 68, 59, 33, 65, 20, 62, 74, 6],65).
f([80, 79, 46, 98, 100, 95, 51, 44, 28, 67, 46, 83, 81, 85, 26, 76, 73, 24, 50, 40, 93, 65, 41, 29, 89, 7, 35, 81, 55, 10, 83, 27, 65, 1, 3],45).
f([7, 93, 35, 24, 45, 75, 65, 100, 37, 31, 12, 65, 77, 43, 38, 23, 16, 75, 78, 68, 97, 26, 25, 96, 19, 18, 99, 67, 92, 71, 71, 55],86).
f([5, 86, 36, 56, 99, 7, 19, 65, 54, 101, 39, 56, 26, 80],17).
:-end_in_neg.
