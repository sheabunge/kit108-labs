
% c(room, session)
avaliableslots([
	c(1, 1),
	c(1, 2), c(2, 2), c(3, 2),
	c(1, 3), c(2, 3), c(3, 3)
]).

samesession(c(R1, S1), c(R2, S2)) :- S1 = S2.
sameroom(c(R1, S1), c(R2, S2)) :- R1 = R2.

nextsession(c(R1, S1), c(R2, S2)) :- NS is S1 + 1, S2 = NS.

earlier(c(R1, S1), c(R2, S2)) :- S1 < S2.

%% unique(A, B, C) :- \+ A = B, \+ B = C, \+ C = A.

% Units: Applications, Concepts, Programming

schedule(A, C, P) :- avaliableslots(L),
                 member(A, L), member(C, L), member(P, L),
                 \+samesession(C, P),
                 earlier(A, C),
                 sameroom(P, A), nextsession(P, A).

/*
(room, session)

(1, 1)  (1, 2)  (1, 3)
        (2, 2)  (2, 3)
        (3, 2)  (3, 3)
*/