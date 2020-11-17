type t2 = B of t2 list;;

let rec foo t o=
match t with
B([]) -> print_string ((String.make o ' ')^"*\n") 
|B(hd::tl) -> print_string ((String.make o ' ')^"*\n"); foo hd (o+3); for j = 0 to ((List.length tl) -1) do foo (List.nth tl j) (o+3) done;;

foo (B[B[B[];B[]];B[];B[]]) 0;; 
