

:-module(train, [background_knowledge/2
		,metarules/2
		,positive_example/2
		,negative_example/2
        ,has_car/2
        ,has_load/2
        ,short/1
        ,long/1
        ,two_wheels/1
        ,three_wheels/1
        ,roof_open/1
        ,roof_flat/1
        ,roof_closed/1
        ,zero_load/1
        ,one_load/1
        ,two_load/1
        ,three_load/1
        ,circle/1
        ,triangle/1
        ,rectangle/1
        ,diamond/1
        ,hexagon/1
        ,inverted_triangle/1]).

:- ['metarules-louise.pl'].


background_knowledge(f/1,[has_car/2,has_load/2,short/1,long/1,two_wheels/1,three_wheels/1,roof_open/1,roof_flat/1,
roof_closed/1,zero_load/1,one_load/1,two_load/1,three_load/1,circle/1,triangle/1,rectangle/1,diamond/1,hexagon/1,
inverted_triangle/1]).

metarules(f/1,[pa_qa, pa_qa_ra, pa_qab_rb, pa_qab_rab, pab_qba, pab_qa_rb, pab_qab_ra, pab_qab_rb, pab_qab,
pab_qab_rab, pab_qac_rcb]).

positive_example(f/1,X) :- pos(X).

negative_example(f/1,X) :- neg(X).
