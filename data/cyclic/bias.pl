

body_pred(edge,2).
body_pred(colour,2).
body_pred(red,1).
body_pred(green,1).

type(edge,(node,node)).
type(colour,(node,colour)).
type(red,(colour,)).
type(green,(colour,)).

direction(edge,(out,out)).
direction(colour,(in,out)).
direction(red,(in,)).
direction(green,(in,)).

max_clauses(6).
max_vars(6).
max_body(6).

enable_recursion.
head_pred(f,1).
type(f,(node,)).
direction(f,(in,)).
