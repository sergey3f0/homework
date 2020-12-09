open List;;


let webinfo =
	let inln = String.split_on_char ' ' (read_line()) in 
	(int_of_string (hd inln),int_of_string(hd(tl inln)))
;;
let threadlist = 
	let out = ref [] in
	for i = 0 to (snd webinfo)-1 do
		let inln = String.split_on_char ' ' (read_line()) in
		out:=(int_of_string (hd inln),int_of_string(hd(tl inln)))::!out
	done;
	!out
;;
let cuta = 
	let inin = read_int() in
	if inin <= (snd webinfo) && inin >= 1 then inin else raise (Invalid_argument "Unable to cut web given way")
;;
let cutlist = map int_of_string (String.split_on_char ' ' (read_line()));;


let cut x = filteri (fun a b ->if a<>(x-1) then true else false) threadlist;;

let chunks l =
let chunkres = ref 0 in
let rec chunks' count list conlist res=
	if count < (fst webinfo) then(
		match (nth threadlist count) with
			(x,y) when (for_all (((<>)x)&&((<>)y)) conlist) -> chunks' (count+1) list (x::y::conlist) (res+1)
			|(x,y) when (for_all ((<>)x) conlist) -> chunks' (count+1) list (x::conlist) res
			|(x,y) when (for_all ((<>)y) conlist) -> chunks' (count+1) list (y::conlist) res
			|(x,y) -> chunks' (count+1) list conlist res
			|_ -> ())
	else chunkres:=res in chunks' 0 l [] 1;;
