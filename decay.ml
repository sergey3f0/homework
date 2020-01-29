let n = read_int();;

let rec count_parts x l= 
for i = 1 to x do
	if i = x then (print_int i; List.iter(Printf.printf "+%d") l; print_newline());
	count_parts (x-i) (i::l)
done;;
count_parts n [];;
