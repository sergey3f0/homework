type t = B of t*t | L;;

let rec foo t=
match t with
|L -> "L"
|B (x,y) -> ("B("^(foo x)^","^(foo y)^")");;

let x = B(B(L,L),L);;

print_string (foo x);;