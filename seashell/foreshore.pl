
:- op(800, fx, if).
:- op(700, xfx, then).
:- op(300, xfy, or).
:- op(200, xfy, and).

:- op(800, fx, fact).

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
if family_mammal and size_large then species_whale.
if family_mammal and size_small then species_seal.
if family_fish and size_large then species_tuna.
if family_fish and size_small then species_sardine.
