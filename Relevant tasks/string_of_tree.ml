type tree = Tree of tree list;;
let str = Tree[Tree[Tree[];Tree[]];Tree[];Tree[]];;

let rec main t =
match t with
	|[] -> ""
	|(Tree x)::z -> "("^(main x)^")"^(main z);;
print_string (main [str]);;
