let txt = "vim.txt";;
let line = ref "";;
open List;;
exception Foo;;

let ic = open_in txt in
try 
	while true do
	line:= !line^(input_line ic)
	done;
with End_of_file -> 
	close_in ic;;
let words =List.fast_sort (fun a b -> if a<b then 1 else if a=b then 0 else -1) (String.split_on_char ' ' !line);;

let find l a =
try
	for i = 0 to ((length l)-1) do
	if (nth l i)=a then raise Foo
	done;
with Foo ->
i;;

let l = ref [] in
let rec mkuniq l =
match l with
[] -> 
|a::b -> if (length a) = (i-2) then 
