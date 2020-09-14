type t2 = B of t2 list;;

let rec foo t =
match t with
B([]) -> print_string "B[]" 
|B(hd::tl) -> print_string "B["; foo hd ; print_string ";"; for j = 0 to ((List.length tl) -1) do foo (List.nth tl j); 
if j <((List.length tl)-1) then print_string ";" done; print_string "]";;

foo( B[B[B[];B[]];B[];B[]]);; 
