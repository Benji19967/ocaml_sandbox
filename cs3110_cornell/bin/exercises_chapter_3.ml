(* Exercise: list expressions [★]

Construct a list that has the integers 1 through 5 in it. Use the square bracket 
notation for lists.
> let lst = [1; 2; 3; 4; 5]

Construct the same list, but do not use the square bracket notation. 
Instead, use :: and [].
> let lst = 1 :: 2 :: 3 :: 4 :: 5 :: []

Construct the same list again. This time, the following expression must appear in your 
answer: [2; 3; 4]. Use the @ operator, and do not use ::. 
> [1] @ [2; 3; 4] @ [5]

----- *)

(* Exercise: product [★★]

Write a function product that returns the product of all the elements in a list. 
The product of all the elements of an empty list is 1. 
> let rec product lst = 
match lst with 
| [] -> 1
| h :: t -> h * product t

----- *)

(* Exercise: concat [★★]

Write a function that concatenates all the strings in a list. 
The concatenation of all the strings in an empty list is the empty string "". 
> let rec concat lst =
match lst with 
| [] -> ""
| h :: t -> h ^ concat t

----- *)

(* Exercise: patterns [★★★]

Using pattern matching, write three functions, one for each of the following properties. 
Your functions should return true if the input list has the property and false otherwise.

the list’s first element is "bigred"
> let f lst =
match lst with
| [] -> false
| h :: t -> if h = "bigred" then true else false;;

the list has exactly two or four elements; do not use the length function
> let f lst = 
match lst with
| _ :: _ :: [] -> true
| _ :: _ :: _ :: _ :: [] -> true
| _ -> false

the first two elements of the list are equal 
> let f lst =
match lst with 
| e1 :: e2 :: t -> if e1 = e2 then true else false
| _ -> false

----- *)

(* Exercise: library [★★★]

Consult the List standard library to solve these exercises:

Write a function that takes an int list and returns the fifth element of that list, 
if such an element exists. If the list has fewer than five elements, return 0. 
Hint: List.length and List.nth.
> let f lst = if List.length lst < 5 then 0 else List.nth lst (5-1) 
** List.nth is zero-indexed

Write a function that takes an int list and returns the list sorted in descending order. 
Hint: List.sort with Stdlib.compare as its first argument, and List.rev. 
> let f lst = List.rev (List.sort Stdlib.compare lst)

----- *)

(* Exercise: library puzzle [★★★]

Write a function that returns the last element of a list. 
Your function may assume that the list is non-empty. Hint: Use two library functions,
and do not write any pattern matching code of your own.
> let f lst = List.nth lst ((List.length lst) - 1)

Write a function any_zeroes : int list -> bool that returns true if and only if 
the input list contains at least one 0. Hint: use one library function,
and do not write any pattern matching code of your own.
> let f lst = List.mem 0 lst

Your solutions will be only one or two lines of code each. 

----- *)

(* Exercise: take drop [★★★]

Write a function take : int -> 'a list -> 'a list such that take n lst returns the 
first n elements of lst. If lst has fewer than n elements, return all of them.
> let rec take n lst = 
match n with 
| 0 -> []
| _ -> match lst with
    | [] -> []
    | h :: t -> h :: take (n-1) t

Write a function drop : int -> 'a list -> 'a list such that drop n lst returns 
all but the first n elements of lst. If lst has fewer than n elements, return the 
empty list. 
> let rec drop n lst = 
match n with 
| 0 -> lst
| _ -> match lst with 
    | [] -> []
    | h :: t -> drop (n-1) t

----- *)

(* Exercise: take drop tail [★★★★]

Revise your solutions for take and drop to be tail recursive, if they aren’t already. 
Test them on long lists with large values of n to see whether they run out of stack 
space. To construct long lists, use the -- operator from the lists section. 

--- TAKE ---
> `take 99_000_000 (0 -- 100_000_000)` produces a Stack overflow for the above 
solution of take. Let's try to make it tail-recursive.

> let rec take_helper n lst acc = 
match n with 
| 0 -> acc 
| _ -> match lst with
    | [] -> acc
    | h :: t -> take_helper (n-1) t (h :: acc)

> let take_tr = List.rev (take_helper n lst [])
or
> let take_tr = take_helper n lst [] |> List.rev

--- DROP ---

> I think the above `drop` solution is already tail-recursive. No work 
is done in the match arm after calls to `drop` return.

----- *)

(* Exercise: unimodal [★★★]

Write a function is_unimodal : int list -> bool that takes an integer list and 
returns whether that list is unimodal. A unimodal list is a list that monotonically 
increases to some maximum value then monotonically decreases after that value. 
Either or both segments (increasing or decreasing) may be empty. A constant list is 
unimodal, as is the empty list. 
> let rec is_nonincreasing lst =
match lst with 
| [] -> true
| _ :: [] -> true
| x1 :: x2 :: t -> if x1 < x2 then false else is_nonincreasing (x2 :: t);;
> let rec unimodal lst = 
match lst with 
| [] -> true
| _ :: [] -> true
| x1 :: x2 :: t -> if x2 < x1 then is_nonincreasing (x2 :: t) else unimodal (x2 :: t);;

----- *)
