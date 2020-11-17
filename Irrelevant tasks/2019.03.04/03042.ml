let n = read_int();;

let rec square n i =
if i = 0 then                                    (
print_string ((String.make n '*')^"\n"); square n (i+1)) else if i = (n-1) then (print_string (String.make n '*');square n (i+1))  else if i < n then (
print_string ("*"^(String.make (n-2) ' ')^"*\n"); square n (i+1));;
square n 0;;