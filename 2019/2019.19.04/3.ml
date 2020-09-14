type tree = Leaf | Node of tree*tree*int;;
open Unix;;

let rec search t n =
match t with 
|Leaf -> false
|Node (t1,t2,x) -> if x > n then search t1 n else if x < n then search t2 n else true;;

let t1 = Node (Node(Leaf,Leaf,2),Node(Leaf,Leaf,6),4);;
let t2 = Node (Node(Node(Leaf,Leaf,4),Node(Leaf,Leaf,6),5),Node(Node(Leaf,Leaf,10),Node(Leaf,Leaf,16),14),7);;

let foo = time();;
search t1 4;;
print_float ((time())-. foo);;
let bar = time();;
search t2 6;;
print_float ((time())-. bar);;
print_string "\n";;
