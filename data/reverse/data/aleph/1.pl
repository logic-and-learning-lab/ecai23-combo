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
f([93, 38, 90, 56, 59, 18, 76, 13, 26, 67, 44, 51, 101, 34, 63, 85, 49, 97],[97, 49, 85, 63, 34, 101, 51, 44, 67, 26, 13, 76, 18, 59, 56, 90, 38, 93]).
f([87, 12, 40, 78, 50, 1, 42, 59, 17, 82, 17, 83, 26, 7, 28, 1, 67, 12, 75, 60, 40, 80, 40, 83, 18, 54, 100, 20, 88, 57, 18, 71, 37, 92, 21],[21, 92, 37, 71, 18, 57, 88, 20, 100, 54, 18, 83, 40, 80, 40, 60, 75, 12, 67, 1, 28, 7, 26, 83, 17, 82, 17, 59, 42, 1, 50, 78, 40, 12, 87]).
f([65, 45, 1, 45, 101, 90, 47, 22, 96, 12, 95],[95, 12, 96, 22, 47, 90, 101, 45, 1, 45, 65]).
f([50, 90, 10, 3, 68, 70, 75, 47],[47, 75, 70, 68, 3, 10, 90, 50]).
f([78, 91, 31, 77, 80, 71, 94, 87, 85, 8, 87, 57, 10, 71, 95, 58, 43, 93, 96, 36, 53],[53, 36, 96, 93, 43, 58, 95, 71, 10, 57, 87, 8, 85, 87, 94, 71, 80, 77, 31, 91, 78]).
f([100, 45, 18],[18, 45, 100]).
f([10, 27, 81, 98, 87, 74, 42, 7, 80, 85, 93, 25, 65, 36, 90, 21, 70, 75, 18, 37, 62, 91, 2, 100, 11, 41, 32, 48, 101, 66, 94, 41, 45, 65, 77, 36, 39, 23, 75, 50, 69, 45, 48, 41, 60, 56, 34, 70, 12, 95],[95, 12, 70, 34, 56, 60, 41, 48, 45, 69, 50, 75, 23, 39, 36, 77, 65, 45, 41, 94, 66, 101, 48, 32, 41, 11, 100, 2, 91, 62, 37, 18, 75, 70, 21, 90, 36, 65, 25, 93, 85, 80, 7, 42, 74, 87, 98, 81, 27, 10]).
f([25, 75, 84, 55, 98, 37, 35, 66, 50, 92, 41],[41, 92, 50, 66, 35, 37, 98, 55, 84, 75, 25]).
f([56, 88, 73],[73, 88, 56]).
f([99, 1, 62, 22, 15, 68, 19, 88, 98, 82],[82, 98, 88, 19, 68, 15, 22, 62, 1, 99]).
:-end_in_pos.
:-begin_in_neg.
f([77, 43, 56, 88, 19, 13, 87, 45, 6, 34],[6, 34, 77, 19, 13, 45, 88, 87, 56, 43]).
f([27, 86, 99, 73, 55, 9, 52, 84, 86, 38, 95, 72, 28, 3],[99, 86, 84, 3, 28, 86, 72, 55, 9, 73, 27, 38, 95, 52]).
f([2, 7, 85, 61, 78, 50, 31, 2, 48, 84, 42, 23, 52, 30, 4, 86, 43, 65, 65, 34, 79, 37, 15, 33, 81, 59, 96, 9, 15, 33, 60, 28, 53, 36, 99, 58, 7, 43, 24, 58, 78, 25, 67, 84, 97],[65, 96, 43, 30, 65, 25, 79, 78, 43, 42, 53, 58, 7, 84, 15, 67, 52, 58, 2, 9, 84, 23, 81, 4, 86, 78, 97, 59, 7, 60, 15, 36, 50, 99, 48, 85, 28, 61, 2, 37, 33, 34, 31, 24, 33]).
f([33, 12, 93, 87, 90, 19, 84, 56, 2, 71, 2, 8, 76, 87, 73, 64, 18, 44, 18, 49, 70, 89, 13, 46, 1, 20, 87, 75, 100, 68, 6, 44, 100, 5, 90, 11, 1, 48, 65, 58, 15, 14, 15, 18, 58, 60],[75, 18, 1, 44, 64, 18, 90, 1, 14, 49, 76, 100, 13, 15, 87, 87, 89, 19, 84, 48, 65, 8, 71, 58, 93, 15, 44, 2, 6, 46, 11, 70, 90, 18, 20, 68, 56, 58, 73, 5, 60, 87, 12, 33, 100, 2]).
f([52, 52, 49, 95, 62, 32, 40, 53, 16, 3, 22, 80, 95],[16, 53, 49, 52, 3, 95, 80, 40, 95, 32, 52, 22, 62]).
f([9, 45, 40, 42, 21, 65, 75, 26, 60, 62, 93, 60, 53, 94, 17, 15, 65, 3, 34, 83, 71, 91, 63, 84, 10, 80, 100, 26, 55, 48, 15, 45, 10, 1, 57, 56, 62, 49],[84, 80, 63, 60, 1, 17, 49, 10, 57, 83, 60, 93, 10, 45, 48, 21, 42, 53, 65, 55, 91, 26, 56, 62, 62, 15, 40, 75, 71, 94, 3, 15, 34, 45, 100, 65, 9, 26]).
f([26, 48, 13, 52, 47, 83, 20, 22, 3, 15, 50, 55, 13, 2, 82, 62, 76, 44, 22, 96, 43, 11, 98, 9, 98, 88, 78, 12, 4, 96, 92, 8, 35, 30, 36, 91, 64, 89, 69, 1],[91, 12, 96, 9, 11, 36, 13, 22, 76, 98, 48, 52, 20, 13, 35, 64, 96, 55, 26, 22, 2, 4, 50, 15, 47, 89, 1, 78, 82, 30, 43, 69, 44, 92, 88, 62, 83, 3, 8, 98]).
f([87, 76, 47, 87, 51, 32, 44, 32, 3, 10, 75, 48, 96, 35, 19, 50, 96, 27, 89, 27, 56, 69, 77, 65, 39, 33, 9, 68, 94, 28, 28, 29, 74, 97, 67, 19, 41, 43, 58, 71, 74, 74, 36, 89, 73, 54, 12, 10, 30, 71, 92],[67, 96, 39, 10, 89, 58, 36, 48, 51, 77, 19, 87, 32, 27, 56, 74, 43, 35, 74, 87, 68, 73, 9, 33, 19, 30, 27, 71, 47, 74, 32, 97, 10, 89, 65, 41, 44, 75, 92, 28, 3, 29, 69, 94, 12, 28, 54, 71, 76, 50, 96]).
f([11, 59, 71, 58, 96, 17, 85, 47, 14],[59, 96, 17, 85, 71, 58, 11, 47, 14]).
f([86, 44, 41],[44, 86, 41]).
:-end_in_neg.