open List;;


let webinfo =
	let inln = String.split_on_char ' ' (read_line()) in 
	(int_of_string (hd inln),int_of_string(hd(tl inln)))
;;
let  threadlist =ref( 
	let out = ref [] in
	for i = 0 to (snd webinfo)-1 do
		let inln = String.split_on_char ' ' (read_line()) in
		out:=(int_of_string (hd inln),int_of_string(hd(tl inln)))::!out
	done;
	rev(!out))
;;
for i = 1 to (fst webinfo) do
	threadlist:=!threadlist@[(i,i)]
done;;
	
let cuta = 
	let inin = read_int() in
	if inin <= (snd webinfo) && inin >= 1 then inin else raise (Invalid_argument "Unable to cut web given way")
;;
let cutlist = map int_of_string (String.split_on_char ' ' (read_line()));;
(*ЧТЕНИЕ ВСЕЙ ХРЕНИ*)

let cut x =threadlist := filteri (fun a b ->if a<>(x-1) then true else false) !threadlist;;

let chunks l =
	let out = ref 0 in
	let connectionlist =  ref [] in
	for i = 0 to (length l)-1 do
		match (nth l i) with
			|(a,b) -> 
				if 
					(for_all (fun x -> if x<>a &&x<>b then true else false) !connectionlist) 
				then (
					out:=!out+1;connectionlist:=a::b::!connectionlist)
				else if 
					(for_all (fun x -> if x<>b then true else false) !connectionlist)
				then 
					connectionlist:=b::!connectionlist
				else if 
					(for_all (fun x -> if x<>a then true else false) !connectionlist)
				then 
					connectionlist:=a::!connectionlist
				else ()
	done;
	!out
;;

for i = 0 to cuta-1 do
	cut (i+1);
	print_int(chunks !threadlist);
	print_char ' ';
done;;
