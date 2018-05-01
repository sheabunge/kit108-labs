
article(a, singular).
article(the, singular).
article(the, plural).
article(these, plural).

noun(man, singular).
noun(men, plural).
noun(dog, singular).
noun(dogs, plural).

adjective(large).
adjective(small).
adjective(hairy).
adjective(bald).
adjective(noisy).
adjective(quiet).

verb(likes, singular).
verb(like, plural).
verb(bites, singular).
verb(bite, plural).

conjunction(and).
conjunction(or).
conjunction(but).

utterance(X) :- complexsentence(X, []).

sentence(Start, End) :- nounphrase(Start, Rest, Number), verbphrase(Rest, End, Number).
connection([First | End], End) :- conjunction(First).

complexsentence(Start, End) :- sentence(Start, End).
complexsentence(Start, End) :- sentence(Start, Join), connection(Join, Rest), complexsentence(Rest, End).

nounphrase([First | End], End, Number) :- noun(First, Number).
nounphrase([First, Second | End], End, Number) :- adjective(First), noun(Second, Number).
nounphrase([First, Second | End], End, Number) :- article(First, Number), noun(Second, Number).
nounphrase([First, Second, Third | End], End, Number) :- article(First, Number), adjective(Second), noun(Third, Number).

verbphrase([First | End], End, Number) :- verb(First, Number).
verbphrase([First | Second], End, Number) :- verb(First, Number), nounphrase(Second, End, _).
