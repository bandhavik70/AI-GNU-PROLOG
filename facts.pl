% facts.pl

% People
person(alice).
person(husband).
person(son).
person(daughter).
person(brother).

% Genders
female(alice).
female(daughter).
male(husband).
male(son).
male(brother).

% Relationships
child(son).
child(daughter).

% Twins
twin(son, daughter).
twin(daughter, son).
