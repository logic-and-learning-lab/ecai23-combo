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
f([59, 69, 19, 27, 95, 16, 22, 67, 31, 88, 50, 24, 58, 37, 44, 11, 61, 68, 55, 99, 82, 79, 30, 76, 50, 15, 93, 87, 57, 5, 91, 52, 10, 67, 63, 48, 54, 34, 40, 44, 6, 63, 41, 86, 91, 47, 42],63).
f([62, 81, 21, 46, 65, 15, 23, 29, 23, 33, 86, 88, 24, 95, 74, 17, 65, 90, 83, 94, 58, 59],65).
f([76, 87, 15, 61, 82, 11, 27, 10, 6, 14, 76, 59, 68, 90, 30, 76, 61, 69, 15, 6, 10, 80, 92, 38, 93, 84, 37],76).
f([17, 17, 96],17).
f([12, 57, 67, 38, 15, 94, 73, 71, 39, 96, 38, 75, 67, 60, 76, 73, 42, 78, 4, 58, 43, 11, 90, 32],73).
f([24, 82, 97, 99, 82, 98, 66, 12, 92, 78, 50, 50, 45, 82, 76, 36, 50, 15, 41, 71, 44, 99, 101, 81],82).
f([4, 97, 97, 82, 5, 69],97).
f([78, 35, 79, 87, 49, 58, 95, 25, 87, 45, 49, 62, 82, 7, 8, 53, 17, 48, 77, 67, 39, 68, 87, 77, 93, 59],87).
f([6, 4, 40, 72, 47, 40, 97, 71, 4, 36],4).
f([66, 70, 66, 59, 57, 66, 29, 29, 34, 53, 68, 97, 36, 96, 49, 98, 27, 66, 42, 31, 86, 28, 11, 8, 98, 12, 76, 25, 32],98).
f([83, 20, 59, 24, 77, 5, 19, 8, 93, 81, 81, 101, 4, 82, 53, 4, 97, 51, 99, 96, 62, 49, 65, 64, 63, 60, 82, 27, 60, 53, 52, 8, 41, 95, 2, 77, 21],8).
f([73, 34, 26, 98, 52, 53, 96, 97, 85, 38, 89, 54, 63, 23, 94, 30, 93, 90, 28, 100, 75, 100, 73, 88, 1, 73, 99, 34, 66],73).
f([43, 78, 16, 56, 6, 6, 55, 27, 59, 94, 35, 43, 89, 93, 88, 25, 64, 84, 20, 22, 12, 97, 17, 46, 97, 73],97).
f([50, 93, 79, 48, 47, 11, 36, 34, 3, 77, 64, 36, 32, 95, 32, 32],32).
f([4, 78, 29, 22, 84, 33, 101, 3, 20, 23, 36, 15, 50, 14, 30, 12, 69, 90, 93, 56, 84, 67, 17, 35, 81, 54, 84, 82, 59, 94, 75, 26, 46, 37, 60, 60, 90, 67, 42, 91, 59, 45, 100, 62, 87, 59, 30, 88, 18, 4],60).
f([92, 50, 55, 55],55).
f([85, 84, 45, 7, 85, 6, 75, 4, 61, 89, 71, 31, 7, 101, 71],85).
f([32, 49, 28, 39, 83, 55, 24, 81, 85, 65, 80, 51, 11, 73, 5, 20, 50, 10, 82, 70, 50, 41, 52, 93, 53, 59, 36, 89, 92, 15, 59, 31, 30, 35, 62, 63, 32, 80, 96, 42, 70, 24, 30, 4, 59],59).
f([27, 75, 71, 63, 29, 6, 5, 12, 30, 2, 36, 39, 46, 17, 33, 70, 18, 56, 42, 66, 45, 15, 39, 33, 71],33).
f([54, 82, 37, 9, 29, 12, 76, 96, 11, 90, 57, 69, 34, 84, 77, 97, 77, 89, 90, 58, 67, 37, 53, 27],77).
:-end_in_pos.
:-begin_in_neg.
f([99, 100, 100, 5, 17, 47, 97, 34, 5, 98, 53, 95, 98, 53, 76, 17, 49, 55, 67],67).
f([74, 84, 2, 96, 28, 24, 91, 12, 84, 54, 8, 28, 93, 87, 77, 53, 95, 81, 94, 91, 24, 89, 79, 56, 38, 13, 22, 90, 21, 6, 20, 27],95).
f([19, 61, 93, 17, 80, 65, 6, 3, 100, 85, 14, 20, 8, 61, 10, 32, 17, 77, 78, 24, 15, 24, 96, 5],32).
f([14, 5, 33, 61, 43, 2, 36, 29, 64, 3, 54, 87, 40, 51, 60, 16, 74, 34, 11, 58, 3, 25, 78, 56, 33, 8, 76, 42, 5, 85, 48, 64, 25, 83, 59, 31, 5, 17, 79, 22, 78, 86, 93, 63, 69, 35, 42, 38, 3, 18, 13],74).
f([66, 6, 1, 66, 89, 34, 5, 8, 53, 60, 89, 42, 57, 101, 35, 71, 52, 48, 49, 42, 51, 44, 64, 49, 29, 69, 66, 71, 29, 72, 74, 67, 16],74).
f([64, 25, 92, 30, 61, 96, 55, 43, 77, 1],96).
f([101, 101, 49, 99, 18, 47, 90, 79, 92, 50, 40, 75, 65],18).
f([6, 90, 19, 21, 36, 56, 72, 78, 57, 38, 23, 59, 19, 11, 36, 87, 67, 82, 55, 91, 93, 63, 21],91).
f([9, 64, 64, 1, 38, 76, 23, 75, 35, 41, 37, 57, 22, 61, 26, 43, 92, 85, 42, 65, 22, 4, 14, 51, 17, 83, 74, 81, 93, 40, 65, 40, 78, 62, 101, 18, 58, 98, 45, 3],23).
f([90, 49, 63, 55, 23, 15, 67, 70, 10, 88, 69, 92, 3, 35, 6, 25, 14, 43, 68, 47, 21, 81, 68, 55, 93, 29],43).
f([76, 23, 10, 51, 61, 40, 8, 54, 16, 101, 97, 94, 39, 2, 52, 82, 19, 50, 42, 92, 51, 22, 76, 2, 63, 93, 98, 39, 38, 97, 25, 43, 61, 14, 66, 25, 14, 80, 24, 39, 38, 68, 50, 9, 72, 99, 7, 73, 9],94).
f([86, 45, 57, 94],57).
f([20, 22, 2, 63, 10, 20, 82, 89, 41, 16, 19, 9, 41, 47, 83, 77, 68, 3, 77, 88, 25, 28, 76, 71, 57, 79, 45, 27, 45, 26, 81, 82, 45, 63, 85, 31, 6, 11, 19, 11, 95, 41, 7, 71, 24, 60, 27, 63, 4, 25],7).
f([39, 14, 85, 40, 87, 88, 68, 72, 74, 16, 57, 54, 27, 10, 101, 41, 68, 27, 97, 46, 96, 33, 62, 6, 52, 9, 11, 92, 10, 80, 96, 49, 60, 21, 66, 40, 26, 39, 87],33).
f([95, 51, 86, 56, 24, 81, 28, 71, 97, 81, 82, 34, 53, 72, 79, 54, 44, 34, 58, 22, 74, 83, 50, 42, 7, 22, 97, 97, 68, 68, 3, 33, 14, 34, 101, 68, 38, 1, 42, 4, 48, 8, 92, 76, 87, 57, 15, 18, 1, 10],51).
f([80, 10, 98, 90, 1, 68, 25, 54, 42, 76, 32, 38, 64, 9, 43, 99, 18, 80, 92, 95, 42, 41, 82, 86, 8, 69, 67, 45, 4, 94],9).
f([57, 9, 54, 91, 28, 99, 21, 73, 90, 34, 32, 44, 41, 52, 98, 48, 40, 21, 23, 56, 50, 35, 21, 12, 100, 83, 6, 37],12).
f([35, 19, 23, 68, 23, 33, 42, 30, 33, 82, 8, 63, 25, 1, 90, 9, 70, 41, 60, 21, 8],70).
f([51, 70, 65, 36, 26, 23, 12, 81, 24, 1, 63, 87, 3, 78, 6, 86, 93, 25, 7, 96, 95, 84, 80, 3, 100, 28, 71, 96, 20, 73, 97, 44, 76, 20, 88, 8, 88, 52, 13, 50],6).
f([91, 93, 8, 20, 19, 54, 5, 33, 25, 86, 67, 78, 54, 79, 68, 98, 46, 7, 75, 85, 22, 49, 65, 96, 14, 26, 9, 31, 63, 62, 90, 1, 27, 71, 68, 19],62).
:-end_in_neg.
