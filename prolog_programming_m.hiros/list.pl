
first([X | _], X).
rest([_ | X], X).

add_to_list(X, Ls, [X | Ls]).

get_at(1, [X | _], X).
get_at(N, [_ | Ys], X) :-
  N > 1,
  N2 is N - 1,
  get_at(N2, Ys, X2),
  X is X2.

insert_at(1, X, Ls, [X | Ls]).
insert_at(N, X, [Y | Ls], [Y | Zs]) :-
  N > 1,
  N2 is N - 1,
  insert_at(N2, X, Ls, Zs).

remove_at(1, [_ | Xs], Xs).
remove_at(N, [X | Xs], [X | Zs]) :-
  N > 1,
  N2 is N - 1,
  remove_at(N2, Xs, Zs).

len([], 0).
len([_ | Xs], N) :-
  len(Xs, N2),
  N is N2 + 1.

concat([], Xs, Xs).
concat([X | Xs], Ys, [X | Ls]) :- concat(Xs, Ys, Ls).

include(X, [X | _]).
include(X, [_ | Xs]) :- include(X, Xs).

my_select(X, [X | Xs], Xs).
my_select(X, [Y | Ys], [Y | Zs]) :- my_select(X, Ys, Zs).

subset_of([], _).
subset_of([X | Xs], Ys) :-
  select(X, Ys, Ys1),
  subset_of(Xs, Ys1).

sum([], 0).
sum([X|XS], S) :-
  sum(XS, S1),
  S is X + S1.
