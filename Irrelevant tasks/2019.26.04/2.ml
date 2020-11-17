type t = B of t*t | L;;

let rec foo t o=
match t with
|L -> (String.make o ' ')^"."
|B (x,y) -> ((String.make o ' ')^"*\n"^(foo x (o+3))^"\n"^(foo y (o+3))^"\n");;

let x = B(B(L,L),L);;

print_string (foo x 0);;