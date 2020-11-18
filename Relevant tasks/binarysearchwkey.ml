open Array;;
type 'a tree = Leaf | Node of 'a tree*'a tree*('a*'a);;

let t = Node (Node(Node(Leaf,Leaf,(3,1)),Leaf,(5,2)),Node(Node(Leaf,Leaf,(15,3)),Node(Leaf,Leaf,(25,4)),(20,5)),(10,6));;

let rec add nd kv =
	match nd with
		Leaf -> Node(Leaf,Leaf,kv)
		|Node(x,y,(a,b)) -> if (a<(fst kv)) then Node(x,add y kv,(a,b)) else if (a>(fst kv)) then Node(add x kv,y,(a,b)) else Node(x,y,kv);;

let rec find nd k =
	match nd with
		Leaf -> None
		|Node(x,y,(a,b)) -> if a = k then Some b else if (a<k) then find y k else find x k;;
		
let rec mem nd k =
	match nd with
		Leaf -> false
		|Node(x,y,(a,b)) -> if a = k then true else if (a<k) then mem y k else mem x k;;
		
(*DEBUG*)
(*let rec string_of_tree t = 
	match t with
		Leaf -> "Leaf"
		|Node (x,y,(a,b)) -> "Node ("^(string_of_tree x)^","^(string_of_tree y)^",("^(string_of_int a)^","^(string_of_int b)^"))";;

print_string (string_of_tree(add t (7,2)))*)
(*
print_string (match find t 20 with
	None -> "Given tree does not contain this element\n"
	|Some x -> (string_of_int x)^"\n")
*)
(*
print_string (if (mem t 0) then "True" else "False")
*)
