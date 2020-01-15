open Array;;
let n = read_int();;

let board = make_matrix n n ' ';;

let paint m i j =
for l = 0 to ((length m.(0))-1) do
	for k=0 to ((length m.(0))-1) do
		m.(i).(k) <- '.';
		m.(l).(j) <- '.';
		if (j+l) < n && (i-l) > -1 then m.(i-l).(j+l) <- '.';
		if (j+l) < n && (i+l) < n then m.(i+l).(j+l) <- '.';
		if (j-l) > -1 && (i+l) < n then m.(i+l).(j-l) <- '.';
		if (j-l) > -1 && (i-l) > -1 then m.(i-l).(j-l) <- '.';		
		done
		done;;
let place  =
paint board 0 0;
board.(0).(0) <- 'W';;
	for i=0 to (n-1) do
		for j=0 to (n-1) do
			if (board.(i).(j)) = ' ' then (paint board i j; board.(i).(j) <- 'W') else ();
			done
			done;;

place;;

for i = 0 to (n-1) do
iter(Printf.printf "%c;")  board.(i)	;
print_newline()
done;;
