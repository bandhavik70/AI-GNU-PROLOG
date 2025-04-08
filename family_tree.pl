
% ------------ Basic Facts ------------

male(james1).
male(charles1).
male(charles2).
male(james2).
male(george1).
male(paul).
male(sam).

female(catherine).
female(elizabeth).
female(sophia).
female(claudia).
female(fay).

parent(elizabeth, james1).
parent(charles2, charles1).
parent(catherine, charles1).
parent(james2, charles1).
parent(james2, elizabeth).
parent(sophia, elizabeth).
parent(george1, sophia).
parent(george1, sam).
parent(catherine, fay).
parent(charles2, fay).
parent(james2, fay).
parent(sophia, paul).
parent(elizabeth, claudia).
parent(charles1, claudia).

married(james1, claudia).
married(claudia, james1).
married(charles1, fay).
married(fay, charles1).
married(elizabeth, paul).
married(paul, elizabeth).
married(sophia, sam).
married(sam, sophia).

% ------------ Rules ------------

% a. Father
father(F, C) :- parent(C, F), male(F).

% b. Mother
mother(M, C) :- parent(C, M), female(M).

% c. Brother
brother(B, P) :- parent(P, X), parent(B, X), male(B), B \= P.

% d. Sister
sister(S, P) :- parent(P, X), parent(S, X), female(S), S \= P.

% e. Aunt
aunt(A, P) :- parent(P, X), parent(A, X), female(A), A \= X.
aunt(A, P) :- parent(P, X), sibling(X, S), female(S), A = S.

% f. Uncle
uncle(U, P) :- parent(P, X), parent(U, X), male(U), U \= X.
uncle(U, P) :- parent(P, X), sibling(X, S), male(S), U = S.

% g. Grandmother
grandmother(G, P) :- parent(P, X), parent(X, G), female(G).

% h. Brother-in-law
brother_in_law(BIL, P) :- married(P, S), sibling(BIL, S), male(BIL).
brother_in_law(BIL, P) :- sibling(P, S), married(BIL, S), male(BIL).

% i. Mother-in-law
mother_in_law(MIL, P) :- married(P, S), parent(S, MIL), female(MIL).

% j. Father-in-law
father_in_law(FIL, P) :- married(P, S), parent(S, FIL), male(FIL).

% k. Ancestor
ancestor(A, P) :- parent(P, A).
ancestor(A, P) :- parent(P, X), ancestor(A, X).

% l. Descendent
descendent(D, A) :- ancestor(A, D).

% Utility: Siblings (not required but helpful)
sibling(X, Y) :- parent(X, P), parent(Y, P), X \= Y.
