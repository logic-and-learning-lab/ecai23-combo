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
:- modeb(*,f(+node,-node)).

:- determination(f/2,edge/2).
:- determination(f/2,colour/2).
:- determination(f/2,red/1).
:- determination(f/2,green/1).
:- determination(f/2,diff/2).

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

colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
:-end_bg.
:-begin_in_pos.
f(n_0_10, n_0_7).
f(n_1_0, n_1_3).
f(n_2_20, n_2_13).
f(n_3_15, n_3_9).
f(n_4_1, n_4_9).
f(n_5_10, n_5_6).
f(n_6_29, n_6_14).
f(n_7_12, n_7_12).
f(n_8_13, n_8_7).
f(n_9_4, n_9_16).
f(n_10_41, n_10_3).
f(n_11_0, n_11_3).
f(n_12_5, n_12_5).
f(n_13_18, n_13_6).
f(n_14_34, n_14_14).
f(n_15_0, n_15_16).
f(n_16_13, n_16_7).
f(n_17_0, n_17_5).
f(n_18_2, n_18_0).
f(n_19_5, n_19_2).
:-end_in_pos.
:-begin_in_neg.
f(n_20_36, n_20_0).
f(n_21_6, n_21_13).
f(n_22_7, n_22_8).
f(n_23_1, n_23_2).
f(n_24_3, n_24_0).
f(n_25_17, n_25_19).
f(n_26_0, n_26_21).
f(n_27_37, n_27_12).
f(n_28_5, n_28_25).
f(n_29_0, n_29_4).
f(n_30_9, n_30_19).
f(n_31_33, n_31_7).
f(n_32_8, n_32_29).
f(n_33_40, n_33_42).
f(n_34_4, n_34_0).
f(n_35_22, n_35_15).
f(n_36_29, n_36_28).
f(n_37_13, n_37_4).
f(n_38_32, n_38_8).
f(n_39_2, n_39_8).
:-end_in_neg.
