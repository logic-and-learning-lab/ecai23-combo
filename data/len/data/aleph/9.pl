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
f([2, 53, 100, 72, 86, 92, 28, 85, 85, 47, 68, 100, 73, 44, 45, 23, 35, 67, 66, 15, 56, 16, 24, 94, 73, 88],26).
f([13, 31, 5, 41, 20, 15, 11, 36, 5, 78, 16, 41, 59, 83, 34, 18],16).
f([90, 68],2).
f([47, 2, 90, 56, 75, 68, 86, 88, 44, 32, 34, 45, 12, 54, 17, 53, 36, 97, 21, 96, 54],21).
f([34, 46, 30, 97, 25, 44, 73, 35, 58, 96, 17, 27, 12, 69, 4, 47, 45, 23, 65, 53, 27, 87, 98, 10],24).
f([72, 81, 24, 16, 58, 40, 28, 96, 59, 24, 88, 15, 88, 85, 100, 76, 91],17).
f([67, 79, 69, 23, 66, 61, 3, 97, 20, 42, 11, 22, 39, 94, 21, 17, 87, 42, 5, 34, 51, 68, 20, 51, 53, 41, 6, 11, 95, 55, 72, 83],32).
f([92, 101, 82, 82, 73],5).
f([86, 64, 97, 10, 50, 26, 9, 63, 86, 35, 64, 7, 33],13).
f([13, 66, 11, 43, 71, 16, 65, 100, 70, 9, 68, 76, 28, 87, 10, 70, 65, 49, 10, 5, 80, 49, 94, 11, 63, 2, 26, 50, 21],29).
f([100, 10, 18, 14, 39],5).
f([12, 77, 44, 11, 94, 19, 5, 18, 64, 93, 12, 65, 36, 39, 69, 76, 47, 50, 39, 42, 17, 99, 67, 52, 95, 51, 92, 44],28).
f([33, 48, 34, 72, 13, 6, 62, 21, 47, 35, 72, 29, 44, 51, 18, 59, 57],17).
f([73, 81, 66, 8, 33, 76, 31, 2, 81, 72, 4, 21, 59, 16, 70, 22, 85, 78, 67, 31, 8, 96, 86, 25, 34, 75, 9],27).
f([12, 68, 12, 22, 6, 32, 49, 23, 70, 22, 7, 97, 80, 94, 60, 93, 93, 65, 43, 15, 64, 13],22).
f([94, 20, 58, 87, 64, 31, 32, 91, 72, 72, 60, 40, 85, 98, 42, 4, 75, 71, 51, 66, 66, 15, 5, 11, 62, 58, 11, 95, 56, 65, 52, 21, 43, 29, 43, 84, 43, 18, 99, 67, 84],41).
f([46, 74, 20, 13, 10, 46, 81, 45, 59, 47, 101, 76, 46, 63, 64, 52, 79, 1, 27, 1, 75, 37, 99, 91, 96, 99, 98, 65, 76, 70, 77, 41, 21, 69, 66, 48, 86, 9, 13, 57, 38, 83, 4, 40, 9, 96],46).
f([12],1).
f([87, 69, 50, 76, 31, 43, 43, 14, 42, 24, 100, 64, 54, 47],14).
f([51, 45, 38, 47, 14, 42, 74, 50, 67, 9, 87, 10, 88, 8, 89, 96, 58, 84, 65, 65, 38, 26, 94, 97, 80, 37, 98, 28, 35, 58, 77, 32, 67, 73, 47, 40, 11],37).
:-end_in_pos.
:-begin_in_neg.
f([97, 58, 79, 42, 51, 96, 48, 16, 50, 79, 35, 19, 13, 3, 28, 80, 41, 30, 75, 35],40).
f([10, 74, 44, 66, 58, 42, 54, 31, 63, 36, 74, 68, 39, 60, 88, 34, 11, 56, 59, 89, 77, 65, 50, 94, 68, 56, 43, 30, 83, 51, 100, 43, 16, 87, 38, 31, 95, 60, 36, 45, 58, 1, 63, 71, 16],27).
f([8, 45, 21, 63, 2, 92, 101, 100, 80, 1, 48, 3, 94, 46, 84, 68, 93, 54, 61, 56, 5, 80, 95, 40, 16, 57, 18, 63, 29, 47, 16, 74, 95, 11, 5, 54, 39, 88, 24, 97],32).
f([74, 76, 50, 26, 13, 73],48).
f([49, 56, 24, 76, 38, 30, 34, 86, 16, 97, 19, 15, 28, 75, 26, 45, 30, 67, 80, 2],41).
f([40, 93, 30, 7, 88, 1, 74, 17, 29, 24, 81, 75, 45, 59, 83, 9, 30, 25, 69, 46, 26, 68, 69, 76, 76],18).
f([96, 71, 26, 77, 95, 83, 62, 78, 92, 20, 30, 28, 64, 16, 76, 101],89).
f([47, 61, 10, 49, 86, 88],13).
f([12, 29, 90, 28, 79, 74, 12, 62, 19, 75, 21, 29, 50, 95, 97, 84, 72, 14, 1, 92, 12, 24, 16, 59, 46, 76, 32, 57, 83, 2, 33, 79, 11],54).
f([99, 91, 4, 87, 67, 98, 90, 21, 15, 90, 100, 29, 96, 36, 48, 97, 47, 95, 90, 61, 3, 9, 82, 4, 9, 63, 29, 74, 70, 26, 39, 33, 3, 77, 31, 50, 38, 99, 58, 9, 23, 61, 88],100).
f([10, 23, 60, 75, 81, 61, 61, 62, 45, 35, 72, 82, 9, 35, 86, 40, 13, 76, 17, 66, 63, 14, 57, 15, 38, 25, 20, 47, 95, 2, 4, 70, 72, 7, 86, 56, 98, 85, 46, 98, 54, 22],28).
f([100, 14, 11, 20, 7, 19, 24, 47, 12, 21, 87, 92, 81, 95, 51, 78, 8, 88, 9, 47, 31, 23, 79, 64, 56, 50, 91, 88, 2, 26, 21, 73, 74, 60, 33, 4, 83, 48, 44],88).
f([72, 32, 61, 43, 90, 76, 48, 7, 99, 56, 15, 88, 73, 95, 10, 11, 39, 69, 25, 40, 62, 63, 92, 39, 82, 32, 58, 9, 57, 44, 20, 82, 46, 11, 41, 73, 96, 18, 16, 62, 77, 12, 42, 59, 66, 51],77).
f([38, 31, 95, 84, 67, 94, 15, 41, 65, 7, 37, 80, 23, 96, 2, 77],39).
f([36, 48, 14, 44, 94, 63, 7, 83, 59, 77, 21, 15, 91, 67, 10, 98, 86, 65, 45, 30, 31, 12, 23, 11, 22, 43, 47, 24, 27, 18, 38, 98, 26, 92, 73, 4, 49],39).
f([55, 70, 74, 1, 85, 89, 3, 68, 16, 63, 21, 90, 46, 9, 48, 90, 73, 13, 65, 37, 45, 90, 52, 32, 2, 48, 20, 74, 2, 58, 39, 53, 66, 77, 101, 18, 41, 32, 27, 71],55).
f([31, 39, 91, 6, 35, 81, 56, 86, 82, 1, 63, 98, 98, 74, 9],98).
f([91, 64, 42, 52, 1],4).
f([15, 5, 81, 22, 33, 32, 48, 1, 78, 25, 88, 1, 43, 21, 90, 44, 53],2).
f([41, 26, 70, 39, 66, 91, 67, 68, 48, 89, 41, 58, 21, 61, 53, 10, 66, 48, 22, 23, 52, 95, 10, 90, 9, 34, 83, 41, 96, 8, 54, 53, 59],96).
:-end_in_neg.
