type tree = Leaf | Node of tree*tree*int;;

let rec build_tree n count i lr=  (*n - глубина i вычисляет ноду lr определяет сторону count счётчик*)
if count < n then(
if n = 0 then Leaf else
(
if lr = 'l' then 
Node (build_tree n (count+1) (i-1) 'l' ,build_tree n (count+1) (i-1) 'r' ,(i*i)-2-((i-1)*(i-1)))
else if lr = '0' then 
Node (build_tree n (count+1) (i-1) 'l',build_tree n (count+1) (i-1) 'r' ,(i*i)-1)
else if lr = 'r' then
Node (build_tree n (count+1) (i-1) 'l' ,build_tree n (count+1) (i-1) 'r' ,((i*i)-2+((i-1)*(i-1))))
else failwith "Incorrect side identificator"
))
else Leaf
;;

let rec print_tree t =
match t with
Leaf ->print_string "Leaf"
|Node (x,y,z) -> (print_string "Node (" ; print_tree x; print_string "," ;print_tree y; print_string ","; print_int z; print_string ")");;

let depth = read_int();;

print_tree (build_tree depth 0 depth '0') ;;
print_string "\n";;
