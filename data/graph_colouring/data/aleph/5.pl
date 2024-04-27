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
f(n_0_4).
f(n_1_30).
f(n_2_14).
f(n_3_15).
f(n_4_26).
f(n_5_9).
f(n_6_6).
f(n_7_47).
f(n_8_0).
f(n_9_38).
f(n_10_0).
f(n_11_38).
f(n_12_26).
f(n_13_15).
f(n_14_30).
f(n_15_10).
f(n_16_20).
f(n_17_29).
f(n_18_5).
f(n_19_8).
:-end_in_pos.
:-begin_in_neg.
f(n_20_3).
f(n_21_1).
f(n_22_3).
f(n_23_2).
f(n_24_4).
f(n_25_0).
f(n_26_10).
f(n_27_1).
f(n_28_0).
f(n_29_1).
f(n_30_1).
f(n_31_1).
f(n_32_2).
f(n_33_0).
f(n_34_1).
f(n_35_0).
f(n_36_1).
f(n_37_0).
f(n_38_3).
f(n_39_1).
:-end_in_neg.
