:- use_module(library(aleph)).
:- if(current_predicate(use_rendering/1)).
:- use_rendering(prolog).
:- endif.
:- aleph.
:-style_check(-discontiguous).

:- aleph_set(verbosity, 0).
:- aleph_set(interactive, false).
:- aleph_set(i,6).
:- aleph_set(clauselength,7).
:- aleph_set(nodes,30000).

:- modeb(*,edge(-node,-node)).
:- modeb(*,colour(+node,-colour)).
:- modeb(*,red(+colour)).
:- modeb(*,green(+colour)).

:- modeh(*,f(+node,-node)).

:- determination(f/2,edge/2).
:- determination(f/2,colour/2).
:- determination(f/2,red/1).
:- determination(f/2,green/1).
:- determination(f/2,f/2).

:-begin_bg.

:-style_check(-discontiguous).

:-table (f/2) as incremental.
:-dynamic([f/2], [incremental(true)]).

:-table (f/1) as incremental.
:-dynamic([f/1], [incremental(true)]).

red(red).
green(green).

diff(A,B) :- \+(A=B).

colour(n_2039_0,red).
colour(n_2039_1,red).
colour(n_2039_0,red).
colour(n_2039_1,red).
colour(n_2039_0,red).
colour(n_2039_1,red).
colour(n_2039_0,red).
colour(n_2039_1,red).
colour(n_2039_0,red).
colour(n_2039_1,red).
colour(n_2039_0,red).
colour(n_2039_1,red).
colour(n_2039_0,red).
colour(n_2039_1,red).
colour(n_2039_0,red).
colour(n_2039_1,red).
colour(n_2039_0,red).
colour(n_2039_1,red).
colour(n_2039_0,red).
colour(n_2039_1,red).
colour(n_2039_0,red).
colour(n_2039_1,red).
colour(n_2039_0,red).
colour(n_2039_1,red).
colour(n_2039_0,red).
colour(n_2039_1,red).
colour(n_2039_0,red).
colour(n_2039_1,red).
colour(n_2039_0,red).
colour(n_2039_1,red).
colour(n_2039_0,red).
colour(n_2039_1,red).
colour(n_2039_0,red).
colour(n_2039_1,red).
colour(n_2039_0,red).
colour(n_2039_1,red).
colour(n_2039_0,red).
colour(n_2039_1,red).
colour(n_2039_0,red).
colour(n_2039_1,red).
colour(n_2039_0,red).
colour(n_2039_1,red).
colour(n_2039_0,red).
colour(n_2039_1,red).
colour(n_2039_0,red).
colour(n_2039_1,red).
colour(n_2039_0,red).
colour(n_2039_1,red).
colour(n_2039_0,red).
colour(n_2039_1,red).
colour(n_2039_0,red).
colour(n_2039_1,red).
colour(n_2039_0,red).
colour(n_2039_1,red).
colour(n_2039_0,red).
colour(n_2039_1,red).
colour(n_2039_0,red).
colour(n_2039_1,red).
colour(n_2039_0,red).
colour(n_2039_1,red).
colour(n_2039_0,red).
colour(n_2039_1,red).
colour(n_2039_0,red).
colour(n_2039_1,red).
colour(n_2039_0,red).
colour(n_2039_1,red).
colour(n_2039_0,red).
colour(n_2039_1,red).
colour(n_2039_0,red).
colour(n_2039_1,red).
colour(n_2039_0,red).
colour(n_2039_1,red).
colour(n_2039_0,red).
colour(n_2039_1,red).
colour(n_2039_0,red).
colour(n_2039_1,red).
colour(n_2039_0,red).
colour(n_2039_1,red).
colour(n_2039_0,red).
colour(n_2039_1,red).
:-end_bg.
:-begin_in_pos.
f(n_0_1, n_0_8).
f(n_1_16, n_1_5).
f(n_2_21, n_2_10).
f(n_3_18, n_3_3).
f(n_4_24, n_4_29).
f(n_5_4, n_5_6).
f(n_6_13, n_6_7).
f(n_7_12, n_7_8).
f(n_8_3, n_8_8).
f(n_9_19, n_9_17).
f(n_10_7, n_10_6).
f(n_11_19, n_11_35).
f(n_12_38, n_12_4).
f(n_13_14, n_13_41).
f(n_14_29, n_14_38).
f(n_15_27, n_15_21).
f(n_16_25, n_16_14).
f(n_17_5, n_17_0).
f(n_18_24, n_18_23).
f(n_19_0, n_19_2).
:-end_in_pos.
:-begin_in_neg.
f(n_20_8, n_20_9).
f(n_21_12, n_21_19).
f(n_22_26, n_22_12).
f(n_23_1, n_23_0).
f(n_24_2, n_24_1).
f(n_25_23, n_25_19).
f(n_26_34, n_26_0).
f(n_27_10, n_27_18).
f(n_28_23, n_28_14).
f(n_29_0, n_29_25).
f(n_30_6, n_30_7).
f(n_31_33, n_31_42).
f(n_32_1, n_32_0).
f(n_33_24, n_33_17).
f(n_34_0, n_34_5).
f(n_35_19, n_35_2).
f(n_36_1, n_36_0).
f(n_37_4, n_37_2).
f(n_38_5, n_38_23).
f(n_39_7, n_39_3).
:-end_in_neg.
