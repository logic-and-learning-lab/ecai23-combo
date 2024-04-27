



:-module(iggp-minimal-decay, [background_knowledge/2
		,metarules/2
		,positive_example/2
		,negative_example/2
        ,does/3
        ,my_true_value/2
        ,my_succ/2
        ,c_pressButton/1
        ,c_noop/1
        ,c_player/1
        ,c1/1
        ,c2/1
        ,c3/1
        ,c4/1
        ,c5/1
        ]).

:- ['metarules-louise.pl'].
:- ["./data/iggp-minimal-decay/data/train/bk.pl"].
:- ["./data/iggp-minimal-decay/data/train/exs.pl"].

:-style_check(-discontiguous).

background_knowledge(next_value/2,Ps) :- findall(P/A, body_pred(P/A),Ps).

metarules(next_value/2,[pa_qa, pa_qa_ra, pa_qab_rb, pa_qab_rab, pab_qba, pab_qa_rb, pab_qab_ra, pab_qab_rb, pab_qab,
pab_qab_rab, pab_qac_rcb]).

positive_example(next_value/2,X) :- pos(X).

negative_example(next_value/2,X) :- neg(X).

body_pred(does/3).
body_pred(my_true_value/2).
body_pred(my_succ/2).
body_pred(c_pressButton/1).
body_pred(c_noop/1).
body_pred(c_player/1).
body_pred(c1/1).
body_pred(c2/1).
body_pred(c3/1).
body_pred(c4/1).
body_pred(c5/1).