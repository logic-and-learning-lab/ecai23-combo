:- use_module(library(aleph)).
:- if(current_predicate(use_rendering/1)).
:- use_rendering(prolog).
:- endif.
:- aleph.
:-style_check(-discontiguous).

:- aleph_set(i,6).
:- aleph_set(clauselength,9).
:- aleph_set(nodes,50000).

:-modeh(*,goal(+ex,+agent,+int)).
:-modeb(*,my_input(-agent,-action)).
:-modeb(*,my_true(+ex,-prop)).
:-modeb(*,my_succ(-prop,-prop)).
:-modeb(*,role(-agent)).
:-modeb(*,prop_p(-prop)).
:-modeb(*,prop_q(-prop)).
:-modeb(*,prop_r(-prop)).
:-modeb(*,prop_1(-prop)).
:-modeb(*,prop_2(-prop)).
:-modeb(*,prop_3(-prop)).
:-modeb(*,prop_4(-prop)).
:-modeb(*,prop_5(-prop)).
:-modeb(*,prop_6(-prop)).
:-modeb(*,prop_7(-prop)).
:-modeb(*,action_a(-action)).
:-modeb(*,action_b(-action)).
:-modeb(*,action_c(-action)).
:-modeb(*,not_my_true(-ex,prop)).
:-modeb(*,int_0(-int)).
:-modeb(*,int_100(-int)).

:- determination(goal/3,my_input/2).
:- determination(goal/3,my_true/2).
:- determination(goal/3,my_succ/2).
:- determination(goal/3,role/1).
:- determination(goal/3,prop_p/1).
:- determination(goal/3,prop_q/1).
:- determination(goal/3,prop_r/1).
:- determination(goal/3,prop_1/1).
:- determination(goal/3,prop_2/1).
:- determination(goal/3,prop_3/1).
:- determination(goal/3,prop_4/1).
:- determination(goal/3,prop_5/1).
:- determination(goal/3,prop_6/1).
:- determination(goal/3,prop_7/1).
:- determination(goal/3,action_a/1).
:- determination(goal/3,action_b/1).
:- determination(goal/3,action_c/1).
:- determination(goal/3,not_my_true/2).
:- determination(goal/3,int_0/1).
:- determination(goal/3,int_100/1).


:-begin_bg.
%% does(A,B,C):- false.

prop_p(p).
prop_q(q).
prop_r(r).
prop_1(1).
prop_2(2).
prop_3(3).
prop_4(4).
prop_5(5).
prop_6(6).
prop_7(7).

action_a(a).
action_b(b).
action_c(c).

my_succ(1,2).
my_succ(2,3).
my_succ(3,4).
my_succ(4,5).
my_succ(5,6).
my_succ(6,7).

prop(p).
prop(q).
prop(r).

not_my_true(1,p).
not_my_true(1,q).
not_my_true(1,r).
not_my_true(10,p).
not_my_true(10,r).
not_my_true(11,p).
not_my_true(11,q).
not_my_true(11,r).
not_my_true(12,q).
not_my_true(13,p).
not_my_true(13,q).
not_my_true(14,q).
not_my_true(14,r).
not_my_true(15,p).
not_my_true(15,q).
not_my_true(15,r).
not_my_true(16,p).
not_my_true(16,q).
not_my_true(16,r).
not_my_true(17,q).
not_my_true(17,r).
not_my_true(18,p).
not_my_true(18,q).
not_my_true(18,r).
not_my_true(19,p).
not_my_true(2,q).
not_my_true(2,r).
not_my_true(20,p).
not_my_true(20,q).
not_my_true(21,q).
not_my_true(3,p).
not_my_true(3,r).
not_my_true(4,p).
not_my_true(4,q).
not_my_true(4,r).
not_my_true(5,r).
not_my_true(6,p).
not_my_true(6,q).
not_my_true(7,q).
not_my_true(7,r).
not_my_true(8,p).
not_my_true(8,q).
not_my_true(9,r).

role(robot).
my_input(robot,a).
my_input(robot,b).
my_input(robot,c).

int_0(0).
int_1(1).
int_2(2).
int_3(3).
int_4(4).
int_5(5).
int_6(6).
int_7(7).
int_8(8).
int_9(9).
int_10(10).
int_11(11).
int_12(12).
int_13(13).
int_14(14).
int_15(15).
int_16(16).
int_17(17).
int_18(18).
int_19(19).
int_20(20).
int_21(21).
int_22(22).
int_23(23).
int_24(24).
int_25(25).
int_26(26).
int_27(27).
int_28(28).
int_29(29).
int_30(30).
int_31(31).
int_32(32).
int_33(33).
int_34(34).
int_35(35).
int_36(36).
int_37(37).
int_38(38).
int_39(39).
int_40(40).
int_41(41).
int_42(42).
int_43(43).
int_44(44).
int_45(45).
int_46(46).
int_47(47).
int_48(48).
int_49(49).
int_50(50).
int_51(51).
int_52(52).
int_53(53).
int_54(54).
int_55(55).
int_56(56).
int_57(57).
int_58(58).
int_59(59).
int_60(60).
int_61(61).
int_62(62).
int_63(63).
int_64(64).
int_65(65).
int_66(66).
int_67(67).
int_68(68).
int_69(69).
int_70(70).
int_71(71).
int_72(72).
int_73(73).
int_74(74).
int_75(75).
int_76(76).
int_77(77).
int_78(78).
int_79(79).
int_80(80).
int_81(81).
int_82(82).
int_83(83).
int_84(84).
int_85(85).
int_86(86).
int_87(87).
int_88(88).
int_89(89).
int_90(90).
int_91(91).
int_92(92).
int_93(93).
int_94(94).
int_95(95).
int_96(96).
int_97(97).
int_98(98).
int_99(99).
int_100(100).

my_true(1,1).
my_true(10,3).
my_true(10,q).
my_true(11,4).
my_true(12,5).
my_true(12,p).
my_true(12,r).
my_true(13,4).
my_true(13,r).
my_true(14,4).
my_true(14,p).
my_true(15,6).
my_true(16,5).
my_true(17,5).
my_true(17,p).
my_true(18,2).
my_true(19,7).
my_true(19,q).
my_true(19,r).
my_true(2,7).
my_true(2,p).
my_true(20,5).
my_true(20,r).
my_true(21,6).
my_true(21,p).
my_true(21,r).
my_true(22,7).
my_true(22,p).
my_true(22,q).
my_true(22,r).
my_true(3,7).
my_true(3,q).
my_true(4,7).
my_true(5,6).
my_true(5,p).
my_true(5,q).
my_true(6,7).
my_true(6,r).
my_true(7,6).
my_true(7,p).
my_true(8,6).
my_true(8,r).
my_true(9,5).
my_true(9,p).
my_true(9,q).
:-end_bg.

:-begin_in_pos.
goal(1,robot,0).
goal(10,robot,0).
goal(11,robot,0).
goal(12,robot,0).
goal(13,robot,0).
goal(14,robot,0).
goal(15,robot,0).
goal(16,robot,0).
goal(17,robot,0).
goal(18,robot,0).
goal(19,robot,0).
goal(2,robot,0).
goal(20,robot,0).
goal(21,robot,0).
goal(22,robot,100).
goal(3,robot,0).
goal(4,robot,0).
goal(5,robot,0).
goal(6,robot,0).
goal(7,robot,0).
goal(8,robot,0).
goal(9,robot,0).
:-end_in_pos.

:-begin_in_neg.
goal(1,robot,100).
goal(10,robot,100).
goal(11,robot,100).
goal(12,robot,100).
goal(13,robot,100).
goal(14,robot,100).
goal(15,robot,100).
goal(16,robot,100).
goal(17,robot,100).
goal(18,robot,100).
goal(19,robot,100).
goal(2,robot,100).
goal(20,robot,100).
goal(21,robot,100).
goal(22,robot,0).
goal(3,robot,100).
goal(4,robot,100).
goal(5,robot,100).
goal(6,robot,100).
goal(7,robot,100).
goal(8,robot,100).
goal(9,robot,100).
:-end_in_neg.