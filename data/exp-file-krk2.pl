

:-module(krk, [background_knowledge/2
		,metarules/2
		,positive_example/2
		,negative_example/2
        ,cell/4
        ,samerank/2
        ,samefile/2
        ,nextrank/2
        ,nextfile/2
        ,king/1
        ,rook/1
        ,white/1
        ,black/1]).

:- ['metarules-louise.pl'].

:-style_check(-discontiguous).

background_knowledge(f/1,[cell/4,samerank/2,samefile/2,nextrank/2,nextfile/2,king/1,rook/1,white/1,black/1]).

metarules(f/1,[pa_qa, pa_qa_ra, pa_qab_rb, pa_qab_rab, pab_qba, pab_qa_rb, pab_qab_ra, pab_qab_rb, pab_qab,
pab_qab_rab, pab_qac_rcb]).

positive_example(f/1,X) :- pos(X).

negative_example(f/1,X) :- neg(X).
