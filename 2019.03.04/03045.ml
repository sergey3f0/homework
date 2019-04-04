let n =read_int();;
                                                                                                 
let gold n =
print_string ((String.make (n/2) ' ')^"*\n");
for i = 0 to ((n/2)-1) do
print_string ((String.make ((n/2)-i-1) ' ')^"*"^(String.make ((2*i)+1) ' ')^"*\n")
done;

print_string ((String.make n '*')^"\n");
for i = 0 to ((n/2)-2) do
print_string ((String.make (n/2) ' ')^"*\n")
done;
print_string ((String.make n '*')^"\n");
for i = 0 to ((n/2)-2) do
print_string ((String.make (n/2) ' ')^"*\n")
done;
print_string ((String.make n '*')^"\n");;

gold n;;