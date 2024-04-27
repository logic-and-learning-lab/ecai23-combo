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
colour(n_2039_3,red).
colour(n_2039_4,green).
colour(n_2039_5,green).
colour(n_2039_6,red).
colour(n_2039_7,red).
colour(n_2039_8,green).
colour(n_2039_9,green).
edge(n_2039_0,n_2039_3).
edge(n_2039_0,n_2039_4).
edge(n_2039_2,n_2039_3).
edge(n_2039_7,n_2039_6).
edge(n_2039_7,n_2039_8).
edge(n_2039_8,n_2039_2).
edge(n_2039_8,n_2039_7).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
colour(n_2039_3,red).
colour(n_2039_4,green).
colour(n_2039_5,green).
colour(n_2039_6,red).
colour(n_2039_7,red).
colour(n_2039_8,green).
colour(n_2039_9,green).
edge(n_2039_0,n_2039_3).
edge(n_2039_0,n_2039_4).
edge(n_2039_2,n_2039_3).
edge(n_2039_7,n_2039_6).
edge(n_2039_7,n_2039_8).
edge(n_2039_8,n_2039_2).
edge(n_2039_8,n_2039_7).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
colour(n_2039_3,red).
colour(n_2039_4,green).
colour(n_2039_5,green).
colour(n_2039_6,red).
colour(n_2039_7,red).
colour(n_2039_8,green).
colour(n_2039_9,green).
edge(n_2039_0,n_2039_3).
edge(n_2039_0,n_2039_4).
edge(n_2039_2,n_2039_3).
edge(n_2039_7,n_2039_6).
edge(n_2039_7,n_2039_8).
edge(n_2039_8,n_2039_2).
edge(n_2039_8,n_2039_7).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
colour(n_2039_3,red).
colour(n_2039_4,green).
colour(n_2039_5,green).
colour(n_2039_6,red).
colour(n_2039_7,red).
colour(n_2039_8,green).
colour(n_2039_9,green).
edge(n_2039_0,n_2039_3).
edge(n_2039_0,n_2039_4).
edge(n_2039_2,n_2039_3).
edge(n_2039_7,n_2039_6).
edge(n_2039_7,n_2039_8).
edge(n_2039_8,n_2039_2).
edge(n_2039_8,n_2039_7).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
colour(n_2039_3,red).
colour(n_2039_4,green).
colour(n_2039_5,green).
colour(n_2039_6,red).
colour(n_2039_7,red).
colour(n_2039_8,green).
colour(n_2039_9,green).
edge(n_2039_0,n_2039_3).
edge(n_2039_0,n_2039_4).
edge(n_2039_2,n_2039_3).
edge(n_2039_7,n_2039_6).
edge(n_2039_7,n_2039_8).
edge(n_2039_8,n_2039_2).
edge(n_2039_8,n_2039_7).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
colour(n_2039_3,red).
colour(n_2039_4,green).
colour(n_2039_5,green).
colour(n_2039_6,red).
colour(n_2039_7,red).
colour(n_2039_8,green).
colour(n_2039_9,green).
edge(n_2039_0,n_2039_3).
edge(n_2039_0,n_2039_4).
edge(n_2039_2,n_2039_3).
edge(n_2039_7,n_2039_6).
edge(n_2039_7,n_2039_8).
edge(n_2039_8,n_2039_2).
edge(n_2039_8,n_2039_7).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
colour(n_2039_3,red).
colour(n_2039_4,green).
colour(n_2039_5,green).
colour(n_2039_6,red).
colour(n_2039_7,red).
colour(n_2039_8,green).
colour(n_2039_9,green).
edge(n_2039_0,n_2039_3).
edge(n_2039_0,n_2039_4).
edge(n_2039_2,n_2039_3).
edge(n_2039_7,n_2039_6).
edge(n_2039_7,n_2039_8).
edge(n_2039_8,n_2039_2).
edge(n_2039_8,n_2039_7).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
colour(n_2039_3,red).
colour(n_2039_4,green).
colour(n_2039_5,green).
colour(n_2039_6,red).
colour(n_2039_7,red).
colour(n_2039_8,green).
colour(n_2039_9,green).
edge(n_2039_0,n_2039_3).
edge(n_2039_0,n_2039_4).
edge(n_2039_2,n_2039_3).
edge(n_2039_7,n_2039_6).
edge(n_2039_7,n_2039_8).
edge(n_2039_8,n_2039_2).
edge(n_2039_8,n_2039_7).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
colour(n_2039_3,red).
colour(n_2039_4,green).
colour(n_2039_5,green).
colour(n_2039_6,red).
colour(n_2039_7,red).
colour(n_2039_8,green).
colour(n_2039_9,green).
edge(n_2039_0,n_2039_3).
edge(n_2039_0,n_2039_4).
edge(n_2039_2,n_2039_3).
edge(n_2039_7,n_2039_6).
edge(n_2039_7,n_2039_8).
edge(n_2039_8,n_2039_2).
edge(n_2039_8,n_2039_7).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
colour(n_2039_3,red).
colour(n_2039_4,green).
colour(n_2039_5,green).
colour(n_2039_6,red).
colour(n_2039_7,red).
colour(n_2039_8,green).
colour(n_2039_9,green).
edge(n_2039_0,n_2039_3).
edge(n_2039_0,n_2039_4).
edge(n_2039_2,n_2039_3).
edge(n_2039_7,n_2039_6).
edge(n_2039_7,n_2039_8).
edge(n_2039_8,n_2039_2).
edge(n_2039_8,n_2039_7).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
colour(n_2039_3,red).
colour(n_2039_4,green).
colour(n_2039_5,green).
colour(n_2039_6,red).
colour(n_2039_7,red).
colour(n_2039_8,green).
colour(n_2039_9,green).
edge(n_2039_0,n_2039_3).
edge(n_2039_0,n_2039_4).
edge(n_2039_2,n_2039_3).
edge(n_2039_7,n_2039_6).
edge(n_2039_7,n_2039_8).
edge(n_2039_8,n_2039_2).
edge(n_2039_8,n_2039_7).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
colour(n_2039_3,red).
colour(n_2039_4,green).
colour(n_2039_5,green).
colour(n_2039_6,red).
colour(n_2039_7,red).
colour(n_2039_8,green).
colour(n_2039_9,green).
edge(n_2039_0,n_2039_3).
edge(n_2039_0,n_2039_4).
edge(n_2039_2,n_2039_3).
edge(n_2039_7,n_2039_6).
edge(n_2039_7,n_2039_8).
edge(n_2039_8,n_2039_2).
edge(n_2039_8,n_2039_7).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
colour(n_2039_3,red).
colour(n_2039_4,green).
colour(n_2039_5,green).
colour(n_2039_6,red).
colour(n_2039_7,red).
colour(n_2039_8,green).
colour(n_2039_9,green).
edge(n_2039_0,n_2039_3).
edge(n_2039_0,n_2039_4).
edge(n_2039_2,n_2039_3).
edge(n_2039_7,n_2039_6).
edge(n_2039_7,n_2039_8).
edge(n_2039_8,n_2039_2).
edge(n_2039_8,n_2039_7).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
colour(n_2039_3,red).
colour(n_2039_4,green).
colour(n_2039_5,green).
colour(n_2039_6,red).
colour(n_2039_7,red).
colour(n_2039_8,green).
colour(n_2039_9,green).
edge(n_2039_0,n_2039_3).
edge(n_2039_0,n_2039_4).
edge(n_2039_2,n_2039_3).
edge(n_2039_7,n_2039_6).
edge(n_2039_7,n_2039_8).
edge(n_2039_8,n_2039_2).
edge(n_2039_8,n_2039_7).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
colour(n_2039_3,red).
colour(n_2039_4,green).
colour(n_2039_5,green).
colour(n_2039_6,red).
colour(n_2039_7,red).
colour(n_2039_8,green).
colour(n_2039_9,green).
edge(n_2039_0,n_2039_3).
edge(n_2039_0,n_2039_4).
edge(n_2039_2,n_2039_3).
edge(n_2039_7,n_2039_6).
edge(n_2039_7,n_2039_8).
edge(n_2039_8,n_2039_2).
edge(n_2039_8,n_2039_7).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
colour(n_2039_3,red).
colour(n_2039_4,green).
colour(n_2039_5,green).
colour(n_2039_6,red).
colour(n_2039_7,red).
colour(n_2039_8,green).
colour(n_2039_9,green).
edge(n_2039_0,n_2039_3).
edge(n_2039_0,n_2039_4).
edge(n_2039_2,n_2039_3).
edge(n_2039_7,n_2039_6).
edge(n_2039_7,n_2039_8).
edge(n_2039_8,n_2039_2).
edge(n_2039_8,n_2039_7).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
colour(n_2039_3,red).
colour(n_2039_4,green).
colour(n_2039_5,green).
colour(n_2039_6,red).
colour(n_2039_7,red).
colour(n_2039_8,green).
colour(n_2039_9,green).
edge(n_2039_0,n_2039_3).
edge(n_2039_0,n_2039_4).
edge(n_2039_2,n_2039_3).
edge(n_2039_7,n_2039_6).
edge(n_2039_7,n_2039_8).
edge(n_2039_8,n_2039_2).
edge(n_2039_8,n_2039_7).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
colour(n_2039_3,red).
colour(n_2039_4,green).
colour(n_2039_5,green).
colour(n_2039_6,red).
colour(n_2039_7,red).
colour(n_2039_8,green).
colour(n_2039_9,green).
edge(n_2039_0,n_2039_3).
edge(n_2039_0,n_2039_4).
edge(n_2039_2,n_2039_3).
edge(n_2039_7,n_2039_6).
edge(n_2039_7,n_2039_8).
edge(n_2039_8,n_2039_2).
edge(n_2039_8,n_2039_7).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
colour(n_2039_3,red).
colour(n_2039_4,green).
colour(n_2039_5,green).
colour(n_2039_6,red).
colour(n_2039_7,red).
colour(n_2039_8,green).
colour(n_2039_9,green).
edge(n_2039_0,n_2039_3).
edge(n_2039_0,n_2039_4).
edge(n_2039_2,n_2039_3).
edge(n_2039_7,n_2039_6).
edge(n_2039_7,n_2039_8).
edge(n_2039_8,n_2039_2).
edge(n_2039_8,n_2039_7).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
colour(n_2039_3,red).
colour(n_2039_4,green).
colour(n_2039_5,green).
colour(n_2039_6,red).
colour(n_2039_7,red).
colour(n_2039_8,green).
colour(n_2039_9,green).
edge(n_2039_0,n_2039_3).
edge(n_2039_0,n_2039_4).
edge(n_2039_2,n_2039_3).
edge(n_2039_7,n_2039_6).
edge(n_2039_7,n_2039_8).
edge(n_2039_8,n_2039_2).
edge(n_2039_8,n_2039_7).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
colour(n_2039_3,red).
colour(n_2039_4,green).
colour(n_2039_5,green).
colour(n_2039_6,red).
colour(n_2039_7,red).
colour(n_2039_8,green).
colour(n_2039_9,green).
edge(n_2039_0,n_2039_3).
edge(n_2039_0,n_2039_4).
edge(n_2039_2,n_2039_3).
edge(n_2039_7,n_2039_6).
edge(n_2039_7,n_2039_8).
edge(n_2039_8,n_2039_2).
edge(n_2039_8,n_2039_7).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
colour(n_2039_3,red).
colour(n_2039_4,green).
colour(n_2039_5,green).
colour(n_2039_6,red).
colour(n_2039_7,red).
colour(n_2039_8,green).
colour(n_2039_9,green).
edge(n_2039_0,n_2039_3).
edge(n_2039_0,n_2039_4).
edge(n_2039_2,n_2039_3).
edge(n_2039_7,n_2039_6).
edge(n_2039_7,n_2039_8).
edge(n_2039_8,n_2039_2).
edge(n_2039_8,n_2039_7).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
colour(n_2039_3,red).
colour(n_2039_4,green).
colour(n_2039_5,green).
colour(n_2039_6,red).
colour(n_2039_7,red).
colour(n_2039_8,green).
colour(n_2039_9,green).
edge(n_2039_0,n_2039_3).
edge(n_2039_0,n_2039_4).
edge(n_2039_2,n_2039_3).
edge(n_2039_7,n_2039_6).
edge(n_2039_7,n_2039_8).
edge(n_2039_8,n_2039_2).
edge(n_2039_8,n_2039_7).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
colour(n_2039_3,red).
colour(n_2039_4,green).
colour(n_2039_5,green).
colour(n_2039_6,red).
colour(n_2039_7,red).
colour(n_2039_8,green).
colour(n_2039_9,green).
edge(n_2039_0,n_2039_3).
edge(n_2039_0,n_2039_4).
edge(n_2039_2,n_2039_3).
edge(n_2039_7,n_2039_6).
edge(n_2039_7,n_2039_8).
edge(n_2039_8,n_2039_2).
edge(n_2039_8,n_2039_7).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
colour(n_2039_3,red).
colour(n_2039_4,green).
colour(n_2039_5,green).
colour(n_2039_6,red).
colour(n_2039_7,red).
colour(n_2039_8,green).
colour(n_2039_9,green).
edge(n_2039_0,n_2039_3).
edge(n_2039_0,n_2039_4).
edge(n_2039_2,n_2039_3).
edge(n_2039_7,n_2039_6).
edge(n_2039_7,n_2039_8).
edge(n_2039_8,n_2039_2).
edge(n_2039_8,n_2039_7).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
colour(n_2039_3,red).
colour(n_2039_4,green).
colour(n_2039_5,green).
colour(n_2039_6,red).
colour(n_2039_7,red).
colour(n_2039_8,green).
colour(n_2039_9,green).
edge(n_2039_0,n_2039_3).
edge(n_2039_0,n_2039_4).
edge(n_2039_2,n_2039_3).
edge(n_2039_7,n_2039_6).
edge(n_2039_7,n_2039_8).
edge(n_2039_8,n_2039_2).
edge(n_2039_8,n_2039_7).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
colour(n_2039_3,red).
colour(n_2039_4,green).
colour(n_2039_5,green).
colour(n_2039_6,red).
colour(n_2039_7,red).
colour(n_2039_8,green).
colour(n_2039_9,green).
edge(n_2039_0,n_2039_3).
edge(n_2039_0,n_2039_4).
edge(n_2039_2,n_2039_3).
edge(n_2039_7,n_2039_6).
edge(n_2039_7,n_2039_8).
edge(n_2039_8,n_2039_2).
edge(n_2039_8,n_2039_7).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
colour(n_2039_3,red).
colour(n_2039_4,green).
colour(n_2039_5,green).
colour(n_2039_6,red).
colour(n_2039_7,red).
colour(n_2039_8,green).
colour(n_2039_9,green).
edge(n_2039_0,n_2039_3).
edge(n_2039_0,n_2039_4).
edge(n_2039_2,n_2039_3).
edge(n_2039_7,n_2039_6).
edge(n_2039_7,n_2039_8).
edge(n_2039_8,n_2039_2).
edge(n_2039_8,n_2039_7).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
colour(n_2039_3,red).
colour(n_2039_4,green).
colour(n_2039_5,green).
colour(n_2039_6,red).
colour(n_2039_7,red).
colour(n_2039_8,green).
colour(n_2039_9,green).
edge(n_2039_0,n_2039_3).
edge(n_2039_0,n_2039_4).
edge(n_2039_2,n_2039_3).
edge(n_2039_7,n_2039_6).
edge(n_2039_7,n_2039_8).
edge(n_2039_8,n_2039_2).
edge(n_2039_8,n_2039_7).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
colour(n_2039_3,red).
colour(n_2039_4,green).
colour(n_2039_5,green).
colour(n_2039_6,red).
colour(n_2039_7,red).
colour(n_2039_8,green).
colour(n_2039_9,green).
edge(n_2039_0,n_2039_3).
edge(n_2039_0,n_2039_4).
edge(n_2039_2,n_2039_3).
edge(n_2039_7,n_2039_6).
edge(n_2039_7,n_2039_8).
edge(n_2039_8,n_2039_2).
edge(n_2039_8,n_2039_7).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
colour(n_2039_3,red).
colour(n_2039_4,green).
colour(n_2039_5,green).
colour(n_2039_6,red).
colour(n_2039_7,red).
colour(n_2039_8,green).
colour(n_2039_9,green).
edge(n_2039_0,n_2039_3).
edge(n_2039_0,n_2039_4).
edge(n_2039_2,n_2039_3).
edge(n_2039_7,n_2039_6).
edge(n_2039_7,n_2039_8).
edge(n_2039_8,n_2039_2).
edge(n_2039_8,n_2039_7).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
colour(n_2039_3,red).
colour(n_2039_4,green).
colour(n_2039_5,green).
colour(n_2039_6,red).
colour(n_2039_7,red).
colour(n_2039_8,green).
colour(n_2039_9,green).
edge(n_2039_0,n_2039_3).
edge(n_2039_0,n_2039_4).
edge(n_2039_2,n_2039_3).
edge(n_2039_7,n_2039_6).
edge(n_2039_7,n_2039_8).
edge(n_2039_8,n_2039_2).
edge(n_2039_8,n_2039_7).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
colour(n_2039_3,red).
colour(n_2039_4,green).
colour(n_2039_5,green).
colour(n_2039_6,red).
colour(n_2039_7,red).
colour(n_2039_8,green).
colour(n_2039_9,green).
edge(n_2039_0,n_2039_3).
edge(n_2039_0,n_2039_4).
edge(n_2039_2,n_2039_3).
edge(n_2039_7,n_2039_6).
edge(n_2039_7,n_2039_8).
edge(n_2039_8,n_2039_2).
edge(n_2039_8,n_2039_7).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
colour(n_2039_3,red).
colour(n_2039_4,green).
colour(n_2039_5,green).
colour(n_2039_6,red).
colour(n_2039_7,red).
colour(n_2039_8,green).
colour(n_2039_9,green).
edge(n_2039_0,n_2039_3).
edge(n_2039_0,n_2039_4).
edge(n_2039_2,n_2039_3).
edge(n_2039_7,n_2039_6).
edge(n_2039_7,n_2039_8).
edge(n_2039_8,n_2039_2).
edge(n_2039_8,n_2039_7).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
colour(n_2039_3,red).
colour(n_2039_4,green).
colour(n_2039_5,green).
colour(n_2039_6,red).
colour(n_2039_7,red).
colour(n_2039_8,green).
colour(n_2039_9,green).
edge(n_2039_0,n_2039_3).
edge(n_2039_0,n_2039_4).
edge(n_2039_2,n_2039_3).
edge(n_2039_7,n_2039_6).
edge(n_2039_7,n_2039_8).
edge(n_2039_8,n_2039_2).
edge(n_2039_8,n_2039_7).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
colour(n_2039_3,red).
colour(n_2039_4,green).
colour(n_2039_5,green).
colour(n_2039_6,red).
colour(n_2039_7,red).
colour(n_2039_8,green).
colour(n_2039_9,green).
edge(n_2039_0,n_2039_3).
edge(n_2039_0,n_2039_4).
edge(n_2039_2,n_2039_3).
edge(n_2039_7,n_2039_6).
edge(n_2039_7,n_2039_8).
edge(n_2039_8,n_2039_2).
edge(n_2039_8,n_2039_7).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
colour(n_2039_3,red).
colour(n_2039_4,green).
colour(n_2039_5,green).
colour(n_2039_6,red).
colour(n_2039_7,red).
colour(n_2039_8,green).
colour(n_2039_9,green).
edge(n_2039_0,n_2039_3).
edge(n_2039_0,n_2039_4).
edge(n_2039_2,n_2039_3).
edge(n_2039_7,n_2039_6).
edge(n_2039_7,n_2039_8).
edge(n_2039_8,n_2039_2).
edge(n_2039_8,n_2039_7).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
colour(n_2039_3,red).
colour(n_2039_4,green).
colour(n_2039_5,green).
colour(n_2039_6,red).
colour(n_2039_7,red).
colour(n_2039_8,green).
colour(n_2039_9,green).
edge(n_2039_0,n_2039_3).
edge(n_2039_0,n_2039_4).
edge(n_2039_2,n_2039_3).
edge(n_2039_7,n_2039_6).
edge(n_2039_7,n_2039_8).
edge(n_2039_8,n_2039_2).
edge(n_2039_8,n_2039_7).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
colour(n_2039_3,red).
colour(n_2039_4,green).
colour(n_2039_5,green).
colour(n_2039_6,red).
colour(n_2039_7,red).
colour(n_2039_8,green).
colour(n_2039_9,green).
edge(n_2039_0,n_2039_3).
edge(n_2039_0,n_2039_4).
edge(n_2039_2,n_2039_3).
edge(n_2039_7,n_2039_6).
edge(n_2039_7,n_2039_8).
edge(n_2039_8,n_2039_2).
edge(n_2039_8,n_2039_7).
colour(n_2039_0,green).
colour(n_2039_1,green).
colour(n_2039_2,green).
colour(n_2039_3,red).
colour(n_2039_4,green).
colour(n_2039_5,green).
colour(n_2039_6,red).
colour(n_2039_7,red).
colour(n_2039_8,green).
colour(n_2039_9,green).
edge(n_2039_0,n_2039_3).
edge(n_2039_0,n_2039_4).
edge(n_2039_2,n_2039_3).
edge(n_2039_7,n_2039_6).
edge(n_2039_7,n_2039_8).
edge(n_2039_8,n_2039_2).
edge(n_2039_8,n_2039_7).
:-end_bg.
:-begin_in_pos.
f(n_0_21, n_0_9).
f(n_1_19, n_1_25).
f(n_2_22, n_2_14).
f(n_3_4, n_3_19).
f(n_4_35, n_4_24).
f(n_5_0, n_5_5).
f(n_6_34, n_6_6).
f(n_7_33, n_7_22).
f(n_8_12, n_8_11).
f(n_9_4, n_9_4).
f(n_10_29, n_10_8).
f(n_11_4, n_11_3).
f(n_12_0, n_12_2).
f(n_13_2, n_13_10).
f(n_14_3, n_14_1).
f(n_15_2, n_15_3).
f(n_16_21, n_16_24).
f(n_17_36, n_17_6).
f(n_18_5, n_18_6).
f(n_19_8, n_19_10).
:-end_in_pos.
:-begin_in_neg.
f(n_20_8, n_20_6).
f(n_21_8, n_21_0).
f(n_22_28, n_22_24).
f(n_23_1, n_23_10).
f(n_24_4, n_24_24).
f(n_25_9, n_25_3).
f(n_26_8, n_26_0).
f(n_27_17, n_27_23).
f(n_28_17, n_28_24).
f(n_29_3, n_29_2).
f(n_30_0, n_30_1).
f(n_31_9, n_31_28).
f(n_32_22, n_32_25).
f(n_33_21, n_33_13).
f(n_34_7, n_34_2).
f(n_35_6, n_35_7).
f(n_36_39, n_36_42).
f(n_37_4, n_37_7).
f(n_38_22, n_38_34).
f(n_39_3, n_39_13).
:-end_in_neg.
