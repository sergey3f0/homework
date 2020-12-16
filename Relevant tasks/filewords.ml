let s = ref "";;
let fl = open_in (read_line()) in
	try
		while true do
			s:=!s^(input_line fl)
		done
	with End_of_file -> ();;

let l = String.split_on_char ' ' !s;;

print_int(List.length l);;
