type 'a tree = Leaf | Node of ('a tree)*('a tree)*int;;

let t = Node (Node(Node(Leaf,Leaf,3),Node(Leaf,Leaf,7),5),Node(Leaf,Leaf,20),10);;

let rec string_of_tree t = 
match t with
Leaf -> "Leaf"
|Node (x,y,z) -> "Node ("^(string_of_tree x)^","^(string_of_tree y)^","^(string_of_int z)^")";;

let rec mem t a =
match t with
Leaf -> false
|Node (x,y,z) -> if a<z then mem x a else if a = z then true else mem y a;;

let rec add t a = 
match t with
Leaf -> Node (Leaf,Leaf,a)
|Node (x,y,z) -> if a<z then Node(add x a,y,z) else Node (x,add y a,z);;

let minTree t =
	let i = ref 0 in
	let rec miTree q =
		match q with
		Leaf -> ()
		|Node(x,y,z) -> if x <> Leaf then miTree x else i:=z in
miTree t;
!i;; 


let rec del t a =
match t with
Leaf -> Leaf
|Node (x,y,z) -> if a=z then(if not(x=Leaf&&y=Leaf) then Node(x,del y (minTree y),minTree y) else Leaf)else if a<z then Node(del x a,y,z) else Node(x,del y a,z);;

(*print_string (if (mem t 1) then "True" else "False");;*)
(*print_string (string_of_tree(add t 21);;*)
(*print_string(string_of_tree t);;*)
(*print_string(string_of_tree(del t 20));;*)

print_newline();;
