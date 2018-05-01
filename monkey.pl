

%% Q1a: climb down off the box with the bannana
move(
	state(P, onbox, P, has),
	climbdown,
	state(P, onfloor, P, has)
).

%% grasp the bannana
move(
	state(middle, onbox, middle, hasnt),
	grasp,
	state(middle, onbox, middle, has)
).

%% Q1b: climb up onto the box
move(
	state(P, onfloor, P, hasnt),
	climbup,
	state(P, onbox, P, hasnt)
).

%% push the box from P1 to P2
move(
	state(P1, onfloor, P1, H),
	push,
	state(P2, onfloor, P2, H)
).

%% walk from P1 to P2
move(
	state(P1, onfloor, B, H),
	walk(P1, P2),
	state(P2, onfloor, B, H)
).


% canget(state(atdoor, onfloor, atwindow, hasnt)).


%% Q2a: determine whether the bannana can be obtained
canget(state(_, _, atwindow, has)).
canget(S1) :- move(S1, M, S2),
              write(S1), nl, write(M), nl, write(S2), nl, nl,
              canget(S2).

/*
Q2b:
canget(state(atdoor, onfloor, atwindow, hasnt)).
-> true

Q2c:

begins on the floor at the door
walks from the door the window
pushes the box to the middle of the room
climbs onto the box
grasps the bannana
climbs off the box
pushes the box to underneath the window

*/
