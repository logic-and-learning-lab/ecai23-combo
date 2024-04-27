

:-module(graph, [background_knowledge/2
		,metarules/2
		,positive_example/2
		,negative_example/2
		,head/2
		,tail/2
		,geq/2
		,empty/1
		,even/1
		,odd/1
		,one/1
		,zero/1
		,decrement/2
		]).

:- ['metarules-louise.pl'].

:-style_check(-discontiguous).

background_knowledge(f/1,[head/2,tail/2,geq/2,empty/1,even/1,odd/1,one/1,zero/1,decrement/2]).
background_knowledge(f/2,[head/2,tail/2,geq/2,empty/1,even/1,odd/1,one/1,zero/1,decrement/2]).
background_knowledge(f/3,[head/2,tail/2,geq/2,empty/1,even/1,odd/1,one/1,zero/1,decrement/2]).

metarules(f/1,[pa_qa, pa_qa_ra, pa_qab_rb, pa_qab_rab, pab_qba, pab_qa_rb, pab_qab_ra, pab_qab_rb, pab_qab,
pab_qab_rab, pab_qac_rcb]).
metarules(f/2,[pa_qa, pa_qa_ra, pa_qab_rb, pa_qab_rab, pab_qba, pab_qa_rb, pab_qab_ra, pab_qab_rb, pab_qab,
pab_qab_rab, pab_qac_rcb]).
metarules(f/3,[pa_qa, pa_qa_ra, pa_qab_rb, pa_qab_rab, pab_qba, pab_qa_rb, pab_qab_ra, pab_qab_rb, pab_qab,
pab_qab_rab, pab_qac_rcb]).

positive_example(f/1,X) :- pos(X).
positive_example(f/2,X) :- pos(X).
positive_example(f/3,X) :- pos(X).
negative_example(f/1,X) :- neg(X).
negative_example(f/2,X) :- neg(X).
negative_example(f/3,X) :- neg(X).
