type 'a tree = Leaf | Node of ('a tree)*('a tree)*'a;;

let t = Node (Node(Leaf,Leaf,false),Node(Leaf,Leaf,true),true);;

let rec string_of_tree t = 
match t with
Leaf -> "Leaf"
|Node (x,y,z) -> "Node ("^(string_of_tree x)^","^(string_of_tree y)^","^(string_of_bool z)^")";;

let rec mem t a =
match t with
Leaf -> false
|Node (x,y,z) -> if a<z then mem x a else if a = z then true else mem y a;;

let rec add t a = 
match t with
Leaf -> Node (Leaf,Leaf,a)
|Node (x,y,z) -> if a<z then Node(add x a,y,z) else Node (x,add y a,z);;

let rec minTree t =
  match t with
     Leaf -> raise (Invalid_argument "Empty tree contains no minimal value")
    |Node (x,y,z) -> if x <> Leaf then minTree x else z;;


let rec del t a =
match t with
Leaf -> Leaf
|Node (x,y,z) -> if a=z then(if not(x=Leaf&&y=Leaf) then Node(x,del y (minTree y),minTree y) else Leaf)else if a<z then Node(del x a,y,z) else Node(x,del y a,z);;

open List;;

let rec vallist t =
  match t with
    Leaf -> []
    |Node(x,y,z) -> (vallist x)@[z]@(vallist y);;

 let rec verify t = 
  match t with
    Leaf -> true
    |Node (x,y,z) -> if (for_all ((>) z) (vallist x))&& (for_all ((<=) z) (vallist y)) then (verify x)&&(verify y) else false;;


(*print_string (string_of_bool (verify t));;*)
(*print_string (if (mem t 1) then "True" else "False");;*)
(*print_string (string_of_tree(add t 21);;*)
(*print_string(string_of_tree t);;*)
(*print_string(string_of_tree(del t false));;*)

print_newline();;
