type lambda = Var of string | App of lambda*lambda |Abs of string*lambda;;

let v =(App ((Var "x"),(Abs ("0",Var "0"))));; (*Первый \ терм*)
let b =(App ((Var "x"),(Abs ("1",Var "1"))));; (*Второй \ терм*)

let res = ref 0 ;;
let rec makevar l =
match l with
Var x -> res := !res+1
|App (x,y) -> makevar x; makevar y 
|Abs (x,l) -> res:= !res+1; makevar l
;;
let mkvar l =
res:=0;
makevar l;
"."^(string_of_int (!res));;

let rec replace a b l =
match l with
Var x -> if x = a then Var b else Var x
|App (x,y) -> App(replace a b x,replace a b y)
|Abs (x,k) -> Abs((if x = a then b else x), replace a b k)
;;

let rec check_aeq x y=
match x with 
(Var a) -> if y = Var a then true else false
|(App (a,b)) -> 
	(match y with 
		App (c,d) -> if check_aeq a c && check_aeq b d then true else false
		|_-> false)
|(Abs (a,l)) -> 
	(match y with
		Abs (b,k) ->  if check_aeq (replace a (mkvar l) l) (replace b (mkvar k) k) then true else false
		|_-> false);;
		
if (check_aeq v b) then print_string "True\n" else print_string "False\n";;
