type tree = Leaf | Node of tree*tree*int;;

let rec build_tree n i j t c=
match n with
1 -> Leaf
|_ ->if c <= n then (if n> 0  then Node ((build_tree (n-1) (i-1) (j+1) false (c+1)), (build_tree (n-1) (i-1) (j+1) true (c+1)), (if t then j else i)) else  failwith "Invalid tree depth" )else Leaf;;

let rec print_tree t =
match t with
Leaf ->print_string "Leaf"
|Node (x,y,z) -> (print_string "Node (" ; print_tree x; print_string "," ;print_tree y; print_string ","; print_int z; print_string ")");;

let depth = read_int();;

print_tree (build_tree depth (depth/2) (depth/2) true 0) ;;
print_string "\n";;