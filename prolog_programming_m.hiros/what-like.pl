
born_in(major_zero, england).
born_in(sigint, america).
born_in(para_medic, america).
born_in(naked_snake, america).

like(major_zero, tee).
like(sigint, coffee).
like(para_medic, coffee).
like(naked_snake, coffee).

like_coffee(X) :- like(X, coffee).
like_tee(X) :- like(X, tee).

british_gentlemen(Who) :- like_tee(Who), born_in(Who, england).
