type 'a tree = Leaf | Node of 'a*'a tree list;;
open String;;
exception Found of int;;

let findindex p s =
  try 
    for i = 0 to (length s)-1 do
      if p (s.[i]) then raise (Found i)
    done;
    raise Not_found
  with (Found i) -> i ;;

let to_list s =
let rec to_list' nesting count lastvali s =
  if count<(length s) then
    match s.[count] with
      '(' -> to_list' (nesting+1) (count+1) lastvali s
      |',' when nesting=0 -> [(sub s lastvali (count-lastvali))]@(to_list' nesting (count+1) (count+1) s)
      |')' -> to_list' (nesting-1) (count+1) lastvali s
      |_-> to_list' nesting (count+1) lastvali s
  else [(sub s lastvali (count-lastvali))] in
to_list' 0 0 0 s;;


let rec of_string s =
  match s with
    "Leaf"->Leaf
    |_->
      Node(sub s 1 ((findindex ((=)',') s)-1)
        ,List.map of_string (to_list(sub s ((findindex ((=)',') s)+1) ((length s)-2-(findindex ((=)',') s)))))
;;

let rec string_of_tree t = 
	match t with
		Leaf -> "Leaf"
    |Node (x,y) -> "Node ("^x^",["^(let x = ref "" in for i = 0 to (List.length y)-1 do x:=!x^(string_of_tree(List.nth y i))^";" done; !x^"\b")^"])";;

print_string (string_of_tree (of_string "(VAL,(Val1,Leaf),(Val2,Leaf,Leaf),(Val3,Leaf,Leaf,Leaf))"))
