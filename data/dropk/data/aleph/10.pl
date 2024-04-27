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
:- modeh(*,f(+list,+element,-list)).
:- modeb(*,f(+list,+element,-list)).

:- determination(f/3,head/2).
:- determination(f/3,tail/2).
:- determination(f/3,geq/2).
:- determination(f/3,empty/1).
:- determination(f/3,even/1).
:- determination(f/3,odd/1).
:- determination(f/3,one/1).
:- determination(f/3,zero/1).
:- determination(f/3,decrement/2).
:- determination(f/3,f/3).
%% :- determination(f/3,increment/2).
%% :- determination(f/3,element/2).
%% :- determination(f/3,cons/3).
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
f([11, 66, 33, 57, 90, 80, 63, 49, 58, 33, 37, 8, 21, 19, 15, 76],3,[57, 90, 80, 63, 49, 58, 33, 37, 8, 21, 19, 15, 76]).
f([17, 41, 71, 63, 42, 87, 60, 32, 78, 30, 37, 22, 20, 20, 34, 58, 65, 19, 9, 39],17,[19, 9, 39]).
f([80, 61, 6, 94, 54, 20, 16, 71, 69, 90, 85, 82, 4, 72, 60, 84, 55, 59, 72, 46, 98, 48, 43, 21, 7, 93, 93],15,[84, 55, 59, 72, 46, 98, 48, 43, 21, 7, 93, 93]).
f([46, 57, 91, 44, 50, 29, 55, 99, 25, 73, 3, 11, 65, 67, 100, 56, 94, 87, 9, 39, 99, 22, 1, 44, 8, 49, 76, 56, 60, 22, 100, 54, 3, 95, 99, 54, 82, 35, 32, 45, 78, 72, 54, 83, 23],3,[44, 50, 29, 55, 99, 25, 73, 3, 11, 65, 67, 100, 56, 94, 87, 9, 39, 99, 22, 1, 44, 8, 49, 76, 56, 60, 22, 100, 54, 3, 95, 99, 54, 82, 35, 32, 45, 78, 72, 54, 83, 23]).
f([73, 101, 95, 82, 79, 3, 78, 6, 70, 47, 40, 94, 76, 24],7,[6, 70, 47, 40, 94, 76, 24]).
f([14, 1, 80, 33, 55, 44, 33, 39, 49, 43, 95, 51, 16, 81, 77, 28],1,[1, 80, 33, 55, 44, 33, 39, 49, 43, 95, 51, 16, 81, 77, 28]).
f([16, 43, 87, 20, 22, 27, 40],4,[22, 27, 40]).
f([3, 3, 33, 83, 35, 91, 53, 99, 29, 75, 31, 75, 47, 38, 95, 69, 8, 35, 54, 51, 62, 75, 24, 8, 76, 66, 40, 71, 78, 38, 37, 10, 59, 37, 8, 31, 53],19,[51, 62, 75, 24, 8, 76, 66, 40, 71, 78, 38, 37, 10, 59, 37, 8, 31, 53]).
f([44, 22, 31, 37, 40, 44, 88, 41, 96, 98, 26, 54, 49, 20, 96, 55, 69, 99, 86, 71, 74, 48],20,[74, 48]).
f([53, 14, 80, 83, 12, 57, 47, 77, 80, 100, 79, 7, 89, 100, 97, 85, 6, 82, 8, 17, 101, 8],1,[14, 80, 83, 12, 57, 47, 77, 80, 100, 79, 7, 89, 100, 97, 85, 6, 82, 8, 17, 101, 8]).
f([97, 11, 13, 45, 13, 77, 94, 99, 87, 26, 52, 78, 61, 84, 65, 17, 47, 64, 19, 8, 84, 73, 68, 81],13,[84, 65, 17, 47, 64, 19, 8, 84, 73, 68, 81]).
f([14, 74, 62, 8, 90, 96, 58, 42, 16, 86, 56, 1, 82, 3, 44, 98, 95, 51],7,[42, 16, 86, 56, 1, 82, 3, 44, 98, 95, 51]).
f([24, 68, 10, 96, 52, 100, 64, 101, 63, 70, 13, 2, 1, 2, 40, 29, 93],9,[70, 13, 2, 1, 2, 40, 29, 93]).
f([14, 43, 72, 93, 75, 3, 28, 29, 68, 9, 65, 4, 13, 27, 57, 100, 77, 20, 35, 31, 71, 27, 52, 36, 62, 68, 56, 4, 41, 31, 62, 40],23,[36, 62, 68, 56, 4, 41, 31, 62, 40]).
f([41, 69, 101, 66, 57, 86, 20, 9, 53, 101, 70, 56, 30, 88, 7, 55, 28, 56, 47, 17, 91, 46, 35, 50, 90, 29, 12, 67, 36, 48, 64, 52, 100, 67, 59, 25, 28, 96, 16, 50, 32],20,[91, 46, 35, 50, 90, 29, 12, 67, 36, 48, 64, 52, 100, 67, 59, 25, 28, 96, 16, 50, 32]).
f([27, 39, 90, 62, 34, 77, 80, 75, 17, 16, 96, 53, 53, 96, 92, 6, 75, 71, 69, 77, 73, 11, 47, 67, 71, 49, 97, 61, 11, 52, 88, 84],5,[77, 80, 75, 17, 16, 96, 53, 53, 96, 92, 6, 75, 71, 69, 77, 73, 11, 47, 67, 71, 49, 97, 61, 11, 52, 88, 84]).
f([11, 48, 69, 9, 64, 2, 1, 55, 82, 65, 43, 8, 69, 56, 62, 91, 91, 48, 31, 12, 36, 45, 8, 89],9,[65, 43, 8, 69, 56, 62, 91, 91, 48, 31, 12, 36, 45, 8, 89]).
f([8, 6, 71, 51],1,[6, 71, 51]).
f([44, 15, 69, 95, 95, 60, 98, 91, 96, 36, 36, 7, 30, 20, 68, 89, 100, 79, 46, 71, 57, 27, 34, 24, 12, 88, 50, 57],8,[96, 36, 36, 7, 30, 20, 68, 89, 100, 79, 46, 71, 57, 27, 34, 24, 12, 88, 50, 57]).
f([83, 6, 40, 30, 90, 62, 91, 64, 29, 85, 19, 86, 75, 3, 10, 1, 35],9,[85, 19, 86, 75, 3, 10, 1, 35]).
:-end_in_pos.
:-begin_in_neg.
f([78, 74, 54, 29, 16, 67, 10, 92, 20, 31, 62, 73, 85, 72, 62, 66, 81, 35, 6, 37, 7, 20, 44, 65, 54, 76, 75, 25],21,[37, 7, 20, 44, 65, 54, 76, 75, 25]).
f([101, 49, 60, 59],3,[49, 60, 59]).
f([65, 61, 27, 32, 58, 16, 68, 68, 24, 14, 83, 23, 16, 77, 44, 10, 99, 17, 93, 41, 73, 10, 76, 53, 6, 37, 14, 71, 78, 89],27,[58, 16, 68, 68, 24, 14, 83, 23, 16, 77, 44, 10, 99, 17, 93, 41, 73, 10, 76, 53, 6, 37, 14, 71, 78, 89]).
f([90, 61],0,[61]).
f([56, 76, 40, 99, 31, 9, 82, 29, 4, 34],5,[40, 99, 31, 9, 82, 29, 4, 34]).
f([91, 31, 74, 21, 61, 68, 20, 19, 10, 50, 97, 31, 95, 15, 66, 90, 86, 68, 8, 83, 18, 38, 37, 74, 39, 42, 18, 56, 11, 29, 8, 9],8,[8, 83, 18, 38, 37, 74, 39, 42, 18, 56, 11, 29, 8, 9]).
f([9, 6, 87, 7, 2, 84, 42, 83, 100, 50, 33, 90, 95, 75, 94, 55, 30, 80, 89, 52, 79, 86, 84, 38, 70],12,[9, 6, 87, 7, 2, 84, 42, 83, 100, 50, 33, 90, 95, 75, 94, 55, 30, 80, 89, 52, 79, 86, 84, 38, 70]).
f([67, 97, 18, 69, 82, 59, 52, 23, 29, 15, 66],5,[52, 23, 29, 15, 66]).
f([3, 52, 83, 97, 96, 3, 61, 59, 89, 87, 1, 34, 26, 90, 47, 46, 50, 39, 56, 76, 13, 16, 47, 16, 83],12,[16, 47, 16, 83]).
f([34, 48, 86, 8, 22, 27, 28, 75, 69, 30, 55, 92, 35, 95, 8, 27, 35, 17, 51, 5, 26, 79, 9, 79, 2, 98, 21, 58, 11, 66, 11, 90, 101, 87, 13, 82, 10, 30, 90, 4, 36, 8],2,[30, 55, 92, 35, 95, 8, 27, 35, 17, 51, 5, 26, 79, 9, 79, 2, 98, 21, 58, 11, 66, 11, 90, 101, 87, 13, 82, 10, 30, 90, 4, 36, 8]).
f([31, 26, 46, 6, 87, 19, 26, 53],1,[19, 26, 53]).
f([97, 29, 21, 99, 62, 25, 36, 28, 7, 19, 71, 31, 70, 62, 60, 93, 29, 64, 37, 54, 73, 98, 62, 91, 39, 57, 11, 62, 21, 67, 59, 83, 79, 98, 61, 63, 84, 61],12,[91, 39, 57, 11, 62, 21, 67, 59, 83, 79, 98, 61, 63, 84, 61]).
f([69, 50, 91, 70, 74, 14, 20, 90, 96, 6, 53, 11, 65, 42, 16, 36, 14, 100, 52],10,[52]).
f([14, 18],2,[14, 18]).
f([48, 60, 31, 4, 86, 100, 13, 7, 18, 25, 60, 20, 79, 29, 61, 71, 57, 30, 71, 16, 62, 84, 36],12,[30, 71, 16, 62, 84, 36]).
f([68, 49, 59, 33, 94, 45, 36, 91, 32, 81, 15, 24, 10, 44, 4, 67, 34, 66, 91],2,[91]).
f([65, 63, 95, 8],1,[8]).
f([61, 19, 87, 19, 5, 66, 67, 62, 12, 9, 97, 6, 77, 25, 25, 40, 85, 68, 3, 7, 32, 101, 99, 70, 42, 43, 13, 78, 87, 23, 45, 70, 1, 45, 98, 4, 28, 12, 64],39,[23, 45, 70, 1, 45, 98, 4, 28, 12, 64]).
f([29, 11, 20, 6, 27, 69, 6, 29, 19, 21, 72, 42, 75, 6, 41, 62, 64, 79],16,[27, 69, 6, 29, 19, 21, 72, 42, 75, 6, 41, 62, 64, 79]).
f([91, 65, 70, 14, 97, 26, 76, 44, 18, 76, 52, 83, 38, 23],1,[91, 65, 70, 14, 97, 26, 76, 44, 18, 76, 52, 83, 38, 23]).
:-end_in_neg.
