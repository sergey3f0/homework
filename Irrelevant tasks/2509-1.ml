let f = open_in "anna.txt";;
open String;;
let foo = ref "";;

let findlongest =
try 
while true do
foo:= !foo^(input_line f)
done
with End_of_file -> ();;

let x = List.fast_sort (fun a b -> if (length a) > (length b) then -1 else if (length a) = (length b) then 0 else 1) (split_on_char ' ' !foo);;
print_string (List.hd x);;
