#show lower/2.

%% rule(ID,Pred,Size,Recursive,Level).

lower(R1,R2):-
    rule(R1,Pred,Size1,Recursive,_),
    rule(R2,Pred,Size2,Recursive,_),
    R1 != R2,
    Size1 < Size2.

lower(R1,R2):-
    rule(R1,Pred,_,0,_),
    rule(R2,Pred,_,1,_),
    R1 != R2.

lower(R1,R2):-
    rule(R1,_,_,_,Level1),
    rule(R2,_,_,_,Level2),
    R1 != R2,
    Level1 < Level2.

%% rule(0,grandparent,2,0,0).
%% rule(1,inv1,1,0,1).
%% rule(2,inv1,1,0,1).

%% rule(0,f,2,0,0).
%% rule(1,inv1,2,0,1).
%% rule(2,inv2,2,1,2).
%% rule(3,inv2,2,0,2).


%% :-
%% lower(A,B), lower(A,C)

