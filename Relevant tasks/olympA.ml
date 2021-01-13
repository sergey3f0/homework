let len = read_int();;
let s1 = read_line();;
let s2 = read_line();; 
open Array;;

let s = ref(make len 0);;
for i = 0 to len-1 do
	if s1.[i] = s2.[i] then () else !s.(i) <- 1
done;;
iter(Printf.printf "%d") !s
