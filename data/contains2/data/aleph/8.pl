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

:- determination(f/1,c_0/1).
:- determination(f/1,c_1/1).
:- determination(f/1,c_2/1).
:- determination(f/1,c_3/1).
:- determination(f/1,c_4/1).
:- determination(f/1,c_5/1).
:- determination(f/1,c_6/1).
:- determination(f/1,c_7/1).
:- determination(f/1,c_8/1).
:- determination(f/1,c_9/1).
:- determination(f/1,c_10/1).

:-modeb(*,c_0(-element)).
:-modeb(*,c_1(-element)).
:-modeb(*,c_2(-element)).
:-modeb(*,c_3(-element)).
:-modeb(*,c_4(-element)).
:-modeb(*,c_5(-element)).
:-modeb(*,c_6(-element)).
:-modeb(*,c_7(-element)).
:-modeb(*,c_8(-element)).
:-modeb(*,c_9(-element)).
:-modeb(*,c_10(-element)).

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
f([81, 60, 86, 83, 99, 33, 86, 49, 38, 35, 47, 46, 32, 17, 84, 2, 2, 85, 64, 88, 43, 61, 10, 63, 89, 47, 29, 6, 28, 74, 36, 81, 37, 95, 42, 37, 69, 90, 66]).
f([37, 11, 36, 64, 49, 6, 47, 93, 60, 53, 41, 64, 77, 77, 36, 73, 54, 11, 91, 2, 85, 20, 80, 85, 55, 70, 78, 77, 1, 52, 30, 58, 51, 6, 18, 81, 47, 67, 61]).
f([52, 80, 60, 12, 47, 37, 43, 71, 82, 13, 60, 52, 27, 28, 22, 88, 76, 71, 44, 54, 14, 14, 84, 83, 18, 64, 70, 27, 91, 44, 88, 9, 67, 39, 22, 2, 44, 69, 45, 57, 18, 19]).
f([29, 86, 62, 72, 79, 76, 61, 34, 30, 26, 92, 25, 74, 56, 34, 83, 67, 69, 26, 9, 31, 37, 87, 45, 28, 54, 44, 94, 73, 17]).
f([31, 47, 57, 44, 1, 17, 74, 89, 5, 70, 6, 69, 37, 43, 36, 14, 70, 30, 99, 58, 67, 76, 76, 60, 72, 8, 95, 3, 96, 43, 23, 101, 73, 20, 34, 30, 46, 6, 40, 59, 43, 7, 66, 94, 49, 64, 100, 30, 84, 16]).
f([67, 20, 3, 95, 6, 85, 57, 25, 12, 47, 30]).
f([93, 64, 62, 16, 42, 31, 2, 91, 29, 74, 70, 26, 48, 36, 84, 49, 84, 27, 48, 18, 35, 33, 88, 50, 13, 11, 62, 93, 8, 53, 66, 5, 48, 68, 2, 33, 101, 82, 73, 49, 60, 20, 87, 70, 6, 9, 38, 44, 11, 97]).
f([58, 13, 6, 69, 81, 44, 90, 58, 100, 15, 19, 100, 72, 52, 81, 28, 66, 56, 58, 29, 40, 32, 37, 79, 17, 86, 22]).
f([82, 16, 29, 98, 13, 33, 36, 10, 24, 59, 32, 55, 98, 76, 81, 38, 22, 83, 63, 43, 49, 30, 24, 46, 9, 16, 14, 44, 84, 28, 99, 83, 3, 57, 14, 33, 89]).
f([1, 29, 31, 65, 29, 35, 32, 79, 52, 100, 63, 24, 83, 43, 63, 83, 6, 76, 64, 58, 20]).
f([6, 4]).
f([8, 6, 68, 36, 3, 89, 18, 64, 10, 12]).
f([46, 12, 6, 69, 24, 84, 26, 55, 99, 69, 61, 1, 30, 10, 40, 87, 57]).
f([96, 45, 17, 10, 99, 82, 60, 90, 38, 74, 25, 68, 32, 5, 68, 98, 97, 78, 87, 9, 54, 17, 78, 41, 20, 47, 76, 37, 35, 88, 78, 31, 59, 52, 101, 82, 69, 26, 46, 80, 58, 81, 47, 37, 99, 36, 99]).
f([6, 44, 42, 23, 18, 1, 35, 71]).
f([23, 10, 85, 15, 16, 59, 68, 83, 36, 6, 49, 11, 28, 7, 101, 101, 3, 92, 58, 86, 65, 15, 73, 73, 69, 73, 76, 53]).
f([90, 6, 15, 43, 81, 96, 1, 67, 15, 20, 49, 14, 34, 71, 71, 85, 6]).
f([67, 25, 8, 54, 13, 77, 1, 10, 58, 90, 28, 84, 5, 95, 70, 25, 69, 97, 17, 35, 89, 52, 50, 71, 30, 50, 12, 43, 6, 81, 78, 86, 64, 59, 31, 50, 77, 92, 29, 71, 72, 51, 94, 79, 90, 58]).
f([70, 101, 21, 71, 5, 77, 40, 25, 74, 45, 60, 53, 49, 97, 30, 34, 79, 54, 47, 54, 63, 33, 71, 50, 14, 1, 76, 52, 37, 54, 45, 44, 74, 98, 10, 18, 24, 71, 11, 64, 4, 9, 15, 53, 94, 18, 97]).
f([97, 97, 56, 75, 79, 43, 6, 45, 79, 59, 70, 93, 91, 83, 40, 96, 54, 68, 89, 30, 19, 63, 40, 29, 95, 3, 23, 31]).
:-end_in_pos.
:-begin_in_neg.
f([43, 83, 55, 24, 89, 86, 30, 91, 24, 18]).
f([18, 80, 48, 38, 37, 39, 16, 18, 91, 67, 30, 22, 29, 96, 51, 15, 84, 60, 1, 26, 37, 55, 58, 42, 61, 78, 14, 49, 35, 30, 22, 79, 1, 89, 65, 53, 79, 98, 16, 81, 32, 13, 37, 17, 97, 87]).
f([51, 34, 75, 56, 44, 8, 59, 68, 71, 77, 92, 44, 65, 69, 7, 43, 101, 31, 36, 24, 36, 21, 72, 15, 82, 44, 5, 18, 78, 39, 16, 38, 90, 97, 40, 66, 40, 99, 57, 94, 74, 50, 65]).
f([74, 24, 30, 33, 50, 68, 10, 22, 60, 18, 54, 19, 5, 97]).
f([101, 65, 73, 12, 35, 40, 53, 101, 57, 67, 48, 85, 88, 10, 11, 60, 96, 32, 31, 91, 51, 72, 48, 68, 13, 84, 63, 31, 30, 84, 94, 100, 20, 90, 49, 5, 60, 37, 65, 83, 18, 98, 57, 96, 69, 8]).
f([17, 22, 75, 2, 55, 83, 3, 31, 96, 5, 87, 89, 69]).
f([90, 70, 60, 59, 80, 18, 5, 51, 96, 28, 19, 77, 8, 32, 45, 74, 83, 81, 66, 34, 65, 45, 94, 57, 52]).
f([48, 38, 91, 40, 98, 59, 4, 95, 87, 31, 74, 86, 89, 37, 60, 8, 96, 100, 26, 1, 70, 17, 38, 10, 61, 1, 77, 49, 64, 10, 4, 72, 51, 94, 31, 79, 2]).
f([36, 73, 72, 54, 27, 34, 79, 98, 82, 54, 91, 63, 64, 43, 47, 62, 15, 32, 18, 65, 72, 18, 60, 86, 18, 56, 87, 38, 15, 71, 50, 7, 72, 22, 87]).
f([13, 74, 80, 54, 94, 21, 84, 5]).
f([97, 94, 82, 90]).
f([4, 78, 59, 39, 86, 26, 3, 96, 64, 38, 101, 23, 60, 93, 1, 15, 48, 63, 62, 71, 92, 86, 81, 100, 50, 47, 93, 92, 44, 35, 72, 28, 52, 17, 31, 51]).
f([58, 31, 31, 19, 100, 85, 87, 38, 22, 47, 90, 14, 93, 84, 75, 23, 78, 57, 73, 23, 93, 30, 53, 31, 20, 58, 11, 63, 35, 19, 64, 7, 54, 54, 30]).
f([56, 30, 33, 65, 32, 1, 70, 92, 1, 19, 42, 11, 100, 19, 5, 43, 101, 60, 45, 54, 37, 19, 61, 89, 72, 46, 61, 65, 15, 42, 50, 96, 24, 48, 52, 21, 69, 30, 45, 48, 24, 97, 45]).
f([69, 11, 35, 38, 15, 43, 2, 33, 76, 76, 26, 76, 25, 77, 22, 68, 49, 32, 22, 65, 46, 89, 46, 3, 42, 1, 52, 59, 11, 96, 22, 69, 79, 40, 13, 15, 33, 45, 47, 77, 34, 83, 94, 67]).
f([71, 19, 92, 84, 42, 91, 49, 28, 40, 65, 98, 92, 39]).
f([74, 88, 26, 98, 51, 34, 44, 43, 41, 69, 3, 67, 98, 49, 100, 2, 38, 37, 37, 88, 62, 33, 31, 38, 70, 47, 74, 98, 96, 55, 43, 82, 19, 78, 73, 89, 27, 21, 37, 58, 61]).
f([91, 91, 65, 34, 17, 24, 23, 5, 61, 74, 24, 90, 53, 46]).
f([39, 7, 15, 10, 38, 36, 76, 72, 33, 3, 49, 51, 65, 30, 40, 69, 86, 37, 40, 8, 73, 30, 64, 20, 35]).
f([99, 92, 8, 83, 28, 91, 85, 91, 18, 101, 92, 3, 25, 50, 63, 86, 101, 15, 99, 97, 71, 3, 36, 55, 34, 39, 10, 50, 14, 12, 88, 58, 67, 51, 96, 19, 32, 3, 53, 48, 13]).
:-end_in_neg.
