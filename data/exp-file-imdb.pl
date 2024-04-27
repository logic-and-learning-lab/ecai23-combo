

:-module(graph, [background_knowledge/2
		,metarules/2
		,positive_example/2
		,negative_example/2
		,movie/2
		,actor/1
		,director/1
		,gender/2
		,genre/2)]).


:- ['metarules-louise.pl'].

background_knowledge(f/2,[movie/2,actor/1,director/1,gender/2,genre/2)]).

metarules(f/2,[pa_qa, pa_qa_ra, pa_qab_rb, pa_qab_rab, pab_qba, pab_qa_rb, pab_qab_ra, pab_qab_rb, pab_qab, pab_qab_rab, pab_qac_rcb]).


positive_example(f/2,X) :- pos(X).

negative_example(f/2,X) :- neg(X).