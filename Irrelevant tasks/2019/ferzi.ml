open Array;;
let bar = Unix.time();;
let n = read_int();;

let board = make_matrix n n ' ';;

let checker m i j =
let res = ref true in
for l = 0 to ((length m.(0))-1) do
	for k=0 to ((length m.(0))-1) do
		if m.(i).(k) = 'W' then res := false;
		if m.(l).(j) = 'W' then res := false;
		if (j+l) < n && (i-l) > -1 then if m.(i-l).(j+l) = 'W' then res := false;
		if (j+l) < n && (i+l) < n then if m.(i+l).(j+l) = 'W' then res := false ;
		if (j-l) > -1 && (i+l) < n then if m.(i+l).(j-l) = 'W' then res := false;
		if (j-l) > -1 && (i-l) > -1 then if m.(i-l).(j-l) = 'W' then res := false;		
		done
		done;
		!res;;

let rec findindexof a x i=
if i < (length a) then 
if a.(i) = x then i else findindexof a x (i+1) else -1 ;;

let x = ref (-1);;

let rec place i j  =
if i < n && j < n then
	if (checker board i j) then (board.(i).(j) <- 'W'; place (i+1) 0) else  place i (j+1) 
	else if i < n then  (x:= (findindexof board.(i-1) 'W' 0); board.(i-1) <- (make n ' '); place (i-1) (!x+1));;

place 0 0;;


for i = 0 to (n-1) do
iter(Printf.printf "%c;")  board.(i)	;
print_newline()
done;;
print_newline();;

print_float (Unix.time()-.bar);;
