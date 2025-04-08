% main.pl

:- [facts].
:- [locations].
:- [rules].

% Entry query
run :-
    killer(K),
    format("The killer is: ~w~n", [K]).
