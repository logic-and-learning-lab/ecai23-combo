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
f([48, 50, 20, 10, 52, 8, 50, 74, 4, 62, 66, 2, 20, 56, 94, 72, 98, 8, 82, 48, 42, 74, 78, 70, 90, 54, 82, 10, 26]).
f([6, 20, 96, 98, 28, 62, 82, 52, 20, 50, 84, 70, 6, 30, 40, 4, 20, 32, 10, 42, 86, 10, 24, 60, 26, 78, 56, 2, 66, 48, 40, 72, 8, 66, 20, 12, 32, 72, 60, 44, 10, 94, 38, 60, 100]).
f([100, 50, 66, 46, 68, 92, 2, 40, 26, 80, 56, 8, 58, 28, 62, 18, 34, 44, 36, 58, 38, 76, 58, 40, 88, 70, 62, 14, 96, 20, 66, 20, 18, 2]).
f([96, 76, 30, 44, 72, 74]).
f([48, 56, 38, 54, 32, 96, 30, 86, 86, 2, 52, 30, 94, 50, 100, 18, 26, 34, 4, 50, 24, 58, 24, 30, 6, 56, 8, 70, 12, 14, 74, 78, 100, 66, 54, 100, 76, 28, 62, 72, 44, 4, 44, 4, 60, 52]).
f([30, 70, 8, 46, 40, 20, 98, 84, 2, 22, 72, 82, 32, 36, 78, 80, 46, 48, 4, 76, 74, 94, 98, 46, 22, 78, 96, 82, 14, 96, 16, 80, 70, 50, 22, 66, 42, 60, 84, 90, 76, 74, 10, 72, 22, 50]).
f([40, 74, 90, 38, 36, 32, 38, 94, 26, 96, 54, 10, 44, 98, 58, 86, 82, 60, 60, 70, 62, 90, 48, 4, 60, 84, 4, 58, 42, 18]).
f([64, 54, 26, 32]).
f([38, 50, 66, 44, 24, 10, 20, 92, 38, 26, 78, 32, 92, 12]).
f([18, 90, 26, 92, 40, 38, 4, 44, 66, 70, 18, 60, 54, 44, 44, 8, 86, 88, 82, 54, 18, 78, 50, 6, 22, 80, 58, 20, 24, 26, 98]).
f([2, 12, 32, 76, 16, 66, 92, 44, 94, 68, 34, 36, 98, 68, 94]).
f([38, 40, 10]).
f([90, 96, 8, 80, 22, 6, 40, 68, 66, 32, 82, 14, 58, 4, 44, 8, 70, 26, 92, 78, 22, 58, 60, 48, 84, 68, 24, 22, 48, 22, 22, 46, 20, 50, 28, 62, 88, 38, 16, 82, 66, 88, 80, 66]).
f([62, 50, 36, 60, 96, 78, 20, 56, 84, 46, 40, 78, 54, 22, 54, 46, 64, 52, 88, 60, 44, 52, 92, 34, 6, 68, 36, 46, 4, 92, 88, 42, 30, 34, 54, 92, 36, 82, 22, 68, 4, 82, 4]).
f([70, 76, 48, 24, 64, 20, 36, 82, 32, 84, 64, 90, 20, 96, 66, 38, 38, 76, 56, 50, 74, 6, 18, 90, 2, 14, 62, 14, 64, 84, 82, 64, 16, 8, 60, 58, 28, 74]).
f([74, 16, 68, 6, 82, 10, 52, 14, 4, 2, 26, 66]).
f([16, 90, 84, 20, 30, 100, 30, 50, 66, 28, 10, 2, 80, 88, 12, 34]).
f([48, 98, 14, 82, 24, 48, 6, 12, 26, 78, 28, 96, 56, 54, 4, 10, 10, 86, 18, 36, 92, 54, 100, 78, 22, 64, 32, 18, 56, 92, 62, 14, 74, 64, 14, 16, 22, 88, 14, 84]).
f([50, 44, 88, 86, 56, 60, 96, 88, 62, 52, 60, 40]).
f([22, 30, 38, 72, 32, 66, 100, 44, 24, 18, 16, 44, 52, 78, 2, 66, 34, 94, 30, 22, 88]).
:-end_in_pos.
:-begin_in_neg.
f([85, 76, 54, 89, 52, 23, 14, 79, 63, 42, 95, 48, 36, 88, 19, 78, 42, 72, 30, 28, 4, 72, 69, 12, 6, 72, 84, 73, 96, 19, 82, 24, 2, 54, 90, 42, 48, 4, 92]).
f([63, 59, 97, 30, 79, 3, 37, 97, 57, 25, 29, 57, 43, 97, 23, 81, 92, 18, 46, 50, 24, 81, 7, 96, 55, 10, 84, 9, 90, 62, 99, 28, 1, 92, 63, 80, 35, 14]).
f([98, 99, 86, 28, 2, 95, 72, 22, 39, 82, 64, 54, 44, 26, 83, 3, 29, 92, 85, 15, 68, 44, 71, 21, 52, 30, 50, 15, 72]).
f([95, 53]).
f([36, 58, 20, 50, 6, 38, 48, 64, 86, 94, 54, 51, 12, 92, 84, 14, 52, 40, 33, 99]).
f([8, 38, 19, 17, 20, 84, 16, 32, 92, 16]).
f([27, 98, 68, 94, 74, 29, 45, 9, 5, 75, 48, 91, 47, 63, 88, 65, 92, 51, 14, 61, 81, 42, 12, 90, 50]).
f([57, 24, 50, 62, 64, 14, 36]).
f([98, 95]).
f([37, 84, 56, 82, 100, 4]).
f([14, 46, 10, 56, 63, 50, 76, 32, 18, 78, 62, 66, 10, 18, 22, 58, 98, 76, 36]).
f([63, 23, 21, 1, 57, 4]).
f([74, 76, 50, 55, 6, 4, 76, 22, 5, 17, 93, 4, 87, 73, 62, 68, 56, 98, 58, 96, 4, 72, 87, 32, 77, 95, 50, 25, 76, 64, 12, 91, 90, 22, 24, 13, 46, 80, 62, 87, 4, 49, 21, 91, 39, 41]).
f([70, 41, 28, 14, 78, 10, 6, 74, 86, 58, 10, 28, 8, 26, 16, 98, 88, 80, 24, 96, 18, 100, 30, 58, 78, 88]).
f([69, 28, 82, 3, 20, 68, 90, 72, 55, 89, 71]).
f([83, 37, 91, 85, 56, 82, 73, 73, 59, 76, 45, 14, 37, 75, 86, 32, 81, 97, 78, 82, 41, 91, 69, 88, 8, 91, 79, 35, 69, 73, 25, 43, 31, 40, 20, 96, 43, 28, 100, 25, 59, 23, 55, 33, 32, 24, 1, 22, 49]).
f([84, 32, 53, 87, 60, 60, 76, 80, 77, 84, 38, 70, 26, 30, 58, 98, 77, 15, 4, 84, 81, 74, 22, 71, 91, 55, 27, 27, 40, 69, 93, 56]).
f([24, 97, 93, 35, 29, 89, 43, 41, 94, 9, 83, 23, 78, 76, 88, 57, 53, 100, 81, 33, 17, 13, 59, 45, 33, 49, 9, 67, 71, 5, 57]).
f([1, 70, 93, 2, 2, 79, 71, 23, 51, 77, 79, 6, 19, 31, 44, 60, 16, 26, 37, 50, 30, 84, 60, 85, 31, 96, 90, 73, 73, 43, 78, 23]).
f([33, 93, 77, 64, 97, 88, 61, 68, 89, 33, 46, 5, 42, 17, 11, 59, 65, 25, 83, 74, 51, 5, 15, 1, 53, 81, 3, 52, 3, 58]).
:-end_in_neg.
