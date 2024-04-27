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
%% :- determination(f/1,element/2).
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
f([3, 4, 4, 5, 9, 9, 12, 15, 21, 26, 27, 29, 31, 39, 39, 40, 43, 44, 58, 60, 61, 65, 72, 72, 73, 79, 88, 89, 91, 91, 95, 99, 100, 100]).
f([23, 24, 34, 89]).
f([2, 2, 7, 8, 11, 19, 20, 20, 23, 23, 23, 23, 24, 26, 28, 28, 30, 30, 31, 33, 33, 41, 46, 47, 49, 51, 58, 60, 64, 64, 73, 76, 77, 83, 86, 88, 93, 94, 100, 101]).
f([3, 3, 5, 5, 7, 8, 17, 18, 20, 21, 22, 27, 28, 29, 29, 35, 42, 43, 45, 47, 48, 52, 53, 53, 54, 54, 55, 62, 63, 64, 67, 67, 70, 71, 78, 81, 83, 83, 85, 86, 86, 86, 91, 92, 94, 94, 94, 98]).
f([7, 30, 42, 68, 78, 85, 91, 96]).
f([12, 12, 14, 16, 23, 25, 25, 26, 34, 35, 41, 47, 48, 50, 62, 62, 67, 69, 78, 78, 80, 87, 88, 89, 91, 96, 98, 101, 101]).
f([1, 5, 6, 8, 14, 19, 29, 34, 35, 37, 39, 43, 51, 60, 62, 62, 63, 64, 65, 82, 82, 84, 86, 90, 91, 91, 96, 101]).
f([1, 1, 2, 3, 4, 6, 6, 14, 15, 16, 16, 20, 22, 23, 24, 29, 30, 32, 38, 42, 46, 46, 46, 47, 48, 49, 49, 50, 52, 56, 56, 63, 67, 68, 68, 69, 70, 72, 77, 78, 79, 88, 91, 93, 96, 98, 99, 100, 101]).
f([1, 4, 6, 8, 12, 13, 13, 13, 14, 15, 16, 18, 18, 20, 25, 26, 28, 32, 33, 39, 39, 42, 51, 53, 54, 57, 59, 61, 64, 66, 70, 71, 73, 74, 77, 78, 78, 79, 80, 81, 84, 86, 86, 87, 96, 97, 99, 99, 100]).
f([10, 17, 17, 35, 39, 42, 42, 70, 78, 82, 94, 97]).
f([1, 2, 3, 4, 7, 9, 16, 18, 19, 19, 20, 20, 24, 24, 27, 31, 35, 37, 41, 42, 42, 45, 46, 54, 55, 56, 56, 59, 62, 63, 66, 66, 67, 68, 68, 73, 76, 82, 82, 88, 88, 89]).
f([7, 13, 14, 19, 22, 27, 42, 45, 68, 77, 77, 86, 91, 91]).
f([2, 11, 12, 16, 19, 27, 28, 29, 33, 33, 33, 40, 47, 48, 57, 68, 71, 77, 96, 98, 100]).
f([3, 3, 5, 11, 12, 17, 18, 18, 18, 19, 20, 26, 39, 39, 40, 42, 47, 50, 52, 55, 56, 56, 60, 62, 65, 70, 70, 73, 78, 78, 82, 83, 83, 83, 91, 96, 96, 97, 98, 100, 101]).
f([10, 11, 17, 23, 29, 31, 34, 36, 40, 58, 73, 75]).
f([2, 3, 5, 5, 8, 9, 11, 13, 14, 16, 16, 16, 17, 20, 20, 28, 31, 33, 34, 35, 39, 39, 41, 42, 43, 44, 48, 55, 56, 58, 59, 61, 64, 70, 70, 75, 76, 78, 78, 78, 78, 80, 80, 81, 81, 89, 96, 98, 99, 100]).
f([3, 4, 5, 5, 10, 12, 13, 14, 16, 17, 17, 21, 22, 30, 35, 36, 36, 38, 39, 39, 40, 41, 42, 42, 43, 44, 45, 46, 49, 53, 56, 57, 59, 66, 70, 72, 73, 74, 78, 82, 82, 88, 89, 92, 96, 98, 101, 101]).
f([2, 5, 9, 13, 18, 20, 26, 28, 29, 29, 33, 33, 34, 34, 37, 37, 40, 42, 42, 42, 43, 44, 51, 54, 55, 56, 62, 63, 67, 70, 70, 71, 77, 77, 77, 78, 79, 79, 85, 85, 88, 92, 94, 96, 99, 100]).
f([3, 7, 8, 11, 13, 17, 24, 24, 26, 28, 29, 29, 29, 35, 39, 39, 46, 57, 59, 60, 64, 65, 66, 66, 68, 70, 74, 76, 86, 87, 92, 93, 96, 99, 101]).
f([5, 10, 11, 15, 21, 25, 26, 28, 28, 34, 41, 44, 44, 44, 50, 51, 53, 55, 55, 58, 61, 64, 73, 74, 76, 80, 80, 84, 89, 91, 92, 93, 97, 99, 101]).
:-end_in_pos.
:-begin_in_neg.
f([63, 36, 9, 12, 24, 99, 10, 40, 1, 17, 43, 74, 15, 7, 59, 64, 15, 41, 9, 49, 10, 36, 98, 87, 45, 84, 21, 13, 39, 26, 20, 88, 25, 101, 33]).
f([56, 23, 86, 8, 85, 61, 7, 79, 80, 9, 83, 69, 31, 64, 63, 73, 12, 94, 16, 52, 57, 91, 22, 19, 8, 96]).
f([29, 33, 55, 57, 92, 41, 3, 65, 73, 57, 31, 24, 98]).
f([46, 53, 65, 93, 38, 87, 19, 25, 50, 40]).
f([27, 48, 70, 53, 80, 97, 84]).
f([26, 19, 38, 4, 34, 92, 101, 26, 15]).
f([21, 7, 36, 48, 6, 26, 56, 71, 92, 78, 76, 49, 47, 45, 79, 44, 58, 82, 32, 70, 39, 90, 30, 54, 2, 95, 1, 38, 98, 13, 62, 98, 24, 37, 9, 96, 67, 68, 13, 19, 35, 93, 58, 31, 50, 33, 48, 69, 28, 86]).
f([94, 73, 52, 35, 34, 66, 52, 69, 86, 31, 43, 46, 97, 66, 5, 76, 39, 51, 14, 65, 56]).
f([27, 2, 88, 31, 96, 31, 30, 72, 77, 40, 22, 18, 38, 62, 26, 76, 50, 98, 3, 29, 45, 2, 75, 94, 101, 31, 54, 31, 13, 88, 82, 55, 5, 88, 23, 101]).
f([97, 15, 65, 4, 13, 46, 5, 27, 67, 20, 40, 93, 101, 1, 5, 51, 14, 78, 91, 19, 65, 30, 13, 1, 79, 9, 79, 44, 61, 87, 66, 69, 37, 74, 5, 75, 33, 46, 52, 94, 96, 84, 52]).
f([94, 95, 93, 13, 32, 39, 71, 71, 12, 27, 32, 44, 55, 81, 7, 40, 12, 4, 35, 30, 33, 9, 17, 52, 54, 92, 53, 73, 67, 66, 20]).
f([10, 48, 95, 85, 13, 8, 2, 33, 75, 39, 66, 80, 38, 69, 67, 15, 20, 6, 58, 5, 33, 43, 76, 47, 74, 3, 94]).
f([69, 25, 51, 6, 98, 50, 76, 79, 3, 28, 89, 96, 43, 100, 72, 66, 38, 96, 67, 70, 33, 89, 59, 72, 86, 41, 42, 8, 21, 52, 79, 1, 101, 21, 44, 58, 25, 8, 3, 66, 96, 47, 5, 26, 34]).
f([34, 10, 15, 50, 16, 2, 10, 78, 51, 17, 92, 66, 28, 71, 3, 85, 36, 52, 78, 25, 14, 101, 10, 85, 69, 23, 7, 26, 57, 57, 99, 67, 82, 36, 19, 68, 70, 78, 54, 76, 66, 6, 54, 19, 87]).
f([66, 73, 64, 80, 90, 91, 72, 63, 88, 23, 29, 36, 42, 88, 76, 43, 66, 35, 19, 100, 70, 24, 92, 39, 87, 29, 47, 88, 94, 27, 73, 94, 76, 8, 32, 2, 99, 11, 26, 30, 24]).
f([50, 94, 58, 88, 42, 72, 33, 95, 48, 101, 34, 52, 65, 35, 77, 59, 32, 42, 95, 92, 12, 90, 86, 60, 99, 8, 4, 6, 38, 28, 87, 21, 28, 56, 35, 7, 78, 98, 65, 84, 63, 65, 61, 54, 74, 3, 91]).
f([8, 88, 70, 21, 72, 98, 6, 52, 19, 22, 31, 57, 94, 66, 101, 33, 57, 83, 93, 84, 68, 101, 64, 82, 40]).
f([94, 40, 55]).
f([8, 34, 6, 73, 55, 56, 54, 37, 99, 34, 23, 72, 6, 64, 10, 24, 85, 90, 12, 71, 38, 18, 41, 89, 49, 70, 45, 60, 98, 91, 49, 78, 90, 17, 24, 29, 23, 4, 64, 51, 11, 71, 45, 25, 48, 79, 82, 69, 76, 78]).
f([14, 90, 83, 79, 63, 20, 42, 75, 67, 1, 93, 28, 17, 60, 98, 75, 73, 62, 47, 69, 24, 77, 10, 76, 45, 95, 8, 62, 6, 41, 55, 88, 44, 97, 10, 85, 89, 1]).
:-end_in_neg.
