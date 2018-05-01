
:- op(800, fx, if).
:- op(700, xfx, then).
:- op(300, xfy, or).
:- op(200, xfy, and).

:- op(800, xfx, <=).

:- op(800, fx, fact).

is_true(P, P) :- fact P.
is_true(C, C <= ProofTreeA) :- if A then C, is_true(A, ProofTreeA).

is_true(P1 and P2, ProofTree1 and ProofTree2) :- is_true(P1, ProofTree1), is_true(P2, ProofTree2).

is_true(P1 or P2, ProofTree1) :- is_true(P1, ProofTree1).
is_true(P1 or P2, ProofTree2) :- is_true(P2, ProofTree2).


%% is_true(P1 or P2, ProofTreeA) :- is_true(P1, ProofTreeA); is_true(P2, ProofTreeA).

composed_fact(P) :- fact P.
composed_fact(P1 and P2) :- composed_fact(P1), composed_fact(P2).
composed_fact(P1 or P2) :- composed_fact(P1); composed_fact(P2).

new_derived_fact(C) :- if A then C, \+fact(C), composed_fact(A).

forward :- new_derived_fact(P), !,
           write('Derived: '), write(P), nl,
           asserta(fact P),
           forward.

forward :- write('No more facts.').


if covering_scales then family_fish.
if covering_skin then family_mammal.
if covering_feathers then family_bird.

if family_mammal and size_large then subfamily_whale.
if family_mammal and size_small then subfamily_seal.

if subfamily_whale and feeds_baleen then species_blue_whale.
if subfamily_whale and feeds_teeth then species_killer_whale.

if subfamily_seal and sound_grunt then species_elephant_seal.
if subfamily_seal and sound_screech then species_fur_seal.

if family_fish and size_large then species_tuna.
if family_fish and size_small then species_sardine.

if family_bird and action_flies then species_albatross.
if family_bird and action_swims then species_penguin.

