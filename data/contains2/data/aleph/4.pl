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
f([11, 1, 25, 14, 16, 46, 62, 2, 76, 27, 77, 74, 58, 53, 18, 9, 8, 94, 61, 75]).
f([72, 93, 100, 100, 69, 14, 70, 37, 6, 17, 36, 19, 6, 26, 67, 28, 39, 89, 79, 1, 49, 46, 13, 22, 8, 72, 35, 34, 32, 89, 94, 91, 20, 34, 98, 80, 74, 30, 68, 1, 67, 14, 4, 42]).
f([8, 43, 47, 39, 98, 79, 9, 41, 11, 43, 9, 9, 26, 65, 20, 99, 50]).
f([49, 67, 74, 19, 100, 74, 27, 63, 2, 51, 23, 74, 5, 90, 71, 9, 35, 57, 79, 47, 44, 25, 31, 93, 50, 62, 72, 24, 82, 23, 2, 82, 46, 58]).
f([29, 10, 2, 75, 9, 5, 57, 31, 82, 22, 81, 53, 82, 30, 11, 26, 73, 30, 98, 91, 73, 91, 36, 27, 75, 89, 23, 5, 19]).
f([60, 4, 16, 23, 38, 101, 36, 9, 66, 7, 5, 6, 15, 67, 15, 69, 64]).
f([89, 84, 17, 93, 24, 1, 60, 29, 10, 73, 22, 45, 9, 56, 91, 35, 60, 90, 20, 87, 42, 29, 4, 42, 8]).
f([23, 82, 22, 26, 3, 65, 66, 87, 75, 94, 6, 10, 24, 63, 79, 101, 32, 11, 58, 89, 28, 15, 14, 42, 101, 70, 94, 36, 47, 16, 47]).
f([82, 34, 57, 65, 3, 64, 72, 22, 72, 56, 80, 55, 6, 57, 35, 1, 14, 27, 64, 34, 38, 10, 2, 52, 31, 54, 22, 50, 47, 33, 24, 50, 39, 100]).
f([52, 19, 34, 72, 42, 95, 51, 27, 76, 94, 96, 82, 35, 91, 50, 64, 38, 48, 78, 91, 70, 42, 6, 19, 47, 101, 96, 79, 70, 69, 60, 85, 68, 91, 84, 52, 24]).
f([1, 98, 76, 65, 38, 74, 22, 100, 69, 12, 74, 4, 6, 41, 90, 44, 54, 28, 32, 94, 73, 62, 70, 50, 82, 98, 11, 28, 92, 21, 96, 40, 96, 11, 35, 4, 98, 94, 4, 9, 10]).
f([26, 62, 75, 6, 27, 86, 29, 71, 77, 74, 14, 1, 4, 27, 101, 23, 98, 92, 13, 32, 57]).
f([78, 4, 26, 98, 33, 52, 5, 63, 89, 69, 7, 6, 10, 65, 89, 3, 12, 4, 38, 18, 22, 28, 10, 1, 54, 56, 25]).
f([61, 33, 27, 22, 53, 36, 69, 11, 72, 67, 78, 6, 99, 88, 46, 43, 66, 87, 72, 81, 63, 39, 62, 36, 81, 24, 99, 65, 46, 29]).
f([43, 19, 92, 65, 68, 9, 80, 21, 64, 39, 85, 12, 70, 90, 16, 100, 46, 47, 66, 60, 8, 49, 78, 30, 68, 79, 48, 71, 77, 16, 26, 13, 20, 28, 99, 38, 68, 54, 54, 50, 79, 84, 24, 14, 41, 23]).
f([95, 8, 19, 38, 3, 44, 33, 55, 82, 42, 49, 78, 32, 44, 88, 13, 21, 31, 6, 41, 23, 88, 95, 49, 11, 52, 42, 91, 98, 45, 14, 21, 76, 85]).
f([92, 66, 66, 38, 9, 6, 24, 11, 27, 8, 3, 100, 52, 59, 63, 39, 7, 53, 9, 100, 54, 65, 58, 49, 59, 52, 12, 76, 51, 40, 78, 52, 51, 54, 39, 52, 33, 38, 65, 12, 11, 80, 71, 46, 45, 29, 92, 20]).
f([73, 60, 96, 74, 90, 58, 100, 2, 85, 100, 25, 3, 66, 19, 74, 89, 47, 71, 25, 49, 34, 9]).
f([63, 3, 43, 24, 25, 101, 24, 60, 80, 85, 35, 24, 36, 71, 1, 21, 32, 92, 84, 14, 13, 30, 63, 9, 33, 95, 96, 84, 26, 97, 44, 21, 81, 73, 26, 46, 61, 71, 64, 1, 36, 75, 3, 48, 24, 49, 24, 58, 24, 46]).
f([45, 48, 77, 18, 90, 16, 79, 97, 70, 35, 58, 7, 76, 97, 16, 101, 27, 6, 44, 72, 54, 54, 63, 76, 46, 88, 28, 1, 97, 66, 18, 33, 15, 40, 25, 64, 46, 48, 17, 21, 64, 81, 46, 72, 81, 97]).
:-end_in_pos.
:-begin_in_neg.
f([49, 44, 24, 85, 23, 52, 47, 56, 27, 83, 55, 81, 92, 21, 12, 44, 45, 25, 88, 97, 41, 39, 19, 69, 26, 1, 42, 89, 13, 59, 17, 20, 20, 56, 43, 93]).
f([24, 78, 1]).
f([57, 23, 86, 73, 45, 38, 2, 69, 100, 85, 20, 66, 54, 92, 32, 16, 89]).
f([77, 38, 57, 44, 66, 58, 51, 85, 65, 43, 12, 76, 85, 20, 43, 8, 66]).
f([73, 32, 39, 24, 75, 23, 19, 52, 52]).
f([74, 33, 87, 13, 74, 47, 4, 25, 44, 18, 7, 93, 44, 19, 29, 80, 79, 65, 26, 98, 12, 80, 65, 41, 93, 15, 70, 13, 89, 41, 2, 2, 62, 52, 74]).
f([78, 98, 55, 24, 91, 21, 73, 84, 24, 54, 85, 94, 78, 64, 71, 49]).
f([15, 35, 62, 7, 45, 27, 24, 33, 29, 66, 4, 74, 52, 82, 97, 46, 100, 29, 72, 22, 64, 50, 36, 37, 86, 56, 32, 86, 14, 80, 79, 64, 52, 43, 72, 46, 84, 81, 34, 77, 40, 23, 51, 81, 74, 72, 13, 67, 50]).
f([91, 45, 93, 85, 29, 43, 65, 95, 39, 51, 89, 3, 52, 74, 19, 19, 67, 65, 88, 31, 35, 85, 97, 34, 70, 76, 62, 55, 97, 20, 36, 17, 51, 28, 81, 81, 52, 96, 41, 16, 13, 11, 65, 69]).
f([17, 101, 85, 94, 43, 93, 13, 54, 24, 81]).
f([26, 95, 47, 15, 57, 15, 39, 23, 77, 27, 1, 18, 25, 99, 82, 74]).
f([57, 74, 67, 50, 41, 86, 13, 3, 13, 26, 64, 80, 69, 37, 50, 62, 33, 42, 82, 3, 18, 50, 30, 48, 16, 44, 55, 11, 10, 8, 91, 38, 99, 31, 72, 35, 88, 41, 78]).
f([13, 68, 94, 18, 56]).
f([91, 75, 77, 42, 16]).
f([76, 68, 30, 100, 41, 96, 16, 4, 17, 55, 94, 100, 35, 61, 98, 97, 12, 45, 55, 38, 24, 68, 39, 44, 14, 7, 53, 85, 98, 93, 60, 33, 90, 27, 82, 66, 73, 56, 62, 65, 11, 88, 14, 40, 98, 42, 49]).
f([22, 93, 62, 92, 35, 16, 86, 27, 40, 97, 55, 88, 94, 90, 55, 55, 46, 34, 79, 31, 31, 79, 88, 35, 38, 19, 1, 15, 92, 58, 98, 79, 51, 29]).
f([51, 24, 38, 87, 74, 89, 91, 84, 44]).
f([79, 47, 57, 83, 70, 90, 92, 85, 62, 57, 39, 74, 94, 72, 61, 8, 76, 86, 55, 25, 83, 84, 84, 3, 40, 90, 18, 49, 92, 77, 82, 1, 50, 20, 14, 101, 84, 99, 48, 10, 50, 17, 29, 23, 58]).
f([74, 38, 83, 43, 84, 98, 10, 99, 62, 26, 16, 44, 74, 37, 98, 84, 90, 45, 23, 52, 62, 55, 52, 61, 1, 51, 47, 59, 57, 101, 89, 51, 20, 14]).
f([52, 69, 23, 55, 60, 22, 58, 75, 85, 63, 75, 86, 54, 1, 26, 25, 16, 19, 7, 96, 17, 19, 90, 58, 80, 2, 37, 58, 77, 89, 18, 75, 28, 82, 88, 1, 7, 47, 53, 86, 75]).
:-end_in_neg.
