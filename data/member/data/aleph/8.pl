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
f([7, 13, 36, 98, 50, 72, 61, 74, 38, 68, 12, 60, 43, 90, 60, 77, 88, 87, 31, 78, 16, 6, 81, 35, 4, 16, 54, 66, 29, 5, 86, 93, 4, 26, 71, 88, 60, 88, 89, 14, 34],7).
f([10],10).
f([63, 90, 79, 46, 99, 51, 13, 31, 90, 24, 95, 12, 46, 43, 44, 3, 6, 40, 18, 14, 71, 89, 78, 41, 84, 37, 73, 19, 35, 101, 53],63).
f([84, 64, 76, 88, 63, 3, 5, 73, 21, 55, 78, 15, 75, 49, 90, 28, 25, 25, 3, 51, 68, 94, 12, 31, 14, 10, 80, 64, 54, 11, 5, 9, 55, 59, 99, 10, 14, 97, 26, 78],49).
f([48, 81, 78, 26, 31, 79, 23, 18, 86, 6, 10, 15, 69, 33, 86, 54, 49, 72, 98, 100, 41, 70, 54, 38, 20, 40, 27, 99, 78],79).
f([98, 81, 100, 46, 84, 1, 16, 10, 14, 43, 43, 81, 58, 43, 91, 92, 47, 12, 36, 88, 36, 79, 64, 81, 74, 95, 93, 32, 80],36).
f([85, 9, 18, 83, 56, 6, 5, 52, 16, 9, 19, 30, 18, 85, 39, 75, 84, 69, 29, 63, 49, 59, 64, 67, 79, 14, 25],84).
f([84, 83, 99, 56, 70, 30, 69, 83, 58, 45, 60, 35, 59, 100, 2, 56, 26, 17, 100, 34],60).
f([90, 7, 10, 79, 85, 44, 11, 50, 95, 67, 19, 75, 94, 71, 94, 1, 49, 20, 8, 79, 99, 80, 46, 73, 80, 80, 23, 82, 34, 83, 25, 12, 50, 35, 88, 56, 28, 32, 36, 77, 88, 24, 19, 13, 77],28).
f([65, 59, 59, 77, 76, 11, 28, 99, 44, 67, 9, 76, 63, 92, 53, 3, 36, 95, 52, 86, 76, 16, 84, 14, 71, 98],65).
f([49, 67, 92, 41, 2, 19, 64, 92, 96, 3, 55],92).
f([55, 78, 98, 1, 12, 73, 35, 62, 55, 34, 23, 43, 65, 93, 29, 16, 13, 98],12).
f([18, 80, 86, 62, 2, 14, 54, 30, 25, 70, 51, 84, 88, 64],51).
f([97, 68, 98, 9, 72, 67, 77, 62, 14, 45, 91, 79, 61, 45, 38, 18, 50, 26, 42, 55, 36, 90, 32, 96, 89, 75, 56, 20, 90, 40, 91, 10, 94, 81, 71, 32, 12, 87, 90, 75, 13, 71, 22, 18],12).
f([6, 27, 38, 6, 87],6).
f([96, 41, 75, 34, 21, 19, 36, 57, 62, 28, 101, 19, 101, 100, 7, 67, 53, 67, 29, 6, 41, 75, 71, 49, 63, 70, 5, 91, 1, 24, 17],28).
f([10, 74, 94, 36, 92, 82, 44, 34, 19, 32, 61, 67, 70, 45, 9, 23, 71, 86, 88, 44, 10, 56, 27, 82, 61, 93, 94, 11, 25, 86, 67, 85, 70, 17, 94, 63, 43, 37, 100, 19, 15, 12, 2, 38, 78],36).
f([48, 39, 45, 98, 96, 62, 73, 15, 23, 65, 34, 94, 11, 30, 82, 64, 90, 44, 45, 53, 60, 96, 100, 84, 55, 46, 42, 85, 98, 25, 100, 57, 39, 58, 19, 37, 7, 49, 65, 59, 19, 40, 61, 53, 61, 20, 7],40).
f([37, 17, 37],37).
f([18, 56, 19, 37, 66, 34, 5, 99, 19, 58, 31, 18, 4, 18, 31, 78, 75, 98, 85],4).
:-end_in_pos.
:-begin_in_neg.
f([45, 54, 78, 58, 18, 24, 33, 50, 71, 93, 34, 77, 52, 2, 7, 62, 80, 22, 17, 62, 79, 93, 5, 38, 77, 15, 17],47).
f([11, 7, 89, 25, 17, 67, 57, 90, 72, 1, 84, 63, 71, 22, 30, 41, 13, 72, 64, 84, 3, 44, 56, 50, 40, 11, 32, 88, 45, 8, 67, 25, 10, 28, 20, 46, 49],53).
f([81, 2, 96, 100, 64, 7, 56, 34, 52, 75, 39, 3, 41, 68, 90, 53, 24, 78, 85, 49, 21, 91, 63, 23, 81, 28, 12, 30, 18, 81],25).
f([92, 16, 11, 87, 24, 19, 53, 37, 49, 38, 44, 43, 37, 60, 86, 49, 10, 10, 11, 85, 82, 69, 78, 8, 48, 38, 46, 53, 22, 74, 60],13).
f([79, 88, 93, 58, 94, 71, 31, 72, 50],20).
f([101, 55, 81, 76, 54, 94, 37, 38, 38, 22, 71, 43, 84, 57, 67, 6, 77, 7, 38, 91, 40, 10, 40, 20, 27, 53, 57, 86, 90, 25, 55, 39, 2, 98, 34, 24, 75, 61, 92],26).
f([61, 14, 57, 62, 101, 39, 9, 15, 81, 49, 50, 79, 90, 20, 63, 28, 59, 61, 62, 52, 56, 13, 92, 10, 35, 1, 56, 13, 24, 69, 94, 98, 50, 26, 94, 48, 53, 95],99).
f([58, 41, 20, 16, 19, 34, 24, 21, 17, 60, 87, 29, 61, 16, 40, 28, 49, 60, 94, 33, 56, 20, 49, 24, 69, 80, 98, 83, 58, 67, 18, 41, 101, 3, 82, 78, 36, 87],47).
f([71, 3, 22, 63, 14, 32, 55, 101],60).
f([68, 9, 75, 5, 82, 64, 94, 101, 67, 8, 32, 55, 92, 29, 90, 98, 83, 72, 7, 22, 18, 79, 53, 98, 23, 100, 90, 82],66).
f([3, 34, 73, 57, 19, 29, 34, 52, 29, 87, 47, 59, 50, 1, 33, 80, 62, 44, 60],30).
f([20, 98, 59, 64, 46, 32, 15, 77, 56, 1, 15, 71, 84, 52, 67, 98, 29, 88, 14, 34, 75, 49, 94, 11, 13, 83, 50, 48, 79, 24, 51, 44],87).
f([63, 38, 20],98).
f([10, 47, 95, 27, 68, 91, 71, 19, 81, 9, 59, 12, 76, 69, 101, 28, 82, 89, 57, 56, 42, 100, 3, 11, 70, 75, 71, 86, 95, 10, 25, 73, 71, 33, 44, 55],8).
f([41, 41, 47, 70, 32, 66, 24, 51, 11, 54, 51, 53, 21, 35, 3, 29, 42, 12, 62, 94, 57, 71, 87, 68, 11, 100, 82, 27, 64, 25, 29, 93, 50, 72, 60, 73, 84, 92, 42],52).
f([33, 90, 2, 55, 39, 59, 23, 59, 81, 81, 77, 65, 37, 76, 52, 98, 52, 84, 29, 34, 52, 96, 48, 101, 1, 17, 81, 35, 40, 18, 85, 43, 4, 40, 85, 98, 14, 18],13).
f([2, 95, 21, 9, 2, 34, 16, 98, 94, 18, 36, 20, 13, 29, 59, 9, 9, 51, 67, 8, 86, 46, 15, 94, 72, 84, 39, 86],88).
f([71, 91, 18, 28, 64, 2, 53, 5, 81, 29, 29],9).
f([61, 76, 52, 39, 58, 6, 91, 69, 70, 35, 58, 73, 100, 84, 94, 19, 64, 25, 77, 65, 99],95).
f([52, 49, 100, 53, 13, 11, 55, 22, 15, 88, 27, 80, 65, 19, 48, 41, 18, 85, 91, 96, 37, 90, 15, 89, 60, 80, 29, 31, 75, 90],46).
:-end_in_neg.
