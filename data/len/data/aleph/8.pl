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
f([13, 26, 84, 32, 28, 40, 14, 52, 33, 100, 21, 79, 89, 56, 1, 45, 30, 38, 50, 54, 79, 101, 46],23).
f([2, 19, 64, 33, 33, 78, 41, 6, 49, 65, 69, 70, 48, 1, 80, 13, 2],17).
f([12, 9, 20, 53, 24, 7, 95, 83, 48, 79, 64, 54, 59, 77, 62, 99, 88, 37, 97, 45, 67, 33, 95, 51, 62, 94, 55, 92, 14, 47, 16, 67, 5, 81, 37, 57, 21, 48, 49],39).
f([89, 51, 70, 23, 30, 61, 18, 69, 72, 31, 40, 54, 53, 25, 81, 15, 84, 101, 31, 82, 1, 33, 15, 77, 25, 51, 67, 85, 62, 12, 101, 79, 48, 24, 98, 24, 73, 101, 42, 82, 62, 3, 77],43).
f([36, 4, 20, 84, 22, 53, 95, 84, 65, 23, 98, 95, 11, 23, 70, 53, 30, 45, 51, 37, 46, 63, 94, 98, 16, 84, 22, 78, 83, 55, 85, 63],32).
f([8, 67, 92, 72],4).
f([34, 56, 46, 10, 86, 28, 74, 36, 81, 43, 73, 82, 66, 44, 13, 94, 17, 95, 26, 93, 57, 18, 19, 90, 79, 35, 43, 24, 89, 87, 95, 70, 17, 3, 41, 58],36).
f([86, 98, 41, 78, 44, 76, 13, 11, 81, 60, 4, 36, 53, 63, 63, 88, 74, 59, 31, 3, 26, 54, 4, 1, 58, 86, 85, 66, 51, 84, 94, 71, 99, 86, 24, 77, 5, 88, 79, 18, 67, 8],42).
f([24, 96, 46, 4, 34, 83, 17, 56, 22, 93, 45, 28, 57, 52, 60, 5, 38, 41, 53, 20, 9, 28, 78, 55, 94, 79, 75, 43, 8, 27, 63, 38, 98, 34, 29, 73, 68, 23],38).
f([40, 92, 1, 41, 78, 66],6).
f([71, 23, 84, 8, 68, 71, 24, 45, 62, 49, 53, 31, 89, 2, 21, 94, 10, 39],18).
f([99, 69, 45, 68, 10, 4, 22, 80, 91, 71, 61, 79, 8, 82, 27, 52, 48, 66, 44, 24, 58, 48, 101, 90, 52, 56, 6, 68, 39, 52, 47, 69, 76, 94, 5, 20, 83, 92, 101, 13, 13, 12, 31],43).
f([55, 72, 79, 23, 9],5).
f([42, 54, 89, 97, 71, 92, 67, 81, 71, 81, 26, 1, 65, 56, 38, 49, 5, 31, 15, 27, 87, 27, 93, 49, 90, 71, 87, 43, 100, 51, 45, 56, 70, 70, 26, 31, 21, 73, 34, 80, 101, 64, 75, 49],44).
f([22, 53, 27, 75, 35, 15, 23, 22, 64, 53, 68, 76, 80, 15, 23, 17, 92, 24, 34, 36, 56, 27, 5, 3],24).
f([68, 97, 20, 43, 16, 76, 80, 21, 17, 17, 77, 61, 80, 13, 61, 92, 83, 74, 80, 67, 60, 3, 57, 20, 52, 89, 77, 87, 42, 84, 53, 63, 15, 14, 44, 19, 46, 80, 39, 31, 24, 15, 46, 61, 2, 17, 11, 79],48).
f([74, 99, 33, 51, 36, 66, 53, 90, 69, 17, 77, 47, 28, 79, 82, 90, 55, 24, 62, 44, 36, 40, 73, 41, 47, 80, 81],27).
f([46, 61, 95, 101, 40, 14, 29, 36, 95, 18, 92, 75, 81, 41, 96, 8, 20, 30, 47, 90, 35, 55, 80, 82, 73, 39, 76, 83, 26],29).
f([13, 100, 89],3).
f([66, 55, 77, 81],4).
:-end_in_pos.
:-begin_in_neg.
f([61, 94, 22, 2, 25, 72, 79, 48, 48, 2, 51, 3, 14, 1, 94, 63, 24, 82, 57, 92, 101, 64, 1, 101, 49, 78, 38, 74, 21, 23, 51, 46, 22, 90, 51, 65, 90, 39, 84, 44, 7, 21, 70, 9, 17, 94, 14, 93],62).
f([50, 57, 9, 75, 8, 44, 29],17).
f([27, 8, 66, 77, 58, 39, 14, 97],60).
f([95, 39, 78, 80, 70, 34, 59, 47, 69, 19, 21, 67, 79, 49, 34, 53, 64, 67, 66, 31, 81, 35, 45, 40, 29, 86, 35, 48, 25, 1, 42, 12, 14, 80, 101, 96, 80, 101, 37],86).
f([14, 94, 25, 22, 5, 60, 35, 18, 92, 24, 1, 32, 38, 42, 33, 56, 47, 43, 59, 9, 48, 89, 58, 67, 90, 46, 1, 57, 71, 7, 15, 63, 73, 59, 6],92).
f([90, 16, 28, 63, 50, 92, 57],0).
f([100, 59, 13, 7, 48, 26, 42, 75, 1, 57, 77, 28, 91, 44, 83, 69, 9, 24, 46, 3, 30, 25, 49, 98, 33, 53, 93, 27, 44, 64, 8, 12, 63, 8, 54, 22, 11, 73, 52, 46, 46, 40, 70, 49, 11, 80, 20, 13],34).
f([65, 55, 81, 90, 96, 22, 38, 91, 15, 94, 16, 45, 51, 6, 54, 8, 56, 67, 74, 7, 83, 1, 37, 4],33).
f([46, 28, 101, 100, 27, 31, 47, 75, 53, 7, 48, 80, 7, 18, 6, 68, 59, 70, 41, 65, 61, 23, 7, 99, 6, 65, 66],93).
f([60, 73, 34, 100, 15, 80, 28, 30, 87, 86, 12, 29, 82],17).
f([51, 97, 71, 70, 23, 30, 47, 18, 94, 76, 15, 83, 3, 5, 96, 87, 40, 78, 100, 20],86).
f([98, 33, 49, 18, 58, 68, 70, 25, 37, 47, 50, 57, 67, 55, 82, 72, 34, 89, 18, 6, 86, 6, 8, 22, 89, 16],71).
f([89, 93],0).
f([36, 24, 72, 32, 85, 39, 7, 58, 48, 9, 92],62).
f([18, 75, 39, 33, 57, 88, 75, 31, 17, 70, 77, 42, 41, 37, 73, 32, 95, 28, 94, 37, 61, 24, 23, 16, 75, 37, 6, 13, 95, 19, 95, 15, 64, 3, 72, 39, 92, 21, 20, 1, 45, 5, 19, 6, 69, 89, 78],95).
f([88, 49, 53, 52, 26, 4, 57, 97, 21, 50, 15, 83, 5, 43, 89, 49, 61, 22, 25, 38, 28, 52, 98, 94, 81, 51, 31, 98, 39, 94, 78, 23, 71, 53, 101, 46, 32, 52, 75, 4, 71, 30, 10, 9, 89, 61, 32],95).
f([59, 85, 98, 99, 41, 94],100).
f([68, 79, 13, 45, 80, 46, 58, 60, 15, 57, 52, 85, 44, 95, 19, 28, 3, 66, 31, 80, 88, 50, 80, 12, 53, 25, 28, 70, 31, 74, 12, 8, 48, 4, 55, 97, 59, 46, 30, 36, 58, 36, 89, 54, 29, 74],45).
f([66, 9, 8, 11, 2, 100],54).
f([9, 36, 34, 33, 50, 24, 84, 66, 23, 87, 13, 39, 68, 4, 76, 63, 32, 19, 38, 91],62).
:-end_in_neg.
