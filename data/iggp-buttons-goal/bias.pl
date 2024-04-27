max_vars(6).
max_body(8).

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

type(goal,(ex,agent,int)).
type(does,(ex,agent,action)).
type(my_input,(agent,action)).
type(my_true,(ex,prop)).
type(my_succ,(prop,prop)).
type(role,(agent,)).
type(prop_p,(prop,)).
type(prop_q,(prop,)).
type(prop_r,(prop,)).
type(prop_1,(prop,)).
type(prop_2,(prop,)).
type(prop_3,(prop,)).
type(prop_4,(prop,)).
type(prop_5,(prop,)).
type(prop_6,(prop,)).
type(prop_7,(prop,)).
type(action_a,(action,)).
type(action_b,(action,)).
type(action_c,(action,)).
type(not_my_true,(ex,prop)).
type(int_0,(int,)).
type(int_100,(int,)).

%% BECAUSE WE DO NOT LEARN FROM INTERPRETATIONS
:-
    clause(C),
    #count{V : clause_var(C,V),var_type(C,V,ex)} != 1.