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
f([63, 25, 53, 35],3,[35]).
f([89, 88, 20, 66, 32, 39, 23, 75, 31, 87, 48],10,[48]).
f([11, 25, 99, 67, 15, 62, 17, 60, 10, 89, 64, 42, 25, 96, 78, 67, 85, 26, 55, 63, 21, 80, 100, 24, 34, 78, 35, 72, 25, 42, 41, 98, 46, 49, 61, 100, 89, 68, 23, 49, 98, 29, 78, 101, 95, 26, 60, 63, 24, 38],12,[25, 96, 78, 67, 85, 26, 55, 63, 21, 80, 100, 24, 34, 78, 35, 72, 25, 42, 41, 98, 46, 49, 61, 100, 89, 68, 23, 49, 98, 29, 78, 101, 95, 26, 60, 63, 24, 38]).
f([1, 71, 1, 30, 86, 75, 33, 55, 60, 87, 56, 28, 79, 80],8,[60, 87, 56, 28, 79, 80]).
f([13, 68, 4, 78, 57, 49, 81, 63, 90, 70, 56, 6, 85, 70, 66, 13, 19, 23, 20, 89, 78, 41, 93, 30, 7, 14, 46, 45, 26, 6],23,[30, 7, 14, 46, 45, 26, 6]).
f([18, 11, 9, 18, 63, 89, 27, 47, 58, 6, 93, 40, 67, 84, 81, 75, 70, 27, 90],17,[27, 90]).
f([34, 44, 33],3,[]).
f([80, 99, 19, 69, 77, 29, 43, 20, 47, 24, 46, 32, 17, 22, 20, 94, 11, 38, 97, 59, 11, 95],20,[11, 95]).
f([17, 98, 21, 43, 65, 12, 61, 58, 92, 39, 40, 53, 37, 84, 3, 63, 15, 77, 77, 32, 21, 101, 57, 13, 57, 17, 75, 80, 26, 86, 82, 98, 72, 19, 43, 16, 41, 91, 26, 79, 66, 101, 97],1,[98, 21, 43, 65, 12, 61, 58, 92, 39, 40, 53, 37, 84, 3, 63, 15, 77, 77, 32, 21, 101, 57, 13, 57, 17, 75, 80, 26, 86, 82, 98, 72, 19, 43, 16, 41, 91, 26, 79, 66, 101, 97]).
f([93, 37, 74, 101, 92, 65, 79, 94, 5, 78, 23, 48],11,[48]).
f([12, 30, 24, 44, 62, 5, 11, 29, 14, 22, 66, 67, 9, 68, 83, 8, 41, 82],7,[29, 14, 22, 66, 67, 9, 68, 83, 8, 41, 82]).
f([49, 12, 78, 16, 45, 91, 63, 80, 22, 101, 56, 60, 42, 101, 34, 46, 59, 42, 11, 18, 23, 75],2,[78, 16, 45, 91, 63, 80, 22, 101, 56, 60, 42, 101, 34, 46, 59, 42, 11, 18, 23, 75]).
f([57, 55, 28, 18, 77, 59, 66, 72, 39, 87, 83, 23, 2, 13, 94, 36, 10, 73, 4, 97, 33, 77, 72, 90, 79, 11, 40, 23, 33, 52, 8, 46, 29, 34, 45, 13, 46, 81, 78, 12, 40, 101],6,[66, 72, 39, 87, 83, 23, 2, 13, 94, 36, 10, 73, 4, 97, 33, 77, 72, 90, 79, 11, 40, 23, 33, 52, 8, 46, 29, 34, 45, 13, 46, 81, 78, 12, 40, 101]).
f([49, 13, 88, 83, 43, 41, 73, 77, 16, 54],8,[16, 54]).
f([43, 8, 50, 93, 95, 61, 72, 38, 34, 38, 15, 13, 80, 42, 33, 71, 59, 2, 98, 24, 31, 18, 2, 36, 76, 25, 63, 71, 6, 73, 2, 31, 58, 54, 39, 67, 10, 93, 9, 59, 67, 67, 31, 79, 17, 62, 99, 78, 76, 61],19,[24, 31, 18, 2, 36, 76, 25, 63, 71, 6, 73, 2, 31, 58, 54, 39, 67, 10, 93, 9, 59, 67, 67, 31, 79, 17, 62, 99, 78, 76, 61]).
f([100, 44, 44, 101, 12, 6, 74, 18, 36, 55, 60, 17, 38, 36, 93, 20],3,[101, 12, 6, 74, 18, 36, 55, 60, 17, 38, 36, 93, 20]).
f([32, 64, 11, 94, 1, 47, 55, 18, 27, 77, 97, 76, 12, 43, 32, 23, 94, 33, 74, 10, 85, 74, 62, 64, 81, 28, 51, 91, 90, 94, 95, 10, 63, 40, 1, 55, 1, 38, 49, 58, 83, 25, 101, 55, 67, 26, 84, 59, 79, 17],29,[94, 95, 10, 63, 40, 1, 55, 1, 38, 49, 58, 83, 25, 101, 55, 67, 26, 84, 59, 79, 17]).
f([25, 67, 35, 87, 101, 35],2,[35, 87, 101, 35]).
f([15, 9, 6, 44, 79, 69, 77, 58, 22, 91, 34, 92, 11, 71, 93, 94, 33, 70, 99, 52, 33, 44, 80, 72, 65, 83, 40, 39, 20, 101],22,[80, 72, 65, 83, 40, 39, 20, 101]).
f([69, 40, 43, 97, 28, 40, 26, 59, 6, 37, 83, 100, 1, 10, 14, 35, 99, 96, 18, 49, 90],17,[96, 18, 49, 90]).
:-end_in_pos.
:-begin_in_neg.
f([37, 28, 72, 53, 95, 5, 81, 69, 43, 56, 96, 8, 35, 5, 72, 49, 15, 11, 57, 22, 30, 41, 6, 67, 84],2,[69, 43, 56, 96, 8, 35, 5, 72, 49, 15, 11, 57, 22, 30, 41, 6, 67, 84]).
f([66, 29, 16, 28, 5, 79, 58, 50, 81, 62, 93, 13, 32, 33, 93, 24, 7, 6, 38, 24],3,[6, 38, 24]).
f([64, 14, 84, 50, 96, 24, 4, 35, 80, 98, 41, 36, 2, 28, 14, 60, 26, 2, 87, 11, 60, 76, 85, 71, 83, 98, 8, 99, 37, 66, 17, 27, 23, 22, 67, 90, 72, 1, 3, 81, 37, 77, 39],43,[14, 60, 26, 2, 87, 11, 60, 76, 85, 71, 83, 98, 8, 99, 37, 66, 17, 27, 23, 22, 67, 90, 72, 1, 3, 81, 37, 77, 39]).
f([71, 51, 101, 73, 40, 32, 3, 49, 17],6,[101, 73, 40, 32, 3, 49, 17]).
f([77, 87, 78, 18, 69, 73, 82, 51, 17, 27, 95, 98, 40, 32, 41, 43, 66, 96, 61, 3, 54, 53, 43, 17, 56, 30, 36, 74, 83, 53, 53, 91, 72, 72, 25, 30, 77],23,[32, 41, 43, 66, 96, 61, 3, 54, 53, 43, 17, 56, 30, 36, 74, 83, 53, 53, 91, 72, 72, 25, 30, 77]).
f([25, 43, 59, 93, 27, 7, 95, 85, 87, 68, 41, 83, 27, 62, 12, 32, 4, 20, 29, 98, 60, 60, 53, 78, 62, 79, 71, 77, 95, 19, 42, 44, 78, 74, 11, 17, 51, 37, 80, 70, 74, 22, 25, 21, 41, 40, 17, 58, 4],48,[74, 11, 17, 51, 37, 80, 70, 74, 22, 25, 21, 41, 40, 17, 58, 4]).
f([90, 60, 58, 6, 86, 92, 39, 77, 33, 80, 76, 86, 49, 82, 15, 78, 69, 79, 24, 54, 90, 74, 50, 54, 60, 88, 71, 94, 98],11,[78, 69, 79, 24, 54, 90, 74, 50, 54, 60, 88, 71, 94, 98]).
f([64, 88, 63, 16, 93, 11, 4, 69, 72, 80, 28, 50, 29, 82, 55, 84, 56, 77, 10, 75, 35, 45, 84, 84, 34, 50, 43, 98, 34, 91, 85, 101, 96, 16, 79, 4],34,[4]).
f([41, 41, 6, 2, 92, 101, 38, 20, 38, 66, 95, 86, 59, 92, 99, 25, 58, 58, 10, 96, 8, 57, 71, 12, 11, 50, 20, 26, 101, 92, 65, 49, 30, 85, 31, 85, 94, 81, 34, 12, 4, 96, 17, 42, 2],20,[2]).
f([22, 87, 75, 83, 8, 87, 3, 41, 18, 76, 39, 99, 65, 78, 21, 86, 5, 35, 60, 76, 17, 51, 8, 10, 53],0,[65, 78, 21, 86, 5, 35, 60, 76, 17, 51, 8, 10, 53]).
f([22, 22, 30, 83, 85, 94, 68, 75, 27, 77, 46, 33, 56, 94, 58],0,[30, 83, 85, 94, 68, 75, 27, 77, 46, 33, 56, 94, 58]).
f([36, 30, 77, 7, 94, 32, 57],2,[36, 30, 77, 7, 94, 32, 57]).
f([94, 19, 26, 75, 44],1,[75, 44]).
f([85, 34, 77, 80, 80, 8, 53, 54, 4, 19, 71, 6, 70, 82, 43, 71, 79, 94, 51, 76, 56, 19, 91, 23, 45, 50, 2, 8, 39, 42, 19],13,[8, 39, 42, 19]).
f([26, 53, 96, 22, 36, 32, 34, 17, 14, 62, 38, 74, 18, 5, 35, 63, 53, 24, 84, 83, 60],17,[63, 53, 24, 84, 83, 60]).
f([27, 25, 86, 53, 78, 50, 47, 24, 36, 58, 42, 1, 73, 90, 86, 59, 97],8,[27, 25, 86, 53, 78, 50, 47, 24, 36, 58, 42, 1, 73, 90, 86, 59, 97]).
f([92, 68, 55, 5, 92, 31, 26, 38, 1, 85, 40, 78, 64, 71, 25, 28, 82, 90, 25, 38, 30, 76, 35, 75, 90, 84, 91, 28, 68, 78, 101, 27, 57, 37, 73, 87, 3],27,[1, 85, 40, 78, 64, 71, 25, 28, 82, 90, 25, 38, 30, 76, 35, 75, 90, 84, 91, 28, 68, 78, 101, 27, 57, 37, 73, 87, 3]).
f([26, 81, 57, 51, 56, 25, 32, 90, 25, 36, 60, 74, 72, 91, 84, 59, 28, 82, 7, 66, 20, 28, 15, 89, 20, 31, 8, 47, 57, 40, 78, 9, 20, 31, 83, 72, 27, 89, 90, 95, 38, 46, 22, 72],35,[31, 83, 72, 27, 89, 90, 95, 38, 46, 22, 72]).
f([57, 38, 71, 38, 86, 69, 10, 73, 48, 33, 87, 84, 18, 21, 101, 91, 53, 96, 49, 26, 71, 75, 79, 20, 82, 83, 70],16,[21, 101, 91, 53, 96, 49, 26, 71, 75, 79, 20, 82, 83, 70]).
f([76, 62],2,[62]).
:-end_in_neg.