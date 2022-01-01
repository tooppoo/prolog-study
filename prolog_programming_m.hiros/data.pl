
my_flatten([X | Xs], Ls) :-
  my_flatten(X, Ys1),
  my_flatten(Xs, Ys2),
  append(Ys1, Ys2, Ls).
my_flatten(X, [X]) :- atomic(X), X \== [].
my_flatten([], []).

take_int([X | Xs], Ls) :-
  take_int(X, Ys1),
  take_int(Xs, Ys2),
  append(Ys1, Ys2, Ls), !.
take_int(X, [X]) :- integer(X), !.
take_int(_, []).

if(Test, Then, _) :- Test, !, Then.
if(_, _, Else) :- Else.

ticket1(Age, Money) :- Age < 13, Money is 500, !.
ticket1(_, Money) :- Money is 1000.

ticket2(Age, Money) :- if(Age < 13, Money is 500, Money is 1000).

ticket3(Age, Money) :- Age < 13 -> Money is 500 ; Money is 1000.

remove(_, [], []).
remove(X, [X | Xs], Zs) :- remove(X, Xs, Zs).
remove(X, [Y | Ys], [Y | Zs]) :- X \= Y, remove(X, Ys, Zs).

echo :- repeat, read(X), echo_sub(X), !.
echo_sub(X) :- X == end_of_file, !.
echo_sub(X) :- write(X), nl, fail.

yes_or_no(X) :-
  repeat,
  write('yer or no >'),
  read(X),
  (X == yes ; X == no),
  !.

between(L, H, V) :-
  L =< V,
  V =< H.

between2(L, H, L) :- L =< H.
between2(L, H, V) :-
  L < H,
  L1 is L + 1,
  between2(L1, H, V).

fact(X, Sum) :- fact(X, 1, Sum).
fact(X, Y, Sum) :-
  X > 0,
  Y1 is Y * X,
  X1 is X - 1,
  fact(X1, Y1, Sum).
fact(0, Sum, Sum).

% limit at N = 31
fibo(0, 0).
fibo(1, 1).
fibo(N, F) :-
  N >= 2,
  N1 is N - 1,
  N2 is N - 2,
  fibo(N1, F1),
  fibo(N2, F2),
  F is F1 + F2.

% enable 10 * 6
fibo2(0, 0).
fibo2(N, F) :- fibo2(N, 1, 0, F).
fibo2(1, Cur, _, Cur).
fibo2(N, Cur, Prev, F) :-
  N >= 2,
  N1 is N - 1,
  Next is Cur + Prev,
  fibo2(N1, Next, Cur, F).

reverse(Xs, Res) :- reverse(Xs, [], Res).
reverse([], Xs, Xs).
reverse([X | Xs], Res, Ys) :-
  reverse(Xs, [X | Res], Ys).
