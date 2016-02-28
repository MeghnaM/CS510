%% ANSWERS:
%% To prove colwest is a criminal, type in "criminal(X)."
%% To prove colwest is a patriot, type in "patriot(X)."
%% To get all of Elizabeth's grandchildren, type in "grandchild(X, elizabeth)."
%% To get all of Diana's brothers in law, type in "brotherinlaw(X, diana)."
%% To get all of Zara's great grand parents, type in "greatgrandparent(X, zara)."
%% To get all of Eugenie's ancestors, type in "ancestor(X, eugenie)."

% Problem 2: 
country(nono).
country(whoknew).

has(nono, missiles).

sold(colwest, missiles, nono).

weapons(missiles).

enemy(nono, america).
enemy(whoknew, america).

hostile(X) :- enemy(X, america).

nationality(america, colwest).

criminal(X) :- nationality(america, X), sold(X, Y, Z), enemy(Z, america), weapons(Y).


% Problem 3:
attack(nono, whoknew).

ally(X) :- attack(X, Y), enemy(Y, america).

patriot(X) :- sold(X, Y, Z), weapons(Y), ally(Z).


% Problem 4:
female(mum).
female(kydd).
female(elizabeth).
female(margaret).
female(diana).
female(anne).
female(sarah).
female(sophie).
female(zara).
female(beatrice).
female(eugenie).
female(louise).

male(george).
male(philip).
male(spencer).
male(charles).
male(mark).
male(andrew).
male(edward).
male(william).
male(harry).
male(peter).
male(james).

mother(mum, elizabeth).
mother(mum, margaret).
mother(kydd, diana).
mother(elizabeth, charles).
mother(elizabeth, anne).
mother(elizabeth, andrew).
mother(elizabeth, edward).
mother(diana, william).
mother(diana, harry).
mother(anne, peter).
mother(anne, zara).
mother(sarah, beatrice).
mother(sarah, eugenie).
mother(sophie, louise).
mother(sophie, james).

father(george, elizabeth).
father(george, margaret).
father(spencer, diana).
father(philip, charles).
father(philip, anne).
father(philip, andrew).
father(philip, edward).
father(charles, william).
father(charles, harry).
father(mark, peter).
father(mark, zara).
father(andrew, beatrice).
father(andrew, eugenie).
father(edward, louise).
father(edward, james).

% X is a parent of Y
parent(X, Y) :- mother(X, Y), female(X).
parent(X, Y) :- father(X, Y), male(X).

% X is a grandchild of Y 
grandchild(X, Y) :- parent(P, X), parent(Y, P).

% X is a greatgrandparent of Y
greatgrandparent(X, Y) :- parent(P, Y), grandchild(P, X).

% X is an ancestor of Y
ancestor(X, Y) :- parent(X, Y).
ancestor(X, Y) :- parent(P, Y), ancestor(X, P).

% X is the sibling of Y
sibling(X, Y) :- father(F, X), father(F, Y), mother(M, X), mother(M, Y), X \= Y.

% X is the brother of Y
brother(X, Y) :- sibling(X, Y), male(X).

% X is the sister of Y
sister(X, Y) :- sibling(X, Y), female(X).

% X is the daughter of Y
daughter(X, Y) :- parent(Y, X), female(X).

% X is the son of Y
son(X, Y) :- parent(Y, X), male(X).

% X is the first cousin of Y
firstcousin(X, Y) :- parent(P, X), parent(Q, Y), sibling(P, Q).

% X is the spouse of Y
spouse(X, Y) :- parent(Y, A), !, parent(X, A), X \= Y.

% X is the brother-in-law of Y
brotherinlaw(X, Y) :- spouse(S, Y), brother(X, S).

% X is the sister-in-law of Y
sisterinlaw(X, Y) :- spouse(S, Y), sister(X, S).

% X is the aunt of Y
aunt(X, Y) :- parent(P, Y), sister(X, P).

% X is the uncle of Y
uncle(X, Y) :- parent(P, Y), brother(X, P).

% X is the Mth cousin of Y, N times removed
mthcousin(X, Y, 1) :- parent(A, X), parent(B, Y), sibling(A, B).
mthcousin(X, Y, M) :- C is M-1, parent(A, X), parent(B, Y), mthcousin(A, B, C).

mthcousinnrem(X, Y, M, 0) :- mthcousin(X, Y, M).
mthcousinnrem(X, Y, M, N) :- L is N-1, parent(B, Y), mthcousinnrem(X, B, M, L).
