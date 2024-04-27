head_pred(f,2).
type(f,(list, list)).
direction(f,(in,out)).

body_pred(my_append,3).
type(my_append,(list,element,list)).
direction(my_append,(in,in,out)).


body_pred(empty_out,1).
type(empty_out,(list,)).
direction(empty_out,(out,)).
