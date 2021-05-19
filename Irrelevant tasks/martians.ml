open Array;;
let amount = read_int();;
let m = make_matrix amount amount false;;
let dat = ref [];;
for i = 0 to (amount-1) do
	dat := (List.map(int_of_string) (String.split_on_char ' ' (read_line())));
	for j = 0 to ((List.length !dat)-1) do
		 try m.(i).((List.nth !dat j)-1) <- true
		 with Invalid_argument _ ->()
	done;
done;;

let fathers a =
let l = ref [] in 
for i = 0 to (amount-1) do 
	l:=m.(a).(i)::!l
done;
l;; 

for i = 0 to (amount-1) do
	if (List.for_all ((<>)true) (fathers i)) then
	

iter(fun a ->iter(Printf.printf "%b;") a; print_string "\n") m;;
