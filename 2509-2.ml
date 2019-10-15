let f = open_in "anna.txt";;
open List;;
let x = ref "";;

let foo =
try 
while true do
x:= !x^(input_line f)
done
with End_of_file -> ();;

let bar = (blit_on_char '' x);;

let rec frequency l=
match l with
hd::tl -> (length (filter (f a -> if a = hd then true else false) l))::(frequency tl)
|[]->[]                                                                              ;;

print_string hd(rev(fast_sort (f a b if a > b then 1 else if a=b then 0 else -1) (frequency bar)));;                               	