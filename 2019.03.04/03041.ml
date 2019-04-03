let n = read_int();; 

let bar n =
for i = 0 to (n-1) do
print_string " "
done;;

let foo n =
for i = 0 to (n-1) do
bar i;
print_string "*\n"
done;
for i = (n-2) downto 0 do
bar i;
print_string "*\n"
done;;
foo n;;