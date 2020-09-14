let txt = "vim.txt";;
let line = ref "";;

let ic = open_in txt in
try 
	while true do
	line:= !line^(input_line ic)
	done;
with End_of_file -> 
	close_in ic;;
let words = ref (String.split_on_char ' ' !line);;

let list = ref [] ;;
while !words <> [] do 
match !words with
[] -> ()
|hd::tl -> let l = List.partition ((=) hd) !words in 
list:=!list@[(fst l)]; 
words:=(snd l);
done;;

list:=List.fast_sort (fun a b -> if (List.length a) > (List.length b) then -1 else if (List.length a)<(List.length b) then 1 else 0) !list;;
for i = 0 to 10 do
print_string ((List.nth (List.nth !list i) 0)^(string_of_int(List.length (List.nth !list i)))^"\n")
done;;
print_newline();;
