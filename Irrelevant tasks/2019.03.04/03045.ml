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
for i = 0 to ((n/2)-3-(n/4)) do
print_string ((String.make (n/2) ' ')^"*\n")
done;
 for i = 0 to ((n/4)-1) do
print_string ((String.make ((n/4)+i-2)  ' ')^"*"^(String.make  ((n/2)-(n/4)-i+1) ' ')^"*"^(String.make  ((n/2)-(n/4)-i+1) ' ')^"*\n")
done;
print_string ((String.make (n/2) ' ')^"*\n");
print_string ((String.make n '*')^"\n");;

gold n;;