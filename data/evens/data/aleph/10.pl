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
f([90, 50, 70, 60, 94, 8, 18, 50, 32, 70, 32, 28, 2, 50, 58, 48, 48, 48, 86, 50, 16, 86, 64, 16, 36, 88, 86, 64, 18, 60, 96, 26, 80, 30, 54, 72, 40, 24, 14, 16, 28, 62, 76, 26, 10]).
f([26, 60, 26, 42, 16, 2, 28, 90, 50, 98, 34, 88, 12, 48, 96, 14, 98, 68, 66, 48, 72, 22, 60, 4, 68, 58, 40, 98, 94, 88, 84, 14, 62, 94, 54, 20, 72, 74, 92, 98, 60, 74, 36]).
f([38, 76, 16, 10, 20, 22, 90, 90, 54, 12, 36, 30, 40, 24, 88, 8, 84, 12, 94, 76, 28, 22, 16, 70, 46, 82, 4, 42, 30, 42, 14, 48, 80, 18, 24, 4, 80, 28, 80, 28, 18, 40, 90, 28]).
f([68, 90, 40, 56, 6, 20, 72, 46, 60, 70, 30, 22, 2, 2, 56, 86, 54, 10, 6, 42, 50, 88, 10, 10, 62, 40, 4, 24, 48, 52, 2, 66, 16, 90]).
f([10, 92, 2, 16, 44, 92, 16, 42, 82, 46, 36, 80, 36, 96, 78, 40, 72, 20, 84, 36, 22, 20, 22, 38, 6, 16, 62, 42, 50, 40, 64, 86, 18, 96, 90, 42, 72, 20, 90, 36, 32, 96, 56, 12, 52, 64]).
f([64, 28, 4, 12, 48, 80, 2, 92, 64, 58, 78, 4, 40, 48, 74, 86, 32, 2, 34, 30, 74, 66, 40, 46, 44, 92, 22, 66]).
f([60, 60, 90, 2, 64, 14, 30, 42, 4, 24, 56, 42, 20, 60, 84]).
f([80, 20, 76, 84, 16, 22, 46, 34, 38, 10, 20, 40, 90, 74, 32, 36, 40, 46, 34, 74, 90, 6, 10, 42, 70, 4, 22, 78, 82, 88, 86, 80, 96, 34, 76, 40, 62, 54, 8, 96, 36, 68, 72, 24, 42]).
f([86, 8, 80, 68, 82, 4, 24, 2, 66, 78, 80, 6, 96, 16, 98, 28, 46, 8, 86, 68, 18, 88, 52, 48, 50, 40, 12, 94, 40, 32, 6, 12, 76]).
f([74, 32, 82, 78, 46, 94, 40, 28, 98, 82, 30, 36, 96, 60, 50, 56]).
f([96, 26, 88, 58, 78, 66, 98, 58, 40, 86, 48, 96, 34, 44, 42, 4, 52, 64, 50, 36, 34, 8, 62, 36, 20, 56, 34, 10, 92, 98, 70, 48, 48, 44, 16, 66, 14]).
f([70, 88, 20, 18, 72, 86, 58, 86]).
f([44, 68, 18, 36, 26, 32, 28, 54, 4, 48, 72, 30, 18, 18, 98, 20, 24, 80, 88, 60, 38, 4, 84, 68, 32]).
f([56, 70, 42, 36, 84, 2, 72, 46, 22, 80, 76, 52, 48, 30, 86, 96, 24, 96, 74, 34, 18]).
f([78, 90, 36, 96, 76]).
f([80, 38, 28, 6, 50, 88, 32, 42, 14, 34, 74, 16, 50, 32, 2, 8, 32, 60, 66, 18, 10, 80]).
f([8, 84, 22, 90, 42, 74, 88, 90, 46, 82, 46, 62, 52, 4, 18, 82, 72, 52, 16, 70, 78, 14, 88, 74, 74, 86, 56, 34, 30, 72, 86, 84, 68, 28, 10, 20, 50]).
f([24, 24, 22, 52, 62, 96, 66, 82, 96, 6, 100, 100, 72, 66, 12, 100, 98]).
f([52, 64, 30, 80, 74, 44, 84, 22, 14, 78, 12, 28, 100, 28, 36, 94, 56, 38, 10, 78, 2, 8, 100, 6, 22, 6, 62, 62, 26, 84, 46, 26, 98, 78, 28, 12, 6, 76, 14, 68, 28, 84, 8]).
f([72, 80, 62, 28, 36, 58, 32, 6, 44, 84, 32, 26, 30, 68, 62, 76, 42, 98, 40, 32, 60, 26, 6, 20, 92, 90, 68, 36, 96, 52, 56]).
:-end_in_pos.
:-begin_in_neg.
f([18, 44, 44, 4, 34, 96, 78, 34, 30, 10, 68, 24, 44, 60, 82, 22, 63, 22, 92, 98, 8, 12, 82, 6, 90, 32, 86, 18, 50, 82, 94, 13, 10, 48, 98, 72, 74, 10, 90, 38, 42, 40]).
f([75, 78, 61, 89, 42, 20, 23, 29, 76, 15]).
f([84, 37, 19, 89, 11, 15, 29, 3, 22, 97, 89, 25, 56, 58, 59, 89, 67, 87, 61, 53, 41]).
f([72, 17, 4, 55, 11, 20, 47, 98, 34, 9, 79, 3, 72, 83, 59, 88, 46, 34, 33, 30, 18, 28, 16, 82, 49, 10, 79, 29, 61, 6, 12, 66, 45, 38, 18, 84, 1, 38]).
f([94, 93, 24, 94, 38, 18, 9, 55, 36, 13, 11, 63, 95, 93, 46, 96, 15, 41, 99, 85, 56, 59, 71, 27, 51, 18]).
f([73, 73, 75, 59, 63, 61, 75, 33, 23, 37, 83, 99, 67, 78, 23, 43, 63, 29, 59, 79, 75, 35, 38, 17, 13, 39, 55, 27, 21, 7, 3, 57]).
f([35, 76, 60, 82, 44, 11, 22, 74, 91, 98, 53, 23, 45, 69, 4, 45, 85, 49, 16, 74, 8, 85, 40, 87, 39, 41, 71, 97, 90, 48, 58, 3, 13, 47, 43]).
f([62, 22, 48, 78, 56, 80, 90, 56, 28, 34, 92, 26, 10, 4, 8, 92, 64, 100, 56, 70, 82, 80, 62, 54, 34, 36, 98, 94, 85, 10, 54, 76, 10, 64, 60, 80, 38, 96, 44, 44, 8]).
f([2, 94, 44, 44, 43, 9, 42, 65, 42, 60, 44, 90, 9, 37, 10, 15, 68, 89, 25, 77, 3, 32, 68, 20, 7, 99, 3, 35, 98, 91, 63, 54, 1, 72, 67, 23, 76, 76, 8, 68]).
f([72, 82, 73, 26, 42, 97, 15, 67, 4, 72, 92, 98, 90, 80, 2, 76, 82, 10, 64, 60, 80, 52, 94, 90, 89, 10, 70, 64, 71, 11, 36, 9, 94, 72, 78, 67, 50, 56, 3, 98, 61]).
f([62, 53, 58, 59, 82, 75, 79, 37, 58, 70, 58, 38, 55, 97]).
f([97, 4, 39, 9, 37, 15, 53, 95, 77, 95, 75, 33, 33, 17, 100, 45, 66, 41, 36, 17, 17, 27, 71, 82, 29, 29, 27, 75, 53, 99, 97, 57, 28, 20, 35, 33, 73, 51]).
f([74, 33, 56, 37, 97, 39, 71, 5, 20, 11, 15, 72, 98, 90, 16, 26, 80, 58, 29, 58, 87, 11]).
f([6, 7, 99, 35, 49]).
f([12, 54, 12, 28, 62, 56, 85, 82, 62, 27, 25, 69, 47, 8, 75, 72, 82, 93, 54, 76, 84, 78, 51, 52, 52, 6, 85, 100, 1, 22, 32, 47, 33, 16, 14, 67, 82, 90, 34, 94, 22, 3, 4, 26, 12, 17, 53, 46, 65, 11]).
f([65, 44]).
f([39, 1, 97, 24, 17, 63, 69, 55, 91, 21, 30, 23, 65, 55, 11, 61, 39, 66, 51, 9, 87, 65, 87, 49, 73, 91, 67, 7, 63, 59, 3, 35, 78, 77, 63, 73, 47, 9, 31, 12, 67, 59]).
f([4, 9, 84, 45, 90, 22, 68, 100, 87, 11, 97, 97, 77, 83, 62, 88, 60, 12, 10, 69, 1, 73, 41, 30, 89, 68, 52, 54, 24, 27, 73, 2, 31, 65, 46, 16, 8, 66, 78, 91]).
f([43, 23, 38, 25, 83, 37, 84, 41, 78, 94, 74, 23, 93, 77, 31, 29, 67, 50, 61, 57, 99, 90, 10, 93, 94]).
f([13, 74, 87, 57, 28, 69, 97, 35, 53, 85, 81, 94, 18, 89, 99, 10, 85, 5, 33, 6, 9, 97, 43, 90, 7, 57, 93, 86, 45, 44, 79, 85, 15, 59, 31, 82, 39, 28, 91, 37, 6, 99, 76, 29, 22, 12, 43, 65, 83, 7]).
:-end_in_neg.
