neg(legal(1,black, noop)).
neg(legal(1,white, end_game)).
neg(legal(1,white, lay_claim)).
neg(legal(2,black, end_game)).
neg(legal(2,black, lay_claim)).
neg(legal(2,white, noop)).
neg(legal(3,black, end_game)).
neg(legal(3,black, lay_claim)).
neg(legal(3,white, noop)).
pos(legal(1,black, end_game)).
pos(legal(1,black, lay_claim)).
pos(legal(1,white, noop)).
pos(legal(2,black, noop)).
pos(legal(2,white, end_game)).
pos(legal(2,white, lay_claim)).
pos(legal(3,black, noop)).
pos(legal(3,white, end_game)).
pos(legal(3,white, lay_claim)).