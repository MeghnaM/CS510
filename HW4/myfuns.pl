  male(bob).
  male(jim).
  male(frank).
  male(doug).

  female(mary).
  female(susan).
  female(betsy).

  parent(bob,mary).
  parent(jim, bob).
  parent(frank,jim).
  parent(doug, frank).

  parent(susan, mary).
  parent(betsy, susan).

  mother(X,Y) :- parent(X,Y), female(X).
  father(X,Y) :- parent(X,Y), male(X).

  grandfather(X,Y) :- father(X,Z), parent(Z,Y).
  grandmother(X,Y) :- mother(X,Z), parent(Z,Y).

  ancestor(X,Y) :- ancestor(X,Z), parent(Z,Y).
  ancestor(X,Y) :- parent(X,Y).

  ancestor2(X,Y) :- parent(Z,Y), ancestor2(X,Z).
  ancestor2(X,Y) :- parent(X,Y).

   
  head([A| _X], A ).
  tail([_A|X], X).
  conc(A, X, [A|X]).
  
  append1( [], Y, Y).
  append1( [A|X], Y, [A| Z] ) :- append1( X, Y, Z ).

  a(X,Y,Z) :- b(X), c(Y), !, d(Z).
  b(1).
  b(2).
  b(3).
  c(1).
  c(2).
    c(3).
    d(1).
    d(3).
    d(2).

  member1(X,[X|_]).
  member1(X,[_Y|T]) :- member1(X,T).
