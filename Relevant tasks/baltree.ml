type 'a tree = Leaf | Node of 'a tree*'a tree*'a;;

let tr = Node (Leaf,Node(Leaf,Node(Leaf,Node(Leaf,Leaf,1),1),1),1);;

let rec string_of_tree t = 
	match t with
		Leaf -> "Leaf"
		|Node (x,y,z) -> "Node ("^(string_of_tree x)^","^(string_of_tree y)^","^(string_of_int z)^")";;

let isBamboo tree = (*Задание - is_bamboo*)
let res = ref true in
let rec isBambo tree =
	match tree with 
		Leaf -> ()
		|Node (x,y,z) -> if ((x=Leaf)||(y=Leaf)) then (isBambo x; isBambo y) else res:= false in
isBambo tree;
!res;;

let depth_list t =
let res = ref [] in
let rec depth_lis t i=
	match t with
		Leaf -> res:=(i::!res)
		|Node(x,y,z) -> (depth_lis x (i+1);depth_lis y (i+1)) in
depth_lis t 0;
!res;;

let minmax t =(*Задание - min_max_depth*)
let r = List.fast_sort (fun a b -> if a > b then 1 else if a = b then 0 else -1)(depth_list t) in
((List.nth r 0),(List.nth (List.rev r) 0));;


let isBalanced t =(*Задание - is_balanced*)

let r = List.fast_sort (fun a b -> if a > b then 1 else if a = b then 0 else -1)(depth_list t) in
if (abs ((List.nth r 0)-(List.nth (List.rev r) 0)) > 1) then false else true;;

let rec bamboo i = (*Задание - построить бамбук*)
	if i > 0 then
		Node(bamboo (i-1),Leaf,i)
	else
		Leaf;;

let rec fulltree a = 
	if a > 0 then
		Node(fulltree (a-1),fulltree(a-1),1)
	else Leaf;;

let tree_of_minmax mn mx = (*Задание - по (min,max)_depth построить дерево*)
if (mn > mx || (mx<>0&&mn = 0))then raise (Invalid_argument "Unable to build tree with given depths") else if ((mn = 0)&&( mx = 0)) then Leaf else
	Node (fulltree (mn-1),fulltree (mx-1),1)
;;

let rec tree_of_dlist cd dl =(*Задание - по списку глубин построить дерево*)
if (List.for_all ((<)0) dl) then 
match (List.sort_uniq compare dl) with
	[]->Leaf
	|a::(b::tl) -> Node(fulltree(a-cd-1),tree_of_dlist (cd+1) (b::tl),1)
	|a::[] -> fulltree (a-cd) 
else raise (Invalid_argument "");;


let rec print_prefix prefix = 
	match prefix with
 [] -> print_string ""
|[true] -> print_string "  +--"
|[false] -> print_string "  \\--"
|true :: b -> print_string "  |  ";print_prefix b
|false :: b -> print_string "     ";print_prefix b;;

let print_indent k prefix = 
	print_prefix prefix;print_string ("(" ^ (string_of_int k) ^ ")\n");;

let print_leaf prefix = print_prefix prefix;print_string "*\n";;

let rec print_tree node prefix = 
	match node with
	 Leaf -> print_leaf prefix
|Node (l,r,k) -> print_indent k prefix;
			  
			 print_tree l (prefix @ [true]);
			
			 print_tree r (prefix @ [false]);;


print_tree (tree_of_minmax 3 5) [];;

List.iter(Printf.printf "%d;") (List.sort_uniq compare (depth_list(tree_of_dlist 0 [4;1;2;7])))
