/*
 1. sentence    <-> noun-phrase verb-phrase
 2. noun-phrase <-> noun
 3. noun-phrase <-> article noun
 4. verb-phrase <-> verb
 5. verb-phrase <-> verb noun-phrase
 6. article     <-> a
 7. article     <-> the
 8. noun        <-> man
 9. noun        <-> dog
10. verb        <-> likes
11. verb        <-> bites
*/

utterance(X) :- sentence(X, []).

sentence(Start, End) :- nounphrase(Start, Rest), verbphrase(Rest, End).

nounphrase([First | End], End) :- noun(First).
nounphrase([First, Second | End], End) :- article(First), noun(Second).

verbphrase([First | End], End) :- verb(First).
verbphrase([First | Second], End) :- verb(First), nounphrase(Second, End).

article(a).
article(the).
noun(dog).
noun(man).
verb(likes).
verb(bites).
