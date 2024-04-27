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
:- determination(f/1,diff/2).


:- modeb(*,diff(+node,+node)).

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
edge(n_2039_0,n_2039_1).
edge(n_2039_0,n_2039_2).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
edge(n_2039_0,n_2039_1).
edge(n_2039_0,n_2039_2).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
edge(n_2039_0,n_2039_1).
edge(n_2039_0,n_2039_2).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
edge(n_2039_0,n_2039_1).
edge(n_2039_0,n_2039_2).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
edge(n_2039_0,n_2039_1).
edge(n_2039_0,n_2039_2).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
edge(n_2039_0,n_2039_1).
edge(n_2039_0,n_2039_2).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
edge(n_2039_0,n_2039_1).
edge(n_2039_0,n_2039_2).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
edge(n_2039_0,n_2039_1).
edge(n_2039_0,n_2039_2).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
edge(n_2039_0,n_2039_1).
edge(n_2039_0,n_2039_2).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
edge(n_2039_0,n_2039_1).
edge(n_2039_0,n_2039_2).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
edge(n_2039_0,n_2039_1).
edge(n_2039_0,n_2039_2).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
edge(n_2039_0,n_2039_1).
edge(n_2039_0,n_2039_2).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
edge(n_2039_0,n_2039_1).
edge(n_2039_0,n_2039_2).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
edge(n_2039_0,n_2039_1).
edge(n_2039_0,n_2039_2).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
edge(n_2039_0,n_2039_1).
edge(n_2039_0,n_2039_2).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
edge(n_2039_0,n_2039_1).
edge(n_2039_0,n_2039_2).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
edge(n_2039_0,n_2039_1).
edge(n_2039_0,n_2039_2).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
edge(n_2039_0,n_2039_1).
edge(n_2039_0,n_2039_2).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
edge(n_2039_0,n_2039_1).
edge(n_2039_0,n_2039_2).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
edge(n_2039_0,n_2039_1).
edge(n_2039_0,n_2039_2).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
edge(n_2039_0,n_2039_1).
edge(n_2039_0,n_2039_2).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
edge(n_2039_0,n_2039_1).
edge(n_2039_0,n_2039_2).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
edge(n_2039_0,n_2039_1).
edge(n_2039_0,n_2039_2).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
edge(n_2039_0,n_2039_1).
edge(n_2039_0,n_2039_2).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
edge(n_2039_0,n_2039_1).
edge(n_2039_0,n_2039_2).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
edge(n_2039_0,n_2039_1).
edge(n_2039_0,n_2039_2).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
edge(n_2039_0,n_2039_1).
edge(n_2039_0,n_2039_2).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
edge(n_2039_0,n_2039_1).
edge(n_2039_0,n_2039_2).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
edge(n_2039_0,n_2039_1).
edge(n_2039_0,n_2039_2).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
edge(n_2039_0,n_2039_1).
edge(n_2039_0,n_2039_2).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
edge(n_2039_0,n_2039_1).
edge(n_2039_0,n_2039_2).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
edge(n_2039_0,n_2039_1).
edge(n_2039_0,n_2039_2).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
edge(n_2039_0,n_2039_1).
edge(n_2039_0,n_2039_2).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
edge(n_2039_0,n_2039_1).
edge(n_2039_0,n_2039_2).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
edge(n_2039_0,n_2039_1).
edge(n_2039_0,n_2039_2).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
edge(n_2039_0,n_2039_1).
edge(n_2039_0,n_2039_2).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
edge(n_2039_0,n_2039_1).
edge(n_2039_0,n_2039_2).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
edge(n_2039_0,n_2039_1).
edge(n_2039_0,n_2039_2).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
edge(n_2039_0,n_2039_1).
edge(n_2039_0,n_2039_2).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
edge(n_2039_0,n_2039_1).
edge(n_2039_0,n_2039_2).
:-end_bg.
:-begin_in_pos.
f(n_0_24).
f(n_1_1).
f(n_2_18).
f(n_3_0).
f(n_4_3).
f(n_5_20).
f(n_6_2).
f(n_7_12).
f(n_8_0).
f(n_9_5).
f(n_10_43).
f(n_11_6).
f(n_12_6).
f(n_13_1).
f(n_14_16).
f(n_15_1).
f(n_16_9).
f(n_17_37).
f(n_18_38).
f(n_19_13).
:-end_in_pos.
:-begin_in_neg.
f(n_20_0).
f(n_21_0).
f(n_22_2).
f(n_23_1).
f(n_24_1).
f(n_25_0).
f(n_26_0).
f(n_27_2).
f(n_28_2).
f(n_29_7).
f(n_30_1).
f(n_31_1).
f(n_32_1).
f(n_33_1).
f(n_34_0).
f(n_35_3).
f(n_36_5).
f(n_37_1).
f(n_38_0).
f(n_39_4).
:-end_in_neg.
