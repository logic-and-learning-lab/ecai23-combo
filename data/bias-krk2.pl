max_clauses(6).
max_vars(7).
max_body(8).

head_pred(f,1).
body_pred(cell,4).
body_pred(samerank,2).
body_pred(samefile,2).
body_pred(nextrank,2).
body_pred(nextfile,2).
body_pred(king,1).
body_pred(rook,1).
body_pred(white,1).
body_pred(black,1).

type(f,(state,)).
type(cell,(state, pos, color, piecetype)).
type(samerank,(pos, pos)).
type(samefile,(pos, pos)).
type(nextrank,(pos, pos)).
type(nextfile,(pos, pos)).
type(king,(piecetype,)).
type(rook,(piecetype,)).
type(white,(color,)).
type(black,(color,)).

direction(f,(in,)).
direction(cell,(in, out, out, out)).
direction(samerank,(in, out)).
direction(samefile,(in, out)).
direction(nextrank,(in, out)).
direction(nextfile,(in, out)).
direction(king,(in,)).
direction(rook,(in,)).
direction(white,(in,)).
direction(black,(in,)).