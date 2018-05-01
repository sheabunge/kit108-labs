
% list of a cells which can be built on
suitablecells([
	p(1,1), p(1,2), p(1,3), p(1,4),
	p(2,1),
	p(3,1), p(3,2),
	p(4,1), p(4,2), p(4,3), p(4,4)
]).

westof(p(X1, Y1), p(X2, Y2)) :- X1 < X2.
northof(p(X1, Y1), p(X2, Y2)) :- Y1 > Y2.

nextto(p(X1, Y1), p(X2, Y2)) :- DX is X2 - 1, X1 = DX, Y1 = Y2.
nextto(p(X1, Y1), p(X2, Y2)) :- DX is X2 + 1, X1 = DX, Y1 = Y2.
nextto(p(X1, Y1), p(X2, Y2)) :- DY is Y2 - 1, X1 = X2, Y1 = DY.
nextto(p(X1, Y1), p(X2, Y2)) :- DY is Y2 + 1, X1 = X2, Y1 = DY.

plan(H, G, P) :- suitablecells(L),
                 member(H, L), member(G, L), member(P, L),
                 westof(H, P), westof(H, G),
                 \+nextto(P, H),
                 northof(P, G).


/*

(1, 4)                  (4, 4)
(1, 3)                  (4, 3)
(1, 2)          (3, 2)  (4, 2)
(1, 1)  (2, 1)  (3, 1)  (4, 1)
*/