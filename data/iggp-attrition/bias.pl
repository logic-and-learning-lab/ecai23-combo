max_clauses(6).
max_vars(6).
max_body(6).
constant(action_lay_claim, action).
constant(action_end_game, action).
constant(action_noop, action).
constant(prop_gameOver, prop).
head_pred(next_score,3).
body_pred(true_score,3).
body_pred(true_control,2).
body_pred(true_claim_made_by,2).
body_pred(does,3).
body_pred(role,1).
body_pred(succ,2).
body_pred(opponent,2).
type(true_score,(ex,agent,int)).
type(true_control,(ex,agent)).
type(true_claim_made_by,(ex,agent)).
type(next_score,(ex,agent,int)).
type(does,(ex,agent,action)).
type(role,(agent,)).
type(succ,(int,int)).
type(opponent,(agent,agent)).

:-
    clause(C),
    #count{V : clause_var(C,V),var_type(C,V,ex)} != 1.

body_pred(P,1):-
    constant(P,_).

type(P,(T,)):-
    constant(P,T).