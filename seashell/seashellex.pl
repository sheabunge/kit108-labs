
:- op(800, fx, if).
:- op(700, xfx, then).
:- op(300, xfy, or).
:- op(200, xfy, and).

:- op(800, xfx, <=).

:- op(800, fx, fact).

is_true(P, P) :- fact P.
is_true(C, C <= ProofTreeA) :- if A then C, is_true(A, ProofTreeA).

is_true(P1 and P2, ProofTree1 and ProofTree2) :- is_true(P1, ProofTree1), is_true(P2, ProofTree2).

is_true(P1 or P2, ProofTree1) :- is_true(P1, ProofTree1); is_true(P2, ProofTree2).

if covering_scales then family_fish.
if covering_skin then family_mammal.
if family_mammal and size_large then species_whale.
if family_mammal and size_small then species_seal.
if family_fish and size_large then species_tuna.
if family_fish and size_small then species_sardine.
