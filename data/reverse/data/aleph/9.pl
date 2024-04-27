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
:- modeb(*,my_append(+list,+element,-list)).
:- modeb(*,empty_out(-list)).

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
:- determination(f/2,empty_out/1).
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

my_append(A,B,C):-
    append(A,[B],C).





c_0(0).
c_1(1).
c_2(2).
c_3(3).
c_4(4).
c_5(5).
c_6(6).
c_7(7).
c_8(8).
c_9(9).
c_10(10).
c_11(11).
c_12(12).
c_13(13).
c_14(14).
c_15(15).
c_16(16).
c_17(17).
c_18(18).
c_19(19).
c_20(20).
c_21(21).
c_22(22).
c_23(23).
c_24(24).
c_25(25).
c_26(26).
c_27(27).
c_28(28).
c_29(29).
c_30(30).
c_31(31).
c_32(32).
c_33(33).
c_34(34).
c_35(35).
c_36(36).
c_37(37).
c_38(38).
c_39(39).
c_40(40).
c_41(41).
c_42(42).
c_43(43).
c_44(44).
c_45(45).
c_46(46).
c_47(47).
c_48(48).
c_49(49).
c_50(50).
c_51(51).
c_52(52).
c_53(53).
c_54(54).
c_55(55).
c_56(56).
c_57(57).
c_58(58).
c_59(59).
c_60(60).
c_61(61).
c_62(62).
c_63(63).
c_64(64).
c_65(65).
c_66(66).
c_67(67).
c_68(68).
c_69(69).
c_70(70).
c_71(71).
c_72(72).
c_73(73).
c_74(74).
c_75(75).
c_76(76).
c_77(77).
c_78(78).
c_79(79).
c_80(80).
c_81(81).
c_82(82).
c_83(83).
c_84(84).
c_85(85).
c_86(86).
c_87(87).
c_88(88).
c_89(89).
c_90(90).
c_91(91).
c_92(92).
c_93(93).
c_94(94).
c_95(95).
c_96(96).
c_97(97).
c_98(98).
c_99(99).
c_100(100).
:-end_bg.
:-begin_in_pos.
f([98, 85, 76, 28, 10, 27, 60, 48, 31, 79, 55, 36, 5, 77, 53, 34, 17, 92, 21, 63, 34, 15, 3, 76, 6, 35, 96, 36, 79, 90, 27, 99, 13, 44, 55, 10, 95, 11, 50, 15, 94, 57, 26, 17, 50, 48],[48, 50, 17, 26, 57, 94, 15, 50, 11, 95, 10, 55, 44, 13, 99, 27, 90, 79, 36, 96, 35, 6, 76, 3, 15, 34, 63, 21, 92, 17, 34, 53, 77, 5, 36, 55, 79, 31, 48, 60, 27, 10, 28, 76, 85, 98]).
f([34, 27, 56, 8, 68, 61, 78, 62, 52, 15, 91, 43, 5, 91, 76, 44, 3, 49, 86, 101, 32, 78, 21, 35],[35, 21, 78, 32, 101, 86, 49, 3, 44, 76, 91, 5, 43, 91, 15, 52, 62, 78, 61, 68, 8, 56, 27, 34]).
f([84, 90, 17, 47, 50, 70, 49, 11, 18, 4, 50, 24, 94, 71, 100, 67, 91, 21, 55, 8, 83, 72, 87, 89, 45, 22, 62, 87, 80, 74, 69, 27, 57, 29, 90],[90, 29, 57, 27, 69, 74, 80, 87, 62, 22, 45, 89, 87, 72, 83, 8, 55, 21, 91, 67, 100, 71, 94, 24, 50, 4, 18, 11, 49, 70, 50, 47, 17, 90, 84]).
f([26, 50, 72, 1, 60, 47, 83, 64, 16, 38, 100, 72, 68, 9, 55, 17, 83, 83, 34, 58, 69, 60, 50, 78, 91, 35, 6, 18, 2, 2, 58, 3, 25, 67, 23, 10, 77, 69, 58, 16, 55, 87, 63],[63, 87, 55, 16, 58, 69, 77, 10, 23, 67, 25, 3, 58, 2, 2, 18, 6, 35, 91, 78, 50, 60, 69, 58, 34, 83, 83, 17, 55, 9, 68, 72, 100, 38, 16, 64, 83, 47, 60, 1, 72, 50, 26]).
f([90, 98, 51, 19, 66, 49, 75, 79, 34, 33, 13, 25, 101, 45, 75, 65, 43, 59, 61, 21, 75, 39, 57, 60, 53, 23, 58],[58, 23, 53, 60, 57, 39, 75, 21, 61, 59, 43, 65, 75, 45, 101, 25, 13, 33, 34, 79, 75, 49, 66, 19, 51, 98, 90]).
f([87, 9, 40, 93, 62, 52, 83, 35, 6, 27, 59, 9, 89, 89, 60, 24, 64, 56, 6, 86, 46, 52, 8, 41, 52, 93, 78, 31, 40, 86, 77, 67, 47, 20, 36, 100, 58, 66, 60, 75],[75, 60, 66, 58, 100, 36, 20, 47, 67, 77, 86, 40, 31, 78, 93, 52, 41, 8, 52, 46, 86, 6, 56, 64, 24, 60, 89, 89, 9, 59, 27, 6, 35, 83, 52, 62, 93, 40, 9, 87]).
f([83, 67, 60, 68, 89, 75, 97, 16, 79, 11, 38, 18, 75, 29, 71, 65, 95, 18, 77, 12, 37, 79, 15, 80, 23, 84, 87, 86, 93, 3, 62, 12, 28, 13, 42, 35, 22, 55, 60, 39, 22, 32, 20, 20, 45, 22, 25, 98, 53, 41],[41, 53, 98, 25, 22, 45, 20, 20, 32, 22, 39, 60, 55, 22, 35, 42, 13, 28, 12, 62, 3, 93, 86, 87, 84, 23, 80, 15, 79, 37, 12, 77, 18, 95, 65, 71, 29, 75, 18, 38, 11, 79, 16, 97, 75, 89, 68, 60, 67, 83]).
f([34, 90, 93, 100, 27, 17, 16, 52, 33, 23, 24, 70, 51, 66, 16, 94, 94, 83, 62, 2, 73, 41, 25, 10],[10, 25, 41, 73, 2, 62, 83, 94, 94, 16, 66, 51, 70, 24, 23, 33, 52, 16, 17, 27, 100, 93, 90, 34]).
f([1, 33, 71, 73, 66, 82, 92, 18, 95, 2, 6, 18, 60, 95, 59, 52, 10, 50, 73, 4, 90, 71, 53, 47, 65, 14, 87, 32, 22, 90, 31, 42, 98, 18, 76, 22, 43, 97, 29],[29, 97, 43, 22, 76, 18, 98, 42, 31, 90, 22, 32, 87, 14, 65, 47, 53, 71, 90, 4, 73, 50, 10, 52, 59, 95, 60, 18, 6, 2, 95, 18, 92, 82, 66, 73, 71, 33, 1]).
f([77, 48, 97, 66, 67, 61, 94, 94, 15, 32, 79, 65, 48, 18, 71, 92, 88, 25, 66, 47, 65, 84, 4, 71, 78, 32],[32, 78, 71, 4, 84, 65, 47, 66, 25, 88, 92, 71, 18, 48, 65, 79, 32, 15, 94, 94, 61, 67, 66, 97, 48, 77]).
f([14, 37, 91, 66, 11, 40, 32, 72, 66, 97, 31, 69, 1, 98, 21, 90, 60, 47, 8, 93, 31, 39, 93, 72, 52, 66, 30, 54, 50, 21, 23, 75, 16, 35, 92, 34, 46, 2, 14, 60, 97, 81, 80, 5],[5, 80, 81, 97, 60, 14, 2, 46, 34, 92, 35, 16, 75, 23, 21, 50, 54, 30, 66, 52, 72, 93, 39, 31, 93, 8, 47, 60, 90, 21, 98, 1, 69, 31, 97, 66, 72, 32, 40, 11, 66, 91, 37, 14]).
f([77, 18, 57, 44, 74, 29, 7, 20, 83, 60, 72, 76, 77, 48, 24, 85, 6, 41],[41, 6, 85, 24, 48, 77, 76, 72, 60, 83, 20, 7, 29, 74, 44, 57, 18, 77]).
f([2, 7, 84, 47, 41, 46, 35, 33, 16, 13, 45, 98, 23, 87],[87, 23, 98, 45, 13, 16, 33, 35, 46, 41, 47, 84, 7, 2]).
f([5, 35, 12, 53, 91, 77, 17, 23, 35, 79, 19, 5, 22, 72, 30, 77, 59, 28, 19, 7, 7, 23, 42, 90, 49, 90, 42, 44, 35, 9, 90, 54, 28, 58, 16, 8, 29, 1, 39, 98, 58, 58, 83],[83, 58, 58, 98, 39, 1, 29, 8, 16, 58, 28, 54, 90, 9, 35, 44, 42, 90, 49, 90, 42, 23, 7, 7, 19, 28, 59, 77, 30, 72, 22, 5, 19, 79, 35, 23, 17, 77, 91, 53, 12, 35, 5]).
f([32],[32]).
f([34, 69, 36, 40, 51, 84, 39, 67, 84, 88, 25, 44],[44, 25, 88, 84, 67, 39, 84, 51, 40, 36, 69, 34]).
f([38, 43, 82, 76, 84, 16, 5, 59, 85, 99, 55, 14, 67, 67, 27, 1, 19, 71, 85, 73, 55, 56],[56, 55, 73, 85, 71, 19, 1, 27, 67, 67, 14, 55, 99, 85, 59, 5, 16, 84, 76, 82, 43, 38]).
f([42, 70, 4, 40, 11, 29, 44, 93, 90, 56, 47, 71, 34, 95, 53, 42, 30, 43, 55, 89, 58, 85, 60, 66, 18, 84, 34, 68, 92, 55, 13, 58, 3, 44, 47, 49, 10, 57, 12, 16, 36, 100, 89, 63],[63, 89, 100, 36, 16, 12, 57, 10, 49, 47, 44, 3, 58, 13, 55, 92, 68, 34, 84, 18, 66, 60, 85, 58, 89, 55, 43, 30, 42, 53, 95, 34, 71, 47, 56, 90, 93, 44, 29, 11, 40, 4, 70, 42]).
f([11, 92, 100, 73, 22, 74, 60, 39, 51, 63, 59, 69, 47, 54, 72, 61, 43, 7, 39, 88, 89],[89, 88, 39, 7, 43, 61, 72, 54, 47, 69, 59, 63, 51, 39, 60, 74, 22, 73, 100, 92, 11]).
f([7, 48, 18, 85, 75, 41, 12, 63, 50, 19, 80, 71, 86, 75, 38, 32, 2, 2, 61, 31, 20, 50, 86, 68, 96, 58, 68, 84, 56, 34, 52, 13, 65, 74, 19],[19, 74, 65, 13, 52, 34, 56, 84, 68, 58, 96, 68, 86, 50, 20, 31, 61, 2, 2, 32, 38, 75, 86, 71, 80, 19, 50, 63, 12, 41, 75, 85, 18, 48, 7]).
:-end_in_pos.
:-begin_in_neg.
f([7, 55, 52, 34, 48, 77, 41, 14, 65, 43, 44, 78, 91, 82, 65, 42, 52, 9],[7, 91, 41, 34, 44, 9, 14, 42, 65, 48, 43, 82, 52, 78, 77, 55, 52, 65]).
f([46, 32, 89, 70, 4, 15, 8, 85, 73, 38, 1, 92, 82, 51, 31, 100, 15, 85, 25, 56, 82, 59, 39, 16, 53, 45, 43, 75, 23, 24, 96, 87, 20, 14, 8, 84, 32, 20, 101, 57, 73, 81],[24, 45, 32, 8, 73, 32, 46, 25, 96, 82, 84, 51, 70, 43, 56, 4, 1, 15, 82, 73, 85, 38, 53, 100, 39, 16, 101, 57, 23, 92, 14, 15, 20, 75, 89, 20, 85, 81, 59, 31, 8, 87]).
f([45, 59, 45, 43, 101, 17, 75, 49, 70, 30, 90, 83, 37, 93, 12, 3, 18, 8, 92, 49, 70, 10, 62, 25, 65, 94, 24, 100, 79, 37, 51, 96, 13, 45, 36, 58, 96, 11, 70, 51, 91, 76, 72, 9, 59, 48, 68, 91],[75, 13, 90, 51, 65, 45, 12, 3, 94, 93, 8, 91, 36, 92, 100, 70, 91, 49, 76, 101, 18, 68, 49, 70, 30, 62, 25, 24, 51, 79, 96, 83, 59, 45, 43, 59, 11, 17, 96, 10, 45, 58, 37, 70, 48, 72, 9, 37]).
f([54, 72, 18, 2, 17, 56, 53, 70, 3, 12, 27, 93, 70, 6, 18, 11, 36, 10, 43, 101, 20, 37, 87, 61, 11, 44, 60, 25, 13, 26, 64, 66, 93, 77],[53, 18, 27, 54, 37, 44, 11, 18, 10, 56, 26, 17, 13, 93, 64, 70, 25, 2, 77, 12, 43, 11, 60, 70, 93, 3, 36, 66, 6, 61, 72, 87, 101, 20]).
f([42, 62, 30, 23, 57, 29, 7, 70, 11, 2, 37],[11, 23, 57, 70, 37, 30, 62, 2, 29, 42, 7]).
f([71, 45, 28, 86, 52, 48, 59, 98, 57, 36, 66, 17, 44, 3, 61, 5, 54, 84, 61, 78, 2],[3, 78, 28, 5, 57, 44, 84, 45, 59, 17, 48, 2, 52, 98, 61, 71, 66, 54, 86, 61, 36]).
f([49, 2, 101, 35, 46, 52, 24, 73, 43, 69, 17, 82, 66, 43, 3, 4, 85, 20, 90, 41, 9],[4, 52, 17, 3, 69, 35, 2, 82, 20, 85, 101, 90, 9, 73, 66, 24, 49, 43, 41, 46, 43]).
f([30, 53, 57, 31, 29, 25, 12, 58, 37, 72, 22, 93, 76, 95, 4, 69, 10, 88, 28, 21, 51, 64, 4, 26, 2],[10, 57, 12, 95, 4, 88, 69, 53, 76, 4, 21, 25, 26, 2, 37, 93, 29, 64, 28, 72, 51, 22, 30, 31, 58]).
f([17, 90, 24, 3, 23, 25, 10, 74, 74, 47, 81, 43, 41, 81, 57, 75, 64, 18, 5, 77, 80, 101, 90, 52, 40, 95, 59, 78, 55, 63, 43, 9, 77, 61, 13, 40, 78, 46, 85, 29, 89],[90, 24, 57, 78, 41, 81, 74, 13, 80, 47, 23, 89, 40, 77, 75, 63, 40, 77, 43, 52, 59, 18, 5, 74, 9, 55, 64, 17, 101, 61, 3, 10, 25, 78, 90, 43, 85, 46, 29, 81, 95]).
f([78, 93, 3, 46, 2, 43, 100, 53, 10, 23, 57, 90, 67, 58, 57, 101, 58, 96, 45, 59, 97, 96, 37, 51, 76, 85, 92, 79, 42, 18, 82, 17, 86, 69, 45, 85, 13, 53, 34],[78, 96, 82, 57, 76, 13, 45, 51, 90, 79, 53, 58, 85, 96, 69, 3, 34, 42, 23, 67, 43, 2, 58, 37, 53, 85, 86, 46, 92, 59, 45, 57, 100, 18, 97, 17, 10, 93, 101]).
f([27, 13, 98, 21, 91, 83, 3, 48, 9, 7, 29, 86, 15, 71, 63, 60, 14],[21, 3, 71, 60, 91, 15, 86, 7, 83, 98, 29, 27, 9, 48, 13, 14, 63]).
f([47, 50, 90, 59, 75, 17, 78, 12, 95, 91, 42, 23, 68, 20, 40, 91, 87, 101, 59, 36, 12, 31, 95, 41, 100, 28, 13, 34, 58, 43, 83, 51, 20, 86, 45, 99, 77, 46, 2, 11, 12, 85, 49, 84, 15],[41, 42, 83, 2, 47, 51, 95, 78, 12, 45, 86, 36, 101, 46, 28, 12, 77, 20, 17, 43, 99, 13, 23, 40, 59, 91, 84, 12, 68, 87, 91, 90, 50, 15, 95, 58, 49, 20, 31, 75, 85, 11, 100, 34, 59]).
f([33, 57, 45, 10, 21, 10, 32, 76, 80, 55, 78, 42, 4, 77, 65, 31, 26, 67],[33, 80, 76, 21, 26, 67, 78, 42, 57, 45, 55, 10, 65, 77, 32, 10, 4, 31]).
f([9, 64, 54, 12, 46, 59, 36, 15, 77, 28, 61, 53, 5, 76, 50, 68],[61, 28, 68, 46, 53, 5, 76, 54, 77, 15, 59, 9, 36, 50, 64, 12]).
f([81, 34, 54, 16, 94, 91, 21, 3],[34, 81, 91, 16, 54, 94, 21, 3]).
f([47, 88, 12, 14, 42, 28, 83, 1, 10, 9, 22, 89, 67, 72, 1, 82, 74, 79, 26, 75, 74, 35, 4, 50, 24],[83, 4, 26, 67, 74, 82, 72, 47, 9, 1, 22, 42, 88, 75, 28, 79, 1, 50, 24, 10, 35, 74, 89, 12, 14]).
f([12, 24, 56, 1, 59, 85, 93, 59, 87, 9, 7, 72, 69, 85, 90, 90, 98, 32, 54, 11, 86, 98, 9, 15, 97, 38, 101, 100, 31, 14, 87, 50, 97, 32, 61, 54, 63, 33, 101, 14, 100, 23, 24, 60, 68, 44, 20, 42, 58, 96],[14, 59, 11, 100, 33, 24, 9, 101, 68, 20, 56, 61, 87, 86, 54, 31, 15, 32, 59, 90, 7, 38, 100, 12, 58, 101, 72, 97, 93, 9, 69, 42, 96, 24, 63, 23, 1, 44, 85, 98, 54, 90, 87, 97, 50, 60, 14, 98, 85, 32]).
f([8, 30, 41, 27, 18, 48, 35, 100, 54, 35, 100, 54, 37, 1, 51, 59, 87, 65, 84, 30, 70],[84, 100, 30, 30, 48, 41, 37, 51, 27, 54, 100, 1, 54, 8, 35, 35, 59, 87, 65, 70, 18]).
f([42, 30, 8, 82, 14, 37, 35, 74, 30, 77, 16, 74, 13, 57, 2, 100, 11, 31, 84, 2, 79, 56, 6, 55, 68, 49, 8, 54, 49, 44, 22, 5, 58, 57, 85, 97, 64, 37, 37, 67, 31, 37, 36, 16, 74, 29],[16, 100, 2, 77, 31, 8, 85, 54, 13, 67, 6, 56, 30, 68, 64, 37, 74, 44, 14, 29, 31, 11, 37, 16, 35, 74, 57, 42, 36, 30, 49, 79, 97, 55, 74, 37, 37, 22, 84, 49, 5, 58, 57, 8, 82, 2]).
f([100, 17, 80, 99, 79, 31, 67, 87, 38, 25, 98, 83, 45, 55, 25, 59, 40, 13, 59, 9, 41, 83, 39, 21, 21, 79, 31, 46, 27, 53, 72, 14],[21, 31, 83, 21, 31, 13, 59, 79, 83, 27, 41, 72, 59, 53, 55, 80, 46, 79, 17, 87, 14, 45, 99, 9, 100, 98, 25, 25, 39, 67, 40, 38]).
:-end_in_neg.
