type tree = Leaf|Node of bool*int*tree*tree;;
print_string "\027[107;30m\n";;
let rec print_prefix prefix = 
    match prefix with
 [] -> print_string ""
|[true] -> print_string " ╚╦══"
|[false] -> print_string "  ╚══"
|true :: b -> print_string "  ║  ";print_prefix b
|false :: b -> print_string "     ";print_prefix b;;

let print_indent k v prefix = if k then(
    print_prefix prefix;print_string ("\027[31m" ^ v ^ "\027[30m╗\n"))
else( print_prefix prefix;print_string (v^"╗\n"));;

let print_leaf prefix = print_prefix prefix;print_string "*\n";;

let rec print_tree node prefix = 
    match node with
     Leaf -> print_leaf prefix
|Node (col,v,l,r) -> print_indent col (string_of_int v) prefix;
	      
	     print_tree l (prefix @ [true]);
	    
	     print_tree r (prefix @ [false]);;

print_tree(Node(false,5,Leaf,Node(true,6,Leaf,Leaf)))[];;
print_string "\027[0m\n";;