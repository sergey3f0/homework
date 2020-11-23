type tree = Leaf | Node of tree*tree*int;;

let tr = Node (Leaf,Node(Leaf,Node(Leaf,Node(Leaf,Leaf,1),1),1),1);;

let rec string_of_tree t = 
	match t with
		Leaf -> "Leaf"
		|Node (x,y,z) -> "Node ("^(string_of_tree x)^","^(string_of_tree y)^","^(string_of_int z)^")";;

let isBamboo tree =
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

let minmax t =
let r = List.fast_sort (fun a b -> if a > b then 1 else if a = b then 0 else -1)(depth_list t) in
((List.nth r 0),(List.nth (List.rev r) 0));;


let isBalanced t =

let r = List.fast_sort (fun a b -> if a > b then 1 else if a = b then 0 else -1)(depth_list t) in
if (abs ((List.nth r 0)-(List.nth (List.rev r) 0)) > 1) then false else true;;

let rec bamboo i = 
	if i > 0 then
		Node(bamboo (i-1),Leaf,i)
	else
		Leaf;;

let rec fulltree a = 
	if a > 0 then
		Node(fulltree (a-1),fulltree(a-1),1)
	else Leaf;;

let tree_of_minmax mn mx = 
if (mn > mx || (mx<>0&&mn = 0))then raise (Invalid_argument "Unable to build tree with given depths") else if ((mn = 0)&&( mx = 0)) then Leaf else
	Node (fulltree (mn-1),fulltree (mx-1),1);;
