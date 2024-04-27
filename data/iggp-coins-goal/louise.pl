



:-module(iggp-coins-goal, [background_knowledge/2
		,metarules/2
		,positive_example/2
		,negative_example/2
        ,does_jump/4, my_true_cell/3, role/1, my_pos/1, c_zerocoins/1, c_onecoin/1, c_twocoins/1, my_true_step/2]).

:- ['metarules-louise.pl'].
:- ["./data/iggp-coins-goal/data/train/bk.pl"].
:- ["./data/iggp-coins-goal/data/train/exs.pl"].

:-style_check(-discontiguous).

background_knowledge(goal/3,Ps) :- findall(P/A, body_pred(P,A),Ps).

metarules(goal/3,[pa_qa, pa_qa_ra, pa_qab_rb, pa_qab_rab, pab_qba, pab_qa_rb, pab_qab_ra, pab_qab_rb, pab_qab,
pab_qab_rab, pab_qac_rcb]).

positive_example(goal/3,X) :- pos(X).

negative_example(goal/3,X) :- neg(X).

head_pred(goal,3).
body_pred(does_jump,4).
%% body_pred(my_succ,2).
body_pred(my_true_cell,3).
body_pred(role,1).
body_pred(my_pos,1).
%% body_pred(different,2).
body_pred(c_zerocoins,1).
body_pred(c_onecoin,1).
body_pred(c_twocoins,1).
body_pred(my_true_step,2).