
% centre(name, size [city, town, village], accom, interests)

centre(atherton, town, fourstar, sports).
centre(gambier, city, fivestar, history).
centre(bedford, city, fourstar, sports).
centre(morrisfield, town, threestar, sports).
centre(chiltern, town, fourstar, culture).
centre(zeehan, village, threestar, scenery).
centre(kimberley, city, fivestar, culture).

bus(gambier, bedford).
bus(gambier, atherton).
bus(gambier, chiltern).
bus(chiltern, zeehan).
bus(chiltern, kimberley).

rail(atherton, bedford).
rail(bedford, morrisfield).
rail(morrisfield, kimberley).
rail(morrisfield, chiltern).

write2(X, Y) :- write(X), nl, write(Y), nl.

connectedbyrail(X, Y) :- rail(X, Y).
connectedbyrail(X, Z) :- rail(X, Y), connectedbyrail(Y, Z).

connectedbybus(X, Y) :- bus(X, Y), write2(X, Y).
connectedbybus(X, Z) :- bus(X, Y), write2(X, Y), connectedbybus(Y, Z).

% question 2

linked(X, Y) :- rail(X, Y).
linked(X, Y) :- bus(X, Y).

connected(X, Z) :- linked(X, Y), connected(Y, Z).
connected(X, Y) :- linked(X, Y).

% question 4

%% centre(X, city, Y, _).

% question 5

%% centre(X, _, _, sports), centre(Y, _, _, sports), connected(X, Y).

