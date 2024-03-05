(* Values

What is the type and value of each of the following OCaml expressions?

7 * (1 + 2 + 3)
> Type: int
> Value: 42

"CS " ^ string_of_int 3110
> Type: string
> Value: "CS 3110"

----- *)

(* Operators

Write an expression that multiplies 42 by 10.
> 42 * 10

Write an expression that divides 3.14 by 2.0. Hint: integer and floating-point 
operators are written differently in OCaml.
> 3.14 /. 2.0

Write an expression that computes 4.2 raised to the seventh power. 
Note: there is no built-in integer exponentiation operator in OCaml 
(nor is there in C, by the way), in part because it is not an operation provided by 
most CPUs.
> let rec pow x y = if y = 0.0 then 1.0 else x *. pow x (y -. 1.0)
> pow 4.2 7.0

----- *)

(* Equality

Write an expression that compares 42 to 42 using structural equality.
> 42 = 42

Write an expression that compares "hi" to "hi" using structural equality. 
What is the result?
> "hi" = "hi"
> - : bool = true

Write an expression that compares "hi" to "hi" using physical equality. 
What is the result?
> "hi" == "hi"
> - : bool = false

----- *)


(* Assert 

Enter assert true;; into utop and see what happens.
> - : unit = ()

Enter assert false;; into utop and see what happens.
> Exception: Assert_failure ("//toplevel//", 1, 0) 

Write an expression that asserts 2110 is not (structurally) equal to 3110.
> assert (2110 <> 3110)

----- *)

(* Exercise: if [★]

Write an if expression that evaluates to 42 if 2 is greater than 1 and otherwise 
evaluates to 7.
> if 2 > 1 then 42 else 7

----- *)

(* Exercise: double fun [★]

Using the increment function from above as a guide, define a function double that 
multiplies its input by 2. For example, double 7 would be 14. Test your function by 
applying it to a few inputs. Turn those test cases into assertions. 
> let double x = 2 * x
> assert (double 7 = 14)
> assert (double 0 = 0)
> assert (double (-1) = (-2))

----- *)

(* Exercise: date fun [★★★]

Define a function that takes an integer d and string m as input and returns true just 
when d and m form a valid date. Here, a valid date has a month that is one of the 
following abbreviations: Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sept, Oct, Nov, Dec. 
And the day must be a number that is between 1 and the minimum number of days in that 
month, inclusive. For example, if the month is Jan, then the day is between 1 and 31, 
inclusive, whereas if the month is Feb, then the day is between 1 and 28, inclusive.

How terse (i.e., few and short lines of code) can you make your function? 
You can definitely do this in fewer than 12 lines. 

----- *)
