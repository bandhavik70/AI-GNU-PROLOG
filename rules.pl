% rules.pl

% Innocents
innocent(X) :- location(X, bar).
innocent(X) :- location(X, alone).

% Possible roles
possible_killer(X) :- location(X, beach).
possible_victim(X) :- location(X, beach).

% Alice and husband not together
not_together(alice, husband) :- location(alice, L1), location(husband, L2), L1 \= L2.

% Victim's twin is innocent
twin_innocent(Victim) :- twin(Victim, Twin), innocent(Twin).

% Age comparisons
younger(son, husband).

% Final killer rule
killer(X) :-
    possible_killer(X),
    person(Y),
    possible_victim(Y),
    X \= Y,
    younger(X, Y),
    twin_innocent(Y),
    not(innocent(X)),
    not(innocent(Y)).
