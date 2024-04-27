%% each rule has at least two atoms
{rule(1..M,2..K)}:-
    max_rules(M),
    max_rule_size(K).

num_rules(N):-
    #count{I : rule(I,_)} == N.

num_literals(N):-
    #sum{K,I : rule(I,K)} == N.

%% need at least two rules for recursion
:-
    not rule(1..2,_).

%% need at least five literals for recursion
:-
    num_literals(1..5).

%% only one guess per rule
:-
    rule(I,_),
    #count{K : rule(I,K)} > 1.

%% guess rules in order
:-
    I > 1,
    rule(I,_),
    not rule(I-1,_).

%% order rules by size to remove symmetries
:-
    rule(I1,K1),
    rule(I2,K2),
    I2 > I1,
    K2 < K1.

%% cannot have more literals than the bound
:-
    max_literals(N),
    num_literals(K),
    K > N.

%% cannot have fewer literals than the bound
:-
    min_literals(N),
    num_literals(K),
    K < N.

#show max_literals/1.
#show num_rules/1.
#show rule/2.
%% #maximize{X : num_rules(X)}.
%% #maximize{X : num_literals(X)}.


%% ===

%% min_literals(5).
%% max_rule_size(4).
%% max_rules(4).