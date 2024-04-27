



:-module(iggp-buttons, [background_knowledge/2
		,metarules/2
		,positive_example/2
		,negative_example/2
        ,does/3
        ,my_input/2
        ,my_true/2
        ,my_succ/2
        ,not_my_true/2
        ,role/1
        ,c_p/1
        ,c_q/1
        ,c_r/1
        ,c_a/1
        ,c_b/1
        ,c_c/1]).

:- ['metarules-louise.pl'].
:- ["./data/train/bk.pl"].
:- ["./data/train/exs.pl"].

:-style_check(-discontiguous).

background_knowledge(next/2,Ps) :- findall(P/A, body_pred(P/A),Ps).

metarules(next/2,[pa_qa, pa_qa_ra, pa_qab_rb, pa_qab_rab, pab_qba, pab_qa_rb, pab_qab_ra, pab_qab_rb, pab_qab,
pab_qab_rab, pab_qac_rcb]).

positive_example(next/2,X) :- pos(X).

negative_example(next/2,X) :- neg(X).

body_pred(does/3).
body_pred(my_input/2).
body_pred(my_true/2).
body_pred(my_succ/2).
body_pred(role/1).
body_pred(c_p/1).
body_pred(c_q/1).
body_pred(c_r/1).
body_pred(c_a/1).
body_pred(c_b/1).
body_pred(c_c/1).
body_pred(not_my_true/2).
