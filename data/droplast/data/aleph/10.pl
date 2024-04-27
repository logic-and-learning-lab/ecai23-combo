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
%% :- determination(f/2,increment/2).
%% :- determination(f/2,element/2).
:- determination(f/2,cons/3).
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
f([60, 56, 96, 76, 25, 65, 3, 83, 89, 62, 50, 70],[60, 56, 96, 76, 25, 65, 3, 83, 89, 62, 50]).
f([50, 75, 98, 29, 59, 76, 27, 73, 29, 57],[50, 75, 98, 29, 59, 76, 27, 73, 29]).
f([73, 98, 78, 11, 60, 26],[73, 98, 78, 11, 60]).
f([89, 54, 95, 24, 57, 21, 100, 98, 38, 40, 61, 29, 13, 24, 70, 90, 61, 65, 10, 25, 55, 35, 68, 43, 82, 4, 31, 16],[89, 54, 95, 24, 57, 21, 100, 98, 38, 40, 61, 29, 13, 24, 70, 90, 61, 65, 10, 25, 55, 35, 68, 43, 82, 4, 31]).
f([34, 73, 69, 1, 34, 90, 64, 3, 10, 34, 73, 82, 31, 86, 89, 32],[34, 73, 69, 1, 34, 90, 64, 3, 10, 34, 73, 82, 31, 86, 89]).
f([96, 43, 59, 22, 59, 79, 86, 27, 70, 58, 8, 19, 39, 62, 93, 57, 67, 99, 17],[96, 43, 59, 22, 59, 79, 86, 27, 70, 58, 8, 19, 39, 62, 93, 57, 67, 99]).
f([67, 69, 29, 83, 72, 54, 27, 26, 65, 38, 68, 84, 27, 29, 47, 8, 47, 51, 78, 76, 2],[67, 69, 29, 83, 72, 54, 27, 26, 65, 38, 68, 84, 27, 29, 47, 8, 47, 51, 78, 76]).
f([15, 80, 46, 48, 71, 43, 61, 4, 44, 56, 76, 26],[15, 80, 46, 48, 71, 43, 61, 4, 44, 56, 76]).
f([79, 61, 5, 71, 83, 66, 95, 74, 71, 11],[79, 61, 5, 71, 83, 66, 95, 74, 71]).
f([92, 86, 64, 4, 47, 42, 94, 83, 72, 59, 43, 25, 41, 41, 36, 84, 9, 21, 39, 87, 29, 71, 76, 55, 87, 64, 1, 97, 70, 54, 48, 50, 95, 70, 64, 99, 68, 85, 45, 32, 95, 50, 14, 88, 27, 22, 15, 53, 87, 37],[92, 86, 64, 4, 47, 42, 94, 83, 72, 59, 43, 25, 41, 41, 36, 84, 9, 21, 39, 87, 29, 71, 76, 55, 87, 64, 1, 97, 70, 54, 48, 50, 95, 70, 64, 99, 68, 85, 45, 32, 95, 50, 14, 88, 27, 22, 15, 53, 87]).
f([8, 87, 62, 9, 95, 17, 97, 17, 1, 29],[8, 87, 62, 9, 95, 17, 97, 17, 1]).
f([65, 93, 9, 18, 29, 36, 48, 22, 30, 72, 55, 41, 79, 8, 37, 43, 94, 24, 68, 56, 90, 76, 38, 64, 84, 59, 37],[65, 93, 9, 18, 29, 36, 48, 22, 30, 72, 55, 41, 79, 8, 37, 43, 94, 24, 68, 56, 90, 76, 38, 64, 84, 59]).
f([80, 3, 67, 70, 28, 45, 43, 42, 97, 78, 71, 10, 93, 33, 100, 98, 61, 28, 91, 38, 3, 65, 40, 56, 95, 3, 46, 42, 62, 50, 94, 52, 49, 9, 88],[80, 3, 67, 70, 28, 45, 43, 42, 97, 78, 71, 10, 93, 33, 100, 98, 61, 28, 91, 38, 3, 65, 40, 56, 95, 3, 46, 42, 62, 50, 94, 52, 49, 9]).
f([22, 7, 97, 22, 42, 49, 81, 56, 37],[22, 7, 97, 22, 42, 49, 81, 56]).
f([49, 8, 3, 43, 95, 58, 13, 50, 55, 46, 50, 65, 75, 87, 60, 82, 29, 76, 86, 26, 68, 21, 27, 47, 95, 28, 60, 21, 58, 84, 79, 6, 2, 21, 85, 75, 12, 67, 47, 55, 85, 95, 28, 24, 98, 30, 49],[49, 8, 3, 43, 95, 58, 13, 50, 55, 46, 50, 65, 75, 87, 60, 82, 29, 76, 86, 26, 68, 21, 27, 47, 95, 28, 60, 21, 58, 84, 79, 6, 2, 21, 85, 75, 12, 67, 47, 55, 85, 95, 28, 24, 98, 30]).
f([54, 21, 79, 51, 87, 71, 73, 21, 40, 97, 66],[54, 21, 79, 51, 87, 71, 73, 21, 40, 97]).
f([16, 53, 40, 39, 20, 57, 13, 17, 11, 60, 91, 43, 60, 26, 16, 84, 67, 62, 46, 5, 58, 12, 50, 44],[16, 53, 40, 39, 20, 57, 13, 17, 11, 60, 91, 43, 60, 26, 16, 84, 67, 62, 46, 5, 58, 12, 50]).
f([98, 93, 58, 34, 40, 9, 99, 28, 31, 12, 59, 84, 96, 25],[98, 93, 58, 34, 40, 9, 99, 28, 31, 12, 59, 84, 96]).
f([66, 92, 46, 93, 32, 83, 10, 36, 66, 69, 101, 75, 93, 39, 25, 46, 66, 35, 11, 66, 10, 22, 86, 95, 72, 98, 68, 96, 39, 67, 81, 24, 58, 2, 68, 68, 48, 3, 60, 16, 72, 58],[66, 92, 46, 93, 32, 83, 10, 36, 66, 69, 101, 75, 93, 39, 25, 46, 66, 35, 11, 66, 10, 22, 86, 95, 72, 98, 68, 96, 39, 67, 81, 24, 58, 2, 68, 68, 48, 3, 60, 16, 72]).
f([49, 33, 84, 5, 61, 54, 100],[49, 33, 84, 5, 61, 54]).
:-end_in_pos.
:-begin_in_neg.
f([69, 26, 15, 52, 23, 42, 52, 93, 15, 48, 43, 78, 84, 84, 30, 34, 87, 74, 84, 16, 43, 8, 55, 21, 28, 61, 77, 91, 65, 58, 33, 60, 29, 63, 86, 35, 94, 68, 67, 18, 52, 49, 56, 73],[69, 26, 15, 52, 23, 42, 52, 93, 15, 48, 43, 78, 84, 84, 30, 34, 87, 74, 84, 16, 43, 8, 55, 21, 28, 61, 77, 91, 65, 58, 33, 60, 29, 63, 86, 35, 94, 68, 67, 18, 52, 49, 56, 73]).
f([29, 96, 101, 2, 66],[29, 96, 101, 2, 66]).
f([83, 24, 17, 86, 78, 50, 7, 33, 63, 39, 32, 67, 25, 16, 66, 16, 64, 61, 87, 39, 98, 73, 30, 28, 69, 38, 99, 91, 44, 77, 34, 95, 63, 95, 74, 47, 89, 8, 31],[83, 24, 17, 86, 78, 50, 7, 33, 63, 39, 32, 67, 25, 16, 66, 16, 64, 61, 87, 39, 98, 73, 30, 28, 69, 38, 99, 91, 44, 77, 34, 95, 63, 95, 74, 47, 89, 8, 31]).
f([83, 74, 26, 25],[83, 74, 26, 25]).
f([19, 45, 77, 58, 28, 31],[19, 45, 77, 58, 28, 31]).
f([22, 53, 95, 4],[22, 53, 95, 4]).
f([56, 63, 49, 68, 71, 54, 79, 3, 16, 7, 66, 27, 28, 48, 29, 48, 34, 74, 84, 38, 11, 1, 68, 38, 51, 85, 11, 31, 56, 100, 72, 100, 31, 61, 2, 19, 17, 68, 24, 42, 8],[56, 63, 49, 68, 71, 54, 79, 3, 16, 7, 66, 27, 28, 48, 29, 48, 34, 74, 84, 38, 11, 1, 68, 38, 51, 85, 11, 31, 56, 100, 72, 100, 31, 61, 2, 19, 17, 68, 24, 42, 8]).
f([77, 76, 82, 88, 17, 44, 74, 64, 69, 97, 52, 20, 34, 34, 44, 19, 90, 73, 59, 87, 10, 40, 39, 91, 68, 64, 67, 78, 8, 59, 25, 92, 20, 50, 86, 84, 87, 44],[77, 76, 82, 88, 17, 44, 74, 64, 69, 97, 52, 20, 34, 34, 44, 19, 90, 73, 59, 87, 10, 40, 39, 91, 68, 64, 67, 78, 8, 59, 25, 92, 20, 50, 86, 84, 87, 44]).
f([13, 19, 6, 74, 3, 29, 71, 71, 10, 82],[13, 19, 6, 74, 3, 29, 71, 71, 10, 82]).
f([1, 14, 39, 72, 43, 12, 15, 97, 22, 29, 77, 92, 78, 94, 97, 60, 89, 79, 34, 21, 66, 49, 29, 61, 98, 89, 18, 24, 39, 32, 97, 10, 19, 61, 24, 96, 37, 1, 70, 45, 49, 77, 40, 57],[1, 14, 39, 72, 43, 12, 15, 97, 22, 29, 77, 92, 78, 94, 97, 60, 89, 79, 34, 21, 66, 49, 29, 61, 98, 89, 18, 24, 39, 32, 97, 10, 19, 61, 24, 96, 37, 1, 70, 45, 49, 77, 40, 57]).
f([24, 43, 72, 80, 76, 28, 28, 99, 13, 91, 72, 21, 30, 40, 24, 93, 86, 28, 64, 14, 73, 49, 10, 52, 69, 12, 66],[24, 43, 72, 80, 76, 28, 28, 99, 13, 91, 72, 21, 30, 40, 24, 93, 86, 28, 64, 14, 73, 49, 10, 52, 69, 12, 66]).
f([97, 71, 57, 23, 42, 99, 83, 93],[97, 71, 57, 23, 42, 99, 83, 93]).
f([96, 37, 43, 82, 21, 37, 34, 64, 1, 34, 85, 39, 34, 83, 65, 101, 95, 94, 5, 19, 16, 39, 79, 16, 44, 55, 7, 22, 52, 70, 49, 21, 49, 33, 92, 36, 11, 13, 73, 57, 58, 12, 85, 76, 75, 49, 76, 64, 98, 35, 2],[96, 37, 43, 82, 21, 37, 34, 64, 1, 34, 85, 39, 34, 83, 65, 101, 95, 94, 5, 19, 16, 39, 79, 16, 44, 55, 7, 22, 52, 70, 49, 21, 49, 33, 92, 36, 11, 13, 73, 57, 58, 12, 85, 76, 75, 49, 76, 64, 98, 35, 2]).
f([33, 60, 18, 74, 17, 21, 32, 64, 13, 76, 40, 12, 97, 56, 12, 58, 30, 3, 37, 61, 9, 49, 101, 22, 89, 19, 9, 12, 75, 87, 44, 88, 77, 88, 67, 81, 66],[33, 60, 18, 74, 17, 21, 32, 64, 13, 76, 40, 12, 97, 56, 12, 58, 30, 3, 37, 61, 9, 49, 101, 22, 89, 19, 9, 12, 75, 87, 44, 88, 77, 88, 67, 81, 66]).
f([23, 25, 17, 43, 88, 70, 22, 11, 93, 22, 57, 7, 36, 26, 37, 41, 68, 73, 45, 57, 8, 11, 47, 82, 65, 44, 66, 48, 63, 92, 19, 29, 15],[23, 25, 17, 43, 88, 70, 22, 11, 93, 22, 57, 7, 36, 26, 37, 41, 68, 73, 45, 57, 8, 11, 47, 82, 65, 44, 66, 48, 63, 92, 19, 29, 15]).
f([23, 84, 36, 49, 13, 66, 6, 2, 22, 89, 64, 61, 77, 42, 69, 19, 81, 12, 76, 89, 53, 82, 20, 74, 100, 82, 61, 94, 49],[23, 84, 36, 49, 13, 66, 6, 2, 22, 89, 64, 61, 77, 42, 69, 19, 81, 12, 76, 89, 53, 82, 20, 74, 100, 82, 61, 94, 49]).
f([56, 94, 83, 89, 86, 98, 73, 24, 20, 76, 36, 26, 14, 76, 95, 86, 2, 7, 14, 46, 83, 1, 91, 59],[56, 94, 83, 89, 86, 98, 73, 24, 20, 76, 36, 26, 14, 76, 95, 86, 2, 7, 14, 46, 83, 1, 91, 59]).
f([11, 89, 65, 29, 18, 52, 91, 4],[11, 89, 65, 29, 18, 52, 91, 4]).
f([15, 93, 44, 21, 92, 26, 91, 39, 39, 48, 68, 53, 28, 101, 8, 6, 4, 18, 85, 90, 95, 8, 98, 44, 58, 63, 100, 83, 90, 43, 65, 38, 39, 16, 66, 35, 81, 101, 11, 17, 65, 90, 4],[15, 93, 44, 21, 92, 26, 91, 39, 39, 48, 68, 53, 28, 101, 8, 6, 4, 18, 85, 90, 95, 8, 98, 44, 58, 63, 100, 83, 90, 43, 65, 38, 39, 16, 66, 35, 81, 101, 11, 17, 65, 90, 4]).
f([23, 48, 36, 6, 36, 93, 16, 88, 5, 60, 69, 48, 6, 64, 69, 11, 24, 88, 83, 16, 100, 99, 52, 47, 21, 74, 80],[23, 48, 36, 6, 36, 93, 16, 88, 5, 60, 69, 48, 6, 64, 69, 11, 24, 88, 83, 16, 100, 99, 52, 47, 21, 74, 80]).
:-end_in_neg.