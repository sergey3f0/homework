open List;;
let k =Scanf.scanf "%d %d" (fun a b -> (a,b));;

let m = fst k;;
let n = snd k;;
let list = ref [];;


for i = 0 to m do
	for j = 0 to n do
		for k = i+1 to m do
			for q = j+1 to n do
				(list:=((i,j),(k,q))::!list)
			done
		done
	done
done;;


iter(fun a -> match a with ((x,y),(z,p)) -> Printf.printf "((%d,%d),(%d,%d))\n" x y z p) !list;;
print_int (length !list);;
