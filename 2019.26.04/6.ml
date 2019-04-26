type t = B of t*t | L;;

let rec foo s =                   
match s.[(String.index s '\n')-1] with
|'.' -> L
|'*' -> B (foo (String.sub s ((String.index s '\n')-1) ((String.length s)-1)), 
foo (String.sub (String.sub s ((String.index s '\n')-1) ((String.length s)-1)) ((String.index (String.sub s ((String.index s '\')-1) ((String.length s)-1)) '\n')-1) 
((String.length (String.sub s ((String.index s '\n')-1) ((String.length s)-1)))-1)))
|_ -> failwith "nope";;

let rec bar t=
match t with
|L -> "L"
|B (x,y) -> ("B("^(bar x)^","^(bar y)^")");;

print_string (bar(foo 
"*\n   *\n      .\n      .\n   .\n"));;