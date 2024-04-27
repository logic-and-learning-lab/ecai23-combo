

:-module(zendo, [background_knowledge/2
		,metarules/2
		,positive_example/2
		,negative_example/2
		,piece/2
		,contact/2
		,coord1/2
		,coord2/2
		,size/2
		,blue/1
		,green/1
		,red/1
		,small/1
		,medium/1
		,large/1
		,upright/1
		,lhs/1
		,rhs/1
		,strange/1]).

:- ['metarules-louise.pl'].

:-style_check(-discontiguous).

background_knowledge(zendo/1,[piece/2,contact/2,coord1/2,coord2/2,size/2,blue/1,green/1,red/1,small/1,medium/1,large/1,
upright/1,lhs/1,rhs/1,strange/1]).

metarules(zendo/1,[pa_qa, pa_qa_ra, pa_qab_rb, pa_qab_rab, pab_qba, pab_qa_rb, pab_qab_ra, pab_qab_rb, pab_qab, pab_qab_rab, pab_qac_rcb]).

max_size(10).
small(X) :- number(X), max_size(M), X >= 0, X =< M//3.
medium(X) :- number(X), max_size(M), X>M//3, X =< 2*M//3.
large(X) :- number(X), max_size(M), X>2*M//3, X =< M.

positive_example(zendo/1,X) :- pos(X).

negative_example(zendo/1,X) :- neg(X).