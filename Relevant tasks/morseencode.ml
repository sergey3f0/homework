open String;;
print_string "Введите строку для кодирования: ";;
let s = read_line();;

let dict = [
('a',"* ***");
('b',"*** * * *");
('c',"*** * *** *");
('d',"*** * *");
('e',"*");
('f',"* * *** *");
('g',"*** *** *");
('h',"* * * *");
('i',"* *");
('j',"* *** *** ***");
('k',"*** * ***");
('l',"* *** * *");
('m',"*** ***");
('n',"*** *");
('o',"*** *** ***");
('p',"* *** *** *");
('q',"*** *** * ***");
('r',"* *** *");
('s',"* * *");
('t',"***");
('u',"* * ***");
('v',"* * * ***");
('w',"* *** ***");
('x',"*** * * ***");
('y',"*** * *** ***");
('z',"*** *** * *");
(' '," ")];;

let foo x = if x<0 then 27 else x;;

let encode s =
let out = ref "" in
	for i = 0 to (length s)-1 do
		out:=!out^"   "^(snd(List.find (fun a -> if ((fst a)=s.[i]) then true else false) dict))
	done;
!out;;
let o = lowercase_ascii (encode s);;
print_string (sub o 3 ((length o)-3)) ;;
