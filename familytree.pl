
female(barb).
female(sue).
female(cathy).
female(melanie).

male(fred).
male(bob).
male(henry).
male(bill).
male(greg).


% sue's children
parent(sue, henry).
parent(sue, bill).
parent(sue, barb).

% fred's children
parent(fred, henry).
parent(fred, bill).
parent(fred, barb).

% grandchildren
parent(henry, cathy).
parent(barb, bob).

% new children
parent(cathy, greg).
parent(bill, melanie).

% relationships
mother(X, Y) :- parent(X, Y), female(X).
father(X, Y) :- parent(X, Y), male(X).
grandparent(X, Y) :- parent(X, Z), parent(Z, Y).
sibling(X, Y) :- parent(Z, X), parent(Z, Y), X \== Y.

% question 1

sister(X, Y) :- sibling(X, Y), female(X).
brother(X, Y) :- sibling(X, Y), male(X).


% question 2

uncle(X, Y) :- parent(Z, Y), brother(X, Z).
aunt(X, Y) :- parent(Z, Y), sister(X, Z).

% question 3

cousin(X, Y) :- parent(Z, X), parent(W, Y), sibling(Z, W).

% question 6

greatgrandparent(X, Y) :- grandparent(Z, Y), parent(X, Z).

% question 7


son(X, Y) :- parent(Y, X), male(X).
daughter(X, Y) :- parent(Y, X), female(X).

%% nephew(X, Y) :- male(X), aunt(Y, X); uncle(Y, X).
%% niece(X, Y) :- female(X), aunt(Y, X); uncle(Y, X).
nephew(X, Y) :- male(X), parent(Z, X), sibling(Y, Z).
niece(X, Y) :- female(X), parent(Z, X), sibling(Y, Z).
