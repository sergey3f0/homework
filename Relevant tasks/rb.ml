type 'a tree = Leaf|Node of ('a tree*'a tree*'a)*bool;;
print_string "\027[107;30m\n";;
let t =Node((Node((Leaf,Leaf,3),true),Node((Leaf,Leaf,7),true),5),false);;

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
|Node ((l,r,v),col) -> print_indent col (string_of_int v) prefix;
	      
	     print_tree l (prefix @ [true]);
	    
	     print_tree r (prefix @ [false]);;
	
let rt t = match t with (Node(_,true),_,_)|(_,Node(_,true),_) ->true
|_->false;;

let rec fix t =match t with
	Node((Node(l,true),Node(r,true),x),false) when (rt l||rt r)-> Node((Node(l,false),Node(r,false),x),true)
	|Node((Node((Node(ll,true),lr,lv),true),r,v),false) -> Node((Node(ll,true),Node((lr,r,v),true),lv),false)
	|Node((Node((ll,lr,lv),true),r,v),false) when (rt ll) ->Node((Node((ll,lr,lv),true),r,v),false) 
	|_->t;;
let rec add t a = 
	match t with
		Leaf -> Node ((Leaf,Leaf,a),true)
		|Node ((x,y,z),c) when a<z -> fix(Node(((add x a),y,z),c))
		|Node ((x,y,z),c) when a=z -> Node((x,y,z),c)
		|Node ((x,y,z),c) ->  fix(Node((x,(add y a),z),c));;


print_tree (add t 4) [];;
print_string "\027[0m\n";;
