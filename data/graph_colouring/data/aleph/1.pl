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

:- determination(f/1,edge/2).
:- determination(f/1,colour/2).
:- determination(f/1,red/1).
:- determination(f/1,green/1).

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
f(n_0_0).
f(n_1_18).
f(n_2_25).
f(n_3_9).
f(n_4_3).
f(n_5_2).
f(n_6_9).
f(n_7_6).
f(n_8_2).
f(n_9_10).
f(n_10_5).
f(n_11_2).
f(n_12_1).
f(n_13_26).
f(n_14_20).
f(n_15_31).
f(n_16_6).
f(n_17_5).
f(n_18_13).
f(n_19_18).
:-end_in_pos.
:-begin_in_neg.
f(n_20_0).
f(n_21_1).
f(n_22_1).
f(n_23_2).
f(n_24_1).
f(n_25_2).
f(n_26_4).
f(n_27_2).
f(n_28_1).
f(n_29_0).
f(n_30_2).
f(n_31_4).
f(n_32_4).
f(n_33_1).
f(n_34_5).
f(n_35_3).
f(n_36_3).
f(n_37_3).
f(n_38_3).
f(n_39_0).
:-end_in_neg.
