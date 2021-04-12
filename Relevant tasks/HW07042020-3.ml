let n = read_int();;

let res = ref [];;
let rec countseq n prev=
	if n = 1 then res:= (prev^"1")::(prev^"0"):: !res 
	else if n=0 then res:=prev:: !res else(
		countseq (n-1) (prev^"0");
		countseq (n-2) (prev^"10"))
;;

countseq n "";;

List.iter(Printf.printf "%s\n") !res;;
print_int(List.length !res)
