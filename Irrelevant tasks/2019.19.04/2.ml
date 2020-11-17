type tree = Leaf | Node of tree*tree*int;;
let rec bamboo n i=
if i < n then
Node(Leaf,(bamboo n (i+1)),i)
else Leaf;;
let rec print_tree t =
match t with
Leaf ->print_string "Leaf"
|Node (x,y,z) -> (print_string "Node (" ; print_tree x; print_string "," ;print_tree y; print_string ","; print_int z; print_string ")");;

print_tree (bamboo (read_int()) 0);;
