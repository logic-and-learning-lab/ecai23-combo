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
:- modeb(*,cons(+element,+list,-list)).

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
f([64, 42, 42, 52, 7, 56, 30, 84, 101, 8, 22, 27, 9, 42, 27],42).
f([78, 26, 22, 17, 65, 100, 21, 29, 22, 82, 67, 13, 83, 34, 33, 7, 78, 90, 11, 88, 7],78).
f([78, 60, 72, 51, 81, 72, 10, 64, 37, 75, 56, 12, 79, 43, 51, 80, 51, 15, 25, 11, 77, 90, 42, 67, 12, 83, 56, 84, 19, 84, 6, 70, 51, 8, 33, 29, 12, 87, 15, 67, 25, 45, 48, 46, 4, 73, 31, 4, 39, 94, 93, 78],12).
f([80, 86, 46, 33, 98, 87, 8, 23, 54, 51, 86, 80, 27, 39, 44, 99, 88, 73, 68, 8, 13, 22, 82, 13, 21, 47, 36, 61, 34, 25, 67],8).
f([51, 82, 13, 27, 72, 71, 58, 27, 58, 2, 42, 87, 44, 63, 11, 34, 63, 99, 68, 2, 67, 1, 81, 58, 15, 91, 30, 33, 4, 56, 56, 22, 99, 13, 35, 75, 67, 48, 69, 55, 7, 89, 95, 30, 78, 45, 80, 91, 90, 40, 58],63).
f([35, 44, 44, 60, 51, 59, 26, 66, 31, 87, 14, 35, 94, 90, 94],44).
f([76, 15, 94, 88, 86, 80, 40, 6, 62, 76, 54, 45, 40, 53, 74, 23, 6, 69, 7, 25, 56, 91, 1, 15, 7, 10, 6, 48, 96, 9],6).
f([6, 41, 15, 85, 56, 37, 58, 75, 62, 40, 1, 74, 77, 30, 8, 87, 77, 75, 70, 69, 95, 61, 74, 18, 21, 56, 69, 97, 81, 99, 87, 55, 52, 69, 58, 88, 79, 77, 6, 95, 15, 99, 39, 9, 27, 58, 62, 82, 83, 67, 81],77).
f([71, 33, 47, 52, 39, 89, 51, 10, 21, 88, 17, 96, 35, 82, 34, 86, 99, 96, 93, 49, 2, 98, 41, 90, 37, 6, 68, 8, 60, 1, 64, 4, 54, 84, 15, 73, 86, 82, 79, 26, 50, 44, 18, 27, 44, 9, 73, 78, 101],86).
f([56, 73, 47, 13, 3, 49, 70, 52, 18, 76, 5, 89, 1, 87, 82, 18, 77, 70, 74, 47, 77, 2, 5, 53, 72, 38, 2, 83, 5, 83, 80, 101, 45, 55, 65, 7, 31, 85, 32, 99, 25, 47, 16, 38, 92, 1, 39, 49, 16, 49, 4, 74],47).
f([2, 16, 17, 64, 64, 37, 28, 18, 97, 101, 69, 62, 47, 46, 19, 95, 38, 59, 80, 43, 51, 11, 70, 8, 48, 12, 51, 55, 39, 55, 78, 17, 18, 72, 52, 35, 91, 54, 51, 33, 78, 79, 48, 21, 72, 88, 4, 66, 75, 14],51).
f([100, 29, 90, 55, 49, 5, 8, 49, 74, 95, 101, 99, 74],74).
f([71, 46, 79, 67, 70, 1, 68, 87, 88, 96, 25, 18, 58, 20, 25],25).
f([77, 50, 66, 66, 58],66).
f([80, 77, 50, 62, 86, 23, 44, 88, 40, 71, 5, 44, 75, 47, 4, 60, 37, 58, 96, 21, 51, 74, 95, 76, 71, 54, 83, 44, 44],44).
f([9, 10, 5, 3, 9, 75, 93, 22, 90, 80, 24, 6, 71, 80, 13, 65, 80, 38, 36, 34, 39, 58, 47, 69, 33, 98, 92],80).
f([63, 99, 20, 99, 51, 79, 30, 82, 31, 11, 69, 40, 27, 11, 22, 36, 74, 36, 58, 30, 48, 77],30).
f([98, 37, 51, 6, 95, 45, 92, 52, 84, 55, 10, 48, 52, 84],52).
f([11, 71, 82, 11],11).
f([81, 69, 67, 31, 63, 52, 14, 23, 62, 62, 38, 83, 10, 101, 6, 94, 9, 16, 27, 40, 62, 75, 96, 62, 51, 97, 67, 67, 41, 81, 77, 2, 79, 99, 85, 39, 68, 93, 64, 54, 41, 29, 68, 99, 29, 50, 62, 96],81).
:-end_in_pos.
:-begin_in_neg.
f([2, 95, 86, 40, 21, 60, 35, 17, 81, 35, 23, 10, 100, 18, 15, 12, 13, 5, 38, 99, 50, 100, 30, 65, 10, 35, 21, 100, 57, 40, 41, 55, 1, 8, 100, 33, 80, 26, 24, 64, 1, 75, 36, 44, 80, 87],18).
f([30, 91, 33, 25, 23, 39, 64, 54, 13, 52, 18, 5, 61, 94, 27, 37, 28, 56, 46, 2, 82, 1, 99, 38, 71, 72, 29, 97, 44, 71, 5, 11, 82, 91, 77, 68, 98, 52, 27, 45, 27, 31, 6],97).
f([72, 92, 30, 85, 22, 14],22).
f([8, 16, 83, 100, 31, 32, 67, 55, 85, 14, 15, 84, 41, 43, 73, 19, 53, 32, 94, 54, 19, 72, 26, 2, 69, 38, 65, 100, 26, 98, 73, 83, 88, 86],41).
f([5, 13, 100, 77, 11, 35, 67, 91, 46, 45, 70, 75, 22, 28, 58, 26, 79, 68, 13, 88, 21, 58, 61, 30, 27, 63, 35, 65, 43, 96, 54, 24],11).
f([77, 25, 32, 98, 99, 60, 5, 76, 6, 73, 94, 29, 16, 91, 64, 71, 72, 46, 69, 7, 10, 22, 88, 7, 4, 13, 63, 28, 18, 82, 80, 84, 12, 98, 72, 10, 65, 95, 34, 17, 51, 56, 17, 6, 92, 76, 35, 57, 84],91).
f([10, 81, 2, 59, 4, 51, 45, 65, 52, 12, 52, 42, 11, 76, 1, 38, 62, 73, 25, 71, 81, 100, 89, 19, 50, 49, 10, 46, 51, 7, 22, 5, 87, 18, 33, 53, 98, 77, 20, 7, 92, 91, 55, 97],65).
f([20, 58, 79, 25, 50, 63, 94, 47, 97, 70, 71, 93, 54, 93, 15, 33, 12, 88, 34, 91, 85, 16, 54],63).
f([44, 48, 35, 91, 44],48).
f([63, 20, 79, 71, 58, 43, 59, 95, 86, 96, 47, 29, 75, 22, 76],43).
f([50, 85, 87, 11, 83, 53, 6, 77, 76, 61, 18, 4, 79, 8, 86, 26, 87, 29, 74, 40, 99, 51, 8, 101, 85, 78, 5, 81, 90, 38, 70, 26, 82, 79, 8, 78, 13, 40],4).
f([85, 28, 39, 25, 72, 35, 95, 87, 18, 100, 52, 17, 22, 72, 22, 65, 41, 22, 24, 56, 38, 43, 9, 70],39).
f([2, 67, 58, 16, 89, 47, 17, 73, 2, 31, 94, 93, 14, 79, 9, 54, 7, 21, 70, 20, 93, 50, 51],14).
f([80, 54, 38, 99, 97, 45, 41, 15, 39, 27, 78, 71, 38, 64, 80, 81, 12, 93, 84, 49, 31, 19, 98, 78, 51, 78, 68],51).
f([1, 10, 83, 7, 33, 5, 63, 59, 7, 6, 29, 89, 47, 20, 76, 18, 95, 96, 6, 62, 53, 82, 99, 14, 18, 79, 50, 11, 5, 20, 101, 65, 62, 47, 85, 18, 1, 54],59).
f([32, 61, 20, 97, 77, 16, 3, 23, 73, 37, 71, 75, 46, 11, 42, 62, 13, 37, 37, 18, 3, 1, 41, 79, 79, 30, 18, 33, 97, 71, 14, 13, 31, 37, 65, 27, 78, 18, 29, 96, 74, 28, 52, 37, 60, 49, 11],42).
f([45, 59, 41, 6, 50, 5, 54, 40, 32, 72, 9, 12, 4, 23, 2, 67, 63, 5, 75, 69, 1, 10, 90, 18, 34, 60, 93, 69, 31, 72, 87],40).
f([48, 17, 21, 91, 95, 32, 78, 44, 37, 82, 71, 14, 65, 83, 101, 32, 50, 92, 87, 36, 54, 31, 26, 22, 50, 39, 18, 36, 60, 69, 1, 70, 12, 98, 37, 80, 16, 23, 50, 22, 14, 38, 86, 69, 17, 88, 54, 70, 21, 73],26).
f([82, 16, 48, 23, 59, 33, 64, 87, 16, 83, 13, 3, 75, 22, 36, 10, 35, 82, 30, 87, 33, 23, 10, 10, 101, 3, 80, 41, 68, 36, 48, 25, 100, 54, 8, 47, 6, 99],13).
f([1, 46, 88, 61, 74, 33, 96, 65, 53, 93, 5, 13, 47, 14, 5, 28, 62, 42, 33, 25, 27, 7, 27, 39, 95, 94, 37, 30, 29, 83, 52, 1, 91, 19, 17],61).
:-end_in_neg.
