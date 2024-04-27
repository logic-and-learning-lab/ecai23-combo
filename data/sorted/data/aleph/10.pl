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
f([49, 55, 74]).
f([4, 9, 15, 18, 19, 19, 20, 22, 24, 24, 28, 31, 31, 33, 34, 38, 41, 41, 43, 43, 46, 48, 48, 50, 53, 54, 55, 59, 61, 62, 65, 66, 67, 69, 69, 75, 76, 77, 78, 80, 86, 88, 94, 95, 98, 98, 98, 100, 101, 101]).
f([7, 16, 22, 60, 63, 81, 82, 98, 101]).
f([1, 2, 4, 9, 9, 9, 10, 10, 14, 15, 15, 16, 18, 23, 24, 29, 30, 30, 37, 38, 42, 47, 58, 58, 59, 59, 66, 70, 76, 80, 82, 85, 85, 91, 93, 94, 95]).
f([7, 9, 17, 23, 28, 29, 30, 33, 35, 45, 47, 50, 53, 54, 55, 59, 69, 72, 73, 83, 85, 88, 97]).
f([5, 7, 9, 9, 13, 13, 15, 27, 28, 29, 33, 34, 44, 48, 50, 52, 57, 57, 65, 69, 70, 70, 71, 72, 72, 85, 85, 87, 87, 88, 93, 94]).
f([3, 6, 6, 9, 11, 15, 18, 19, 20, 21, 22, 30, 31, 34, 34, 35, 36, 36, 37, 41, 46, 48, 51, 52, 52, 54, 59, 65, 68, 70, 72, 72, 76, 80, 83, 84, 85, 87, 88, 88, 97, 98]).
f([3, 5, 9, 9, 10, 10, 12, 12, 15, 20, 23, 25, 26, 27, 31, 32, 36, 38, 44, 45, 48, 49, 49, 50, 59, 61, 62, 66, 67, 68, 70, 70, 73, 77, 79, 80, 86, 87, 88, 100]).
f([12, 14, 14, 21, 30, 32, 35, 41, 47, 58, 61, 62, 85, 93]).
f([1, 2, 3, 3, 5, 9, 11, 15, 18, 21, 27, 29, 30, 33, 38, 38, 39, 41, 42, 43, 43, 47, 48, 49, 51, 52, 54, 56, 56, 57, 61, 65, 66, 67, 70, 75, 78, 79, 89, 91, 92, 96, 96, 96, 100, 100]).
f([4, 17, 26, 39, 41, 68, 85]).
f([19, 25, 32, 35, 37, 42, 45, 51, 51, 54, 77, 77, 79, 81, 81, 82, 82, 88, 93, 93, 95, 99]).
f([6, 9, 15, 26, 29, 29, 34, 41, 42, 53, 55, 55, 58, 68, 70, 70, 73, 75, 85, 88, 89, 94, 101, 101]).
f([2, 5, 7, 10, 10, 12, 13, 14, 17, 26, 26, 31, 34, 34, 41, 43, 46, 48, 53, 53, 57, 63, 63, 64, 66, 68, 79, 81, 83, 86, 87, 88, 92, 94, 95, 97, 99, 101]).
f([1, 6, 8, 12, 21, 26, 27, 29, 33, 34, 35, 41, 42, 44, 46, 49, 50, 50, 57, 59, 62, 70, 73, 74, 75, 80, 82, 86, 92, 94, 95, 97, 100]).
f([3, 6, 15, 18, 19, 19, 22, 31, 31, 31, 33, 35, 36, 36, 38, 38, 41, 43, 45, 46, 48, 51, 52, 52, 55, 61, 63, 63, 64, 65, 66, 68, 68, 69, 70, 74, 79, 79, 80, 81, 82, 82, 83, 85, 93, 95, 98]).
f([3, 11, 13, 17, 18, 23, 26, 26, 26, 29, 33, 34, 35, 36, 38, 40, 40, 50, 56, 60, 63, 65, 67, 68, 69, 77, 83, 91, 94, 94, 98, 99]).
f([6, 11, 15, 19, 32, 39, 46, 50, 54, 54, 54, 55, 59, 59, 61, 62, 63, 64, 64, 64, 66, 68, 75, 75, 79, 80, 83, 87, 87, 91, 96, 98]).
f([83]).
f([4, 6, 9, 10, 28, 33, 33, 35, 36, 39, 44, 45, 51, 56, 60, 65, 65, 69, 69, 70, 80, 87, 87, 90, 91]).
:-end_in_pos.
:-begin_in_neg.
f([95, 33]).
f([56, 79, 8, 100, 39, 12, 74, 39, 2, 86, 9, 20]).
f([9, 78, 13, 23, 83, 16, 93, 24, 20]).
f([27, 12, 79]).
f([22, 96, 63]).
f([5, 95, 1, 15, 69, 27, 48, 66, 43, 101, 75, 68, 52, 101, 73, 67, 60, 9, 18]).
f([61, 12, 99, 32, 76, 17, 35, 22, 83, 43, 4, 14, 48, 20, 79, 88, 33, 31, 99, 54, 50, 76, 49, 69, 36, 14, 45, 96, 98, 11, 34, 22, 46, 3]).
f([21, 91, 39, 30, 4, 48, 24, 21, 6, 83, 77, 81, 56, 86, 83, 100, 82, 76, 7, 34, 53, 10, 31, 16, 39, 59, 80, 68, 32, 80, 87, 65, 47, 6, 15, 33, 97, 65, 45, 96, 24, 26]).
f([28, 33, 46, 13, 50, 23, 37, 93, 83, 12, 57, 12, 56, 82, 96, 54, 31, 96, 98, 37, 15, 8, 12, 38, 81, 48, 1, 87, 33, 17, 7, 38, 80, 55, 30, 83, 99, 43, 89]).
f([28, 9, 9, 34, 67, 70, 93, 35, 82, 13, 44, 57, 9, 55, 9, 16]).
f([71, 50, 94, 48, 5, 28, 21, 54, 62, 87, 31, 81, 27, 25, 100, 22, 26, 9, 40, 30, 25, 2, 64, 36, 55, 10, 92, 71, 75, 43, 74, 22, 1, 9, 10, 63, 31, 15, 40, 18, 29, 29, 67, 77, 67, 81, 8, 31]).
f([64, 8, 70, 41, 95, 73, 1, 51, 6, 20, 70, 14, 79, 100, 8, 1, 84, 80, 95, 99, 46, 56, 71, 10, 80, 8, 5, 41, 52, 28, 21, 18, 99, 15, 42, 32, 22, 40, 14, 90, 76, 93, 43, 73, 5, 12, 15, 100, 39, 5, 34]).
f([75, 35, 57, 100, 67, 71, 61, 59, 9, 11, 76, 78, 65, 38, 59, 22, 60, 36, 62, 61, 37, 46, 92, 66, 88, 41, 90, 33, 35, 93, 48, 43, 73, 92, 91, 91, 84, 47, 1, 42, 34, 44, 63, 57, 73, 100, 10, 51]).
f([31, 20]).
f([64, 34, 69, 70, 64, 56, 84, 19, 90, 27, 4, 78, 9, 41, 72, 17, 6, 22, 93, 56, 65, 98, 32, 31, 36, 35, 72, 70, 61, 70, 60, 27, 39, 70, 45, 3, 45, 74, 83, 80, 47, 69, 71, 10, 60, 96]).
f([76, 21, 46, 83, 64, 45, 41, 92, 24, 3, 6, 64, 22, 22, 22, 34, 9, 46, 81, 89, 84, 78, 89]).
f([88, 97, 58, 18, 101, 46, 26, 19, 28, 33, 93, 69, 31, 24, 83, 16, 100, 42, 3, 71, 10, 67, 50, 63, 39, 24, 87, 23, 36, 87, 31, 12, 21, 73, 47, 37, 101, 33, 4, 75, 99, 93, 65, 17]).
f([36, 52, 87, 55, 14, 8, 39, 26]).
f([31, 24, 100, 71, 30, 76, 13, 73, 18, 55, 59, 98, 92, 44, 58, 61, 51, 65, 96, 97, 59, 74, 89]).
f([32, 22, 18, 8, 18, 52, 51, 38, 57, 79, 55, 16, 89]).
:-end_in_neg.