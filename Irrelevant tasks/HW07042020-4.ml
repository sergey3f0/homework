let n = read_int();;

let res = ref [];;

let rec main n prev=
	if n=0 then res:=prev:: !res else(
	for i = n downto 1 do
		main (n-i) (prev@[i])
	done);;

main n [];;

let x = (List.sort_uniq (compare) (List.map(List.sort compare) !res));; (*За эту строку я буду гореть в аду, но и ладно*)

List.iter (fun a -> List.iter(Printf.printf "%d+") a;print_string "\n") x;;
print_int (List.length x);;
