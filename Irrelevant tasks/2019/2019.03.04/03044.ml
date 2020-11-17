let n =read_int();;

let king n =
print_string ((String.make n '*')^"\n");
for i = 0 to ((n/2)-2) do
print_string ((String.make (n/2) ' ')^"*\n")
done;
print_string ((String.make n '*')^"\n");
for i = 0 to ((n/2)-2) do
print_string ((String.make (n/2) ' ')^"*\n")
done;
print_string ((String.make n '*')^"\n");;

king n;;