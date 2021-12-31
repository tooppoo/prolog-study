/* 男性 */
male(taro).
male(ichiro).
male(jiro).
male(saburo).

/* 女性 */
female(hanako).
female(tomoko).
female(sachiko).
female(youko).

/* 父親 */
father_of(taro, ichiro).
father_of(taro, jiro).
father_of(taro, tomoko).
father_of(ichiro, saburo).
father_of(ichiro, youko).

/* 母親 */
mother_of(hanako, ichiro).
mother_of(hanako, jiro).
mother_of(hanako, tomoko).
mother_of(sachiko, saburo).
mother_of(sachiko, youko).

parents_of(X, Y) :- father_of(X, Y).
parents_of(X, Y) :- mother_of(X, Y).

son_of(X, Y) :- parents_of(Y, X), male(X).

daughter_of(X, Y) :- parents_of(Y, X), female(X).

child_of(X, Y) :- son_of(X, Y).
child_of(X, Y) :- daughter_of(X, Y).

grand_father_of(X, Y) :- parents_of(Z, Y), father_of(X, Z).

grand_mother_of(X, Y) :- parents_of(Z, Y), mother_of(X, Z).
