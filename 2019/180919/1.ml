let x = [|"1";"111"|];;
open Array;;

let exists l a =
let b = ref false in
for i =  0 to ((length l)-1) do
if l.(i) = a then b:=true
done;
!b;; 

let isPrefix l=
let res = ref true in
for i = 0 to ((length l)-1) do
for j = (i+1) to ((length l)-i-1) do
if exists l (l.(i)^l.(j)) then res:= false
done;
done;
!res;;
print_string(
if isPrefix x = true then "Yes" else "No");;
