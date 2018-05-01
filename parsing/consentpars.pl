
article(a, singular).
article(the, singular).
article(the, plural).
article(these, plural).

noun(man, singular).
noun(men, plural).
noun(dog, singular).
noun(dogs, plural).

verb(likes, singular).
verb(like, plural).
verb(bites, singular).
verb(bite, plural).

utterance(X) :- sentence(X, []).

sentence(Start, End) :- nounphrase(Start, Rest, Number), verbphrase(Rest, End, Number).

nounphrase([First | End], End, Number) :- noun(First, Number).
nounphrase([First, Second | End], End, Number) :- article(First, Number), noun(Second, Number).

verbphrase([First | End], End, Number) :- verb(First, Number).
verbphrase([First | Second], End, Number) :- verb(First, Number), nounphrase(Second, End, _).
