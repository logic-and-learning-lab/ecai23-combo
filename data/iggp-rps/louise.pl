



:-module(iggp-rps, [background_knowledge/2
		,metarules/2
		,positive_example/2
		,negative_example/2
		,my_true_score/3
		,my_succ/2
        ,does/3
        ,beats/2
        ,different/2
        ,player/1
        ]).

:- ['metarules-louise.pl'].
:- ["./data/iggp-rps/data/train/bk.pl"].
:- ["./data/iggp-rps/data/train/exs.pl"].

:-style_check(-discontiguous).

background_knowledge(next_score/3,Ps) :- findall(P/A, body_pred(P/A),Ps).

metarules(next_score/3,[pa_qa, pa_qa_ra, pa_qab_rb, pa_qab_rab, pab_qba, pab_qa_rb, pab_qab_ra, pab_qab_rb, pab_qab,
pab_qab_rab, pab_qac_rcb]).

positive_example(next_score/3,X) :- pos(X).

negative_example(next_score/3,X) :- neg(X).

body_pred(my_true_score/3).
body_pred(my_succ/2).
body_pred(does/3).
body_pred(beats/2).
body_pred(different/2).
body_pred(player/1).
