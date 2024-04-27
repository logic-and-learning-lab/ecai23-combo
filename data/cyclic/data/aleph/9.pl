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

:- modeh(*,f(+node)).
:- modeb(*,f(+node)).

:- determination(f/1,edge/2).
:- determination(f/1,colour/2).
:- determination(f/1,red/1).
:- determination(f/1,green/1).
:- determination(f/1,f/1).

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
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_0,green).
colour(n_2039_1,green).
:-end_bg.
:-begin_in_pos.
f(n_0_32).
f(n_1_35).
f(n_2_2).
f(n_3_15).
f(n_4_0).
f(n_5_18).
f(n_6_0).
f(n_7_2).
f(n_8_1).
f(n_9_8).
f(n_10_46).
f(n_11_31).
f(n_12_10).
f(n_13_18).
f(n_14_28).
f(n_15_10).
f(n_16_17).
f(n_17_4).
f(n_18_21).
f(n_19_0).
:-end_in_pos.
:-begin_in_neg.
f(n_20_8).
f(n_21_13).
f(n_22_0).
f(n_23_5).
f(n_24_17).
f(n_25_6).
f(n_26_9).
f(n_27_2).
f(n_28_6).
f(n_29_10).
f(n_30_10).
f(n_31_21).
f(n_32_17).
f(n_33_30).
f(n_34_4).
f(n_35_1).
f(n_36_15).
f(n_37_4).
f(n_38_16).
f(n_39_4).
:-end_in_neg.
