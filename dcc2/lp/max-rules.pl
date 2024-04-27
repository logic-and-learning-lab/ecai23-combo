%% RPS
%% min_rule_size(1,4).
%% min_rule_size(2,4).
%% min_rule_size(3,5).

%% BUTTONS
%% min_rule_size(1,6).
%% min_rule_size(2,6).
%% min_rule_size(3,6).
%% min_rule_size(4,7).
%% min_rule_size(5,6).
%% min_rule_size(6,7).
%% min_rule_size(7,3).
%% min_rule_size(8,6).
%% min_rule_size(9,7).
%% min_rule_size(10,7).

%% max_rule_size determined by bias file
max_rule_size(6).

example(E):-
    min_rule_size(E,_).

covers(R,E):-
    rule(R,M),
    min_rule_size(E,N),
    M >= N.

:-
    rule(R,_),
    not covers(R,_).
:-
    example(E),
    not covers(_,E).

%% max_rules(N):- #count{1,E : min_rule_size(E,_)} == N.


%% max_literals(N):-
    %% #sum{K,E : min_rule_size(E,K)} == N.

min_literals(N):-
    min_rule_size_bound(N).

min_rule_size_bound(N):-
    #max{K : min_rule_size(_,K)} == N.

min_rule_size_bound_(N):-
    #min{K : min_rule_size(_,K)} == N.

num_literals(N):-
    #sum{K,I : rule(I,K)} == N.

{rule(1..M,1..K)}:-
    max_rules(M),
    max_rule_size(K).
    %% max_literals(K).

%% need at least one rule
:-
    not rule(1,_).

%% only one guess per rule
:-
    rule(I,_),
    #count{K : rule(I,K)} > 1.

%% rules in order
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
    K >= N.

%% cannot have fewer literals than the bound
:-
    min_literals(N),
    num_literals(K),
    K < N.

%% min_literals(11).
%% min_literals(12).

%% asda:-
%%     rule(R,K),
%%     K <= 7,
%%     covers(R,1),
%%     covers(R,2).

%% :-
%%     rule(R,K),
%%     K <= 3,
%%     covers(R,3),
%%     covers(R,4).

%% #show covers/2.
%% #show rule/2.
#show max_literals/1.