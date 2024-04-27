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
f([75, 50, 28, 24, 51, 9, 90, 88, 59, 61, 39, 64, 41, 87, 26, 86, 4, 94, 11, 6],[6, 11, 94, 4, 86, 26, 87, 41, 64, 39, 61, 59, 88, 90, 9, 51, 24, 28, 50, 75]).
f([15, 12, 98, 99, 56, 32, 27, 91, 3, 1, 70, 5, 18, 11, 1, 50, 25, 37, 98, 35, 49, 94, 38, 34, 33, 24, 88, 75, 41, 86, 31],[31, 86, 41, 75, 88, 24, 33, 34, 38, 94, 49, 35, 98, 37, 25, 50, 1, 11, 18, 5, 70, 1, 3, 91, 27, 32, 56, 99, 98, 12, 15]).
f([36, 76, 27, 49, 92, 51, 44, 40, 14, 38, 99, 99, 88, 90, 17, 95, 64, 84, 31, 72, 91, 62],[62, 91, 72, 31, 84, 64, 95, 17, 90, 88, 99, 99, 38, 14, 40, 44, 51, 92, 49, 27, 76, 36]).
f([70, 85, 5, 101],[101, 5, 85, 70]).
f([79, 79, 17, 86, 39, 63, 58],[58, 63, 39, 86, 17, 79, 79]).
f([32, 17, 58, 30, 92, 90, 100, 57, 48, 32, 41, 4, 96, 30, 42, 18, 93, 35, 46, 74, 75, 65, 83, 81, 86, 26, 11, 79, 28, 19, 79, 48, 6, 81, 47],[47, 81, 6, 48, 79, 19, 28, 79, 11, 26, 86, 81, 83, 65, 75, 74, 46, 35, 93, 18, 42, 30, 96, 4, 41, 32, 48, 57, 100, 90, 92, 30, 58, 17, 32]).
f([61, 78, 29, 84, 56, 94, 80, 73, 30, 51, 75, 44, 82, 35, 22, 93],[93, 22, 35, 82, 44, 75, 51, 30, 73, 80, 94, 56, 84, 29, 78, 61]).
f([32, 91, 74, 33, 42, 84, 25, 49, 33, 95, 20, 34, 12, 7, 14, 72, 79, 17, 83, 52, 45, 91, 24, 71, 13, 35, 16, 4, 92, 76, 97, 11, 91, 90, 37, 27, 72, 20, 88],[88, 20, 72, 27, 37, 90, 91, 11, 97, 76, 92, 4, 16, 35, 13, 71, 24, 91, 45, 52, 83, 17, 79, 72, 14, 7, 12, 34, 20, 95, 33, 49, 25, 84, 42, 33, 74, 91, 32]).
f([72, 24, 14, 60, 79, 44, 93, 20, 92, 7, 19, 86, 61, 48, 35, 49, 80, 59, 37, 76, 64],[64, 76, 37, 59, 80, 49, 35, 48, 61, 86, 19, 7, 92, 20, 93, 44, 79, 60, 14, 24, 72]).
f([88, 101, 79, 70, 70, 93, 73, 13, 31, 52, 10, 99, 4, 83, 63, 68, 18, 71, 17, 29, 20, 42, 67, 91, 54, 55, 24, 34, 11, 8, 5, 2, 23, 45],[45, 23, 2, 5, 8, 11, 34, 24, 55, 54, 91, 67, 42, 20, 29, 17, 71, 18, 68, 63, 83, 4, 99, 10, 52, 31, 13, 73, 93, 70, 70, 79, 101, 88]).
f([81, 1, 21, 9, 67, 80, 75, 50, 41, 23, 62, 68, 21, 28, 32, 95, 24, 19, 70, 91, 32, 85, 58, 74, 57, 73, 4, 48, 53, 64, 68, 29],[29, 68, 64, 53, 48, 4, 73, 57, 74, 58, 85, 32, 91, 70, 19, 24, 95, 32, 28, 21, 68, 62, 23, 41, 50, 75, 80, 67, 9, 21, 1, 81]).
f([68, 99, 54, 52, 93, 17, 78, 39, 7, 55, 10, 19, 55, 68, 66, 24, 8, 17, 50, 34, 39, 26, 22, 78, 18, 17, 69, 83, 74, 91, 66, 17, 24, 88, 98, 6, 45, 35, 14, 4, 62, 56, 52, 50, 83, 100, 78, 53, 55],[55, 53, 78, 100, 83, 50, 52, 56, 62, 4, 14, 35, 45, 6, 98, 88, 24, 17, 66, 91, 74, 83, 69, 17, 18, 78, 22, 26, 39, 34, 50, 17, 8, 24, 66, 68, 55, 19, 10, 55, 7, 39, 78, 17, 93, 52, 54, 99, 68]).
f([78, 12, 36, 56, 96],[96, 56, 36, 12, 78]).
f([29, 33, 2, 18, 85, 5, 98, 5, 9, 73, 22, 52, 67, 33, 43, 60, 30, 82, 33, 47],[47, 33, 82, 30, 60, 43, 33, 67, 52, 22, 73, 9, 5, 98, 5, 85, 18, 2, 33, 29]).
f([36, 11, 76, 9, 100, 55, 20, 47, 62, 96, 57, 10, 3, 83, 25, 9, 49, 33, 2, 76, 84, 55, 90, 45, 40, 45, 18, 86, 39, 95, 88, 57, 56, 65, 55, 23, 38, 95, 32],[32, 95, 38, 23, 55, 65, 56, 57, 88, 95, 39, 86, 18, 45, 40, 45, 90, 55, 84, 76, 2, 33, 49, 9, 25, 83, 3, 10, 57, 96, 62, 47, 20, 55, 100, 9, 76, 11, 36]).
f([26, 73, 56, 48, 14, 90, 99, 8, 42, 75, 18, 56, 98, 18, 48, 71, 3, 78, 40, 61, 92, 68, 58, 67, 97, 59, 15, 34, 90, 79, 68, 82, 96, 81, 51, 86, 67, 60, 1, 65, 26],[26, 65, 1, 60, 67, 86, 51, 81, 96, 82, 68, 79, 90, 34, 15, 59, 97, 67, 58, 68, 92, 61, 40, 78, 3, 71, 48, 18, 98, 56, 18, 75, 42, 8, 99, 90, 14, 48, 56, 73, 26]).
f([37, 67, 3, 42, 81, 12, 7, 58, 77, 22, 51, 80, 28, 20, 98, 91, 80, 101, 63, 40, 62, 51, 12, 83, 85, 45, 77],[77, 45, 85, 83, 12, 51, 62, 40, 63, 101, 80, 91, 98, 20, 28, 80, 51, 22, 77, 58, 7, 12, 81, 42, 3, 67, 37]).
f([94, 77, 84, 11, 101, 81, 60, 84, 76, 14, 26, 27, 56, 7, 91, 9, 54, 89, 33, 70, 8, 60, 16, 62, 63, 62, 5, 32, 93, 39, 99, 98, 60, 47, 76, 40, 2, 25, 29, 76, 32, 88, 62, 20, 33, 79, 86, 3],[3, 86, 79, 33, 20, 62, 88, 32, 76, 29, 25, 2, 40, 76, 47, 60, 98, 99, 39, 93, 32, 5, 62, 63, 62, 16, 60, 8, 70, 33, 89, 54, 9, 91, 7, 56, 27, 26, 14, 76, 84, 60, 81, 101, 11, 84, 77, 94]).
f([69, 84, 53, 31, 55, 66, 62, 15, 78, 63, 60, 33, 92, 60, 78, 38, 59, 16, 25, 72, 82, 52, 13, 1, 12, 46, 64, 39, 2, 13, 41, 36, 73, 39, 8, 100, 29, 7, 29, 96, 99, 3, 56, 49, 10, 3],[3, 10, 49, 56, 3, 99, 96, 29, 7, 29, 100, 8, 39, 73, 36, 41, 13, 2, 39, 64, 46, 12, 1, 13, 52, 82, 72, 25, 16, 59, 38, 78, 60, 92, 33, 60, 63, 78, 15, 62, 66, 55, 31, 53, 84, 69]).
f([100, 9, 10, 47, 33, 96, 38, 44, 36, 61, 58, 22, 71, 15, 42, 64, 78, 64, 67, 9, 83, 73, 84, 93, 100, 69, 13, 33, 19, 10, 69, 29, 11, 52, 76, 75],[75, 76, 52, 11, 29, 69, 10, 19, 33, 13, 69, 100, 93, 84, 73, 83, 9, 67, 64, 78, 64, 42, 15, 71, 22, 58, 61, 36, 44, 38, 96, 33, 47, 10, 9, 100]).
:-end_in_pos.
:-begin_in_neg.
f([61, 11, 27, 60, 17, 101, 65, 7, 19, 32, 7, 77, 67, 81, 73, 55, 52, 10, 27, 49, 7, 89, 97, 16, 18, 48, 38, 31, 32, 23, 4, 81, 37],[55, 10, 18, 73, 48, 7, 49, 11, 7, 16, 27, 17, 23, 27, 38, 67, 19, 65, 81, 77, 31, 7, 61, 32, 32, 37, 101, 81, 89, 60, 97, 52, 4]).
f([101, 44, 66, 9, 51, 81, 22, 17, 28, 9, 22, 90, 42, 51, 50, 19, 48, 7, 53, 81, 29, 4, 74, 85, 96, 3, 19, 36, 82, 36, 77, 59, 84, 5, 19, 45, 12, 1, 32, 2, 25, 86, 59, 71, 74, 28, 9, 70, 40],[48, 5, 59, 1, 77, 70, 2, 66, 36, 42, 90, 84, 9, 101, 85, 86, 17, 53, 59, 19, 51, 44, 82, 25, 22, 22, 7, 51, 40, 45, 9, 3, 4, 28, 29, 36, 19, 12, 50, 96, 19, 74, 81, 32, 28, 81, 74, 9, 71]).
f([17, 93, 19, 30, 23, 63, 34, 68, 1, 46, 86, 38, 45, 13, 1],[68, 38, 63, 23, 45, 30, 34, 17, 19, 1, 13, 86, 46, 1, 93]).
f([96, 68, 36, 94, 46, 71, 14, 74, 17, 55, 1, 76, 101, 94, 13, 63, 70, 60, 41, 43, 17, 92, 101, 100, 91, 36, 23, 37, 52, 58, 7, 58, 77, 7, 35, 76, 54],[52, 1, 92, 7, 60, 58, 54, 46, 41, 13, 77, 36, 76, 7, 37, 58, 100, 74, 17, 68, 101, 14, 35, 43, 17, 101, 96, 76, 36, 63, 91, 70, 71, 23, 55, 94, 94]).
f([28, 50, 39, 8, 49, 92, 79, 6, 95, 43, 5, 26, 72, 1, 1, 39, 69, 35, 88, 70, 25, 51, 47, 85, 47, 69, 1, 14, 9, 68, 10, 21, 77],[69, 43, 35, 69, 25, 79, 28, 39, 77, 88, 5, 70, 6, 92, 51, 1, 10, 95, 39, 26, 21, 1, 47, 72, 49, 68, 9, 50, 8, 1, 47, 14, 85]).
f([87, 35, 12, 27, 51, 43, 21, 22, 6, 13, 61, 79, 99, 76, 89, 76, 55],[27, 22, 21, 12, 43, 55, 99, 6, 79, 87, 35, 61, 76, 89, 13, 76, 51]).
f([43, 70, 13, 10, 99, 2, 46, 34, 84, 101, 18, 76, 95, 40, 70, 45, 7, 7, 91],[2, 7, 45, 46, 13, 34, 99, 95, 101, 70, 10, 18, 7, 70, 84, 40, 91, 76, 43]).
f([67, 99, 74, 13, 42, 55, 40, 82, 33, 33, 59],[33, 33, 55, 82, 74, 59, 99, 67, 42, 13, 40]).
f([54, 17, 42, 83, 15, 38, 24, 39, 32, 35, 81, 1, 76, 32, 65, 29, 26, 2, 78, 58, 64, 50, 19],[26, 35, 32, 42, 19, 64, 2, 38, 1, 50, 78, 15, 24, 39, 81, 17, 32, 83, 76, 65, 29, 58, 54]).
f([25, 31, 43, 50, 12, 16, 96, 5, 38, 77, 54, 79, 90, 56, 91, 43, 52, 48, 50, 94, 27, 79, 90, 44, 17, 29, 59, 76, 46, 50, 14],[16, 43, 59, 90, 50, 77, 91, 56, 94, 44, 31, 17, 38, 27, 14, 43, 79, 96, 25, 29, 76, 48, 54, 79, 50, 90, 52, 50, 5, 46, 12]).
f([17, 36, 85, 4, 75, 33],[36, 17, 33, 75, 85, 4]).
f([3, 43, 5, 4, 80, 96, 65, 3, 56, 25, 4, 34, 95, 21, 47, 45, 68, 66, 16, 88, 65, 78, 56, 75, 28, 43, 5, 82, 28, 22, 6, 56, 98, 53, 19, 59, 75, 45, 91, 68, 63, 78, 40, 91, 90, 91, 18],[3, 96, 75, 91, 25, 56, 68, 21, 66, 19, 90, 16, 3, 43, 56, 91, 68, 18, 34, 88, 4, 22, 91, 78, 65, 47, 75, 56, 5, 80, 6, 43, 53, 65, 95, 82, 45, 78, 28, 63, 59, 40, 98, 45, 28, 5, 4]).
f([71, 4, 45, 56, 100, 39, 1],[1, 71, 100, 4, 39, 45, 56]).
f([27, 20, 41, 9, 65, 45, 67, 9, 81, 34, 54, 94, 34, 54, 82, 77, 73, 40, 30, 65, 30, 41, 40, 86],[54, 94, 65, 40, 20, 82, 65, 27, 41, 77, 9, 34, 41, 30, 67, 30, 81, 34, 73, 54, 40, 45, 9, 86]).
f([6, 85, 64, 77, 60, 54, 6, 86, 3, 74, 3, 54, 85, 63, 35, 1, 87, 75, 1, 63, 77, 42, 75, 62, 47, 43, 96, 13],[87, 75, 75, 42, 47, 85, 6, 1, 13, 35, 3, 43, 96, 85, 74, 63, 54, 6, 63, 64, 86, 62, 1, 77, 3, 77, 60, 54]).
f([84, 13, 80, 87, 53, 60, 21, 30, 17, 41, 58, 37, 11, 11, 21, 68, 1, 95, 54, 66, 17, 48, 87, 21, 19, 50, 83, 11, 15, 13, 19, 34, 66],[53, 1, 21, 11, 13, 21, 68, 80, 21, 30, 15, 13, 60, 95, 37, 11, 84, 17, 19, 17, 41, 66, 83, 34, 87, 48, 87, 19, 58, 11, 54, 66, 50]).
f([13, 88, 6, 91, 97, 63, 84, 26, 46, 46, 55, 77, 38, 29, 35, 86, 72, 95, 70, 54, 75, 29, 36, 32, 72, 45, 87, 101, 15, 46, 64, 75, 80],[87, 84, 86, 38, 70, 77, 29, 55, 26, 29, 45, 63, 13, 6, 75, 15, 97, 88, 32, 80, 72, 95, 46, 36, 46, 54, 46, 64, 35, 75, 72, 101, 91]).
f([76, 23, 58, 101, 17, 7, 32, 77, 23, 69, 27, 14, 73, 64, 72, 65, 98, 61, 40, 83, 8, 33, 59, 48, 10, 75, 60, 6, 74, 16, 61],[27, 61, 101, 17, 61, 23, 40, 58, 64, 73, 65, 60, 77, 33, 48, 83, 23, 69, 10, 98, 32, 6, 14, 7, 59, 75, 8, 74, 76, 72, 16]).
f([65, 48, 61, 56, 33, 74, 49, 31, 15, 82, 44, 65, 26, 30, 43, 30, 91, 21, 58, 15, 66, 77, 32, 22, 58, 18, 80, 4, 1, 41, 18, 83, 37, 31, 98, 17, 78, 91, 46, 1, 81, 87, 42, 56, 43],[43, 43, 78, 58, 56, 31, 98, 18, 65, 44, 66, 77, 15, 17, 15, 33, 26, 65, 83, 81, 30, 91, 18, 42, 46, 87, 41, 48, 32, 21, 22, 30, 1, 37, 1, 82, 4, 91, 56, 31, 74, 80, 61, 49, 58]).
f([22, 57, 4, 97, 56, 53, 55, 77, 81, 66, 81],[53, 97, 81, 55, 57, 22, 56, 4, 66, 81, 77]).
:-end_in_neg.