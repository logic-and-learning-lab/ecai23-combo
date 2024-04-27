



:-module(iggp-buttons-goal, [background_knowledge/2
		,metarules/2
		,positive_example/2
		,negative_example/2
        ,my_input/2,my_true/2,my_succ/2,role/1,prop_p/1,prop_q/1,prop_r/1,prop_1/1,prop_2/1,prop_3/1,prop_4/1,prop_5/1,prop_6/1,prop_7/1,action_a/1,action_b/1,action_c/1,not_my_true/2,int_0/1,int_100/1]).

:- ['metarules-louise.pl'].
:- ["./data/iggp-buttons-goal/data/train/bk.pl"].
:- ["./data/iggp-buttons-goal/data/train/exs.pl"].

:-style_check(-discontiguous).

background_knowledge(goal/3,Ps) :- findall(P/A, body_pred(P,A),Ps).

metarules(goal/3,[pa_qa, pa_qa_ra, pa_qab_rb, pa_qab_rab, pab_qba, pab_qa_rb, pab_qab_ra, pab_qab_rb, pab_qab,
pab_qab_rab, pab_qac_rcb]).

positive_example(goal/3,X) :- pos(X).

negative_example(goal/3,X) :- neg(X).

head_pred(goal,3).
body_pred(my_input,2).
body_pred(my_true,2).
body_pred(my_succ,2).
body_pred(role,1).
body_pred(prop_p,1).
body_pred(prop_q,1).
body_pred(prop_r,1).
body_pred(prop_1,1).
body_pred(prop_2,1).
body_pred(prop_3,1).
body_pred(prop_4,1).
body_pred(prop_5,1).
body_pred(prop_6,1).
body_pred(prop_7,1).
body_pred(action_a,1).
body_pred(action_b,1).
body_pred(action_c,1).
body_pred(not_my_true,2).
body_pred(int_0,1).
body_pred(int_100,1).