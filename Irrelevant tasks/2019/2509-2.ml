let f = open_in "anna.txt";;
open List;;
let x = ref "";;

let foo =
try 
while true do
x:= !x^(input_line f)
done
with End_of_file -> ();;

let bar = (String.split_on_char ' ' !x);;

let rec frequency l=
match l with
hd::tl -> ( (length (filter (fun a -> if a = hd then true else false) l)),hd )::(frequency tl)
|[]->[]                                                                              ;;

let y =hd (fast_sort (fun a b -> if a > b then -1 else if a=b then 0 else 1) (frequency bar));;
print_string ((snd y)^"\n");;
print_int (fst y);;
