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

(* Exercise: more fun [★★]

Define a function that computes the cube of a floating-point number. 
Test your function by applying it to a few inputs.
> let cube x = x *. x *. x
> cube 3.
> - : float = 27.

Define a function that computes the sign (1, 0, or -1) of an integer. 
Use a nested if expression. Test your function by applying it to a few inputs.
> let sign x = if x > 0 then 1
else if x = 0 then 0
else -1
> sign 3
> - : int = 1 
> sign 0
> - : int = 0 
> sign (-10)
> - : int = -1 

Define a function that computes the area of a circle given its radius. 
Test your function with assert.
> let area r = Float.pi *. r *. r
> assert (area 1. = Float.pi)

For the latter, bear in mind that floating-point arithmetic is not exact. 
Instead of asserting an exact value, you should assert that the result is
“close enough”, e.g., within 1e-5. If that’s unfamiliar to you, it would be worthwhile 
to read up on floating-point arithmetic.

----- *)

(* Exercise: RMS [★★]

Define a function that computes the root mean square of two numbers—i.e. 
sqrt((x^2 + y^2) / 2). Test your function with assert. 
> let rms x y = Float.sqrt (((x *. x) +. (y *. y)) /. 2.)
> assert (Float.abs (rms 3. 4. -. 3.5355) < 0.0001)

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
> 

----- *)

(* Exercise: fib [★★]

Define a recursive function fib : int -> int, such that fib n is the nth number in the 
Fibonacci sequence, which is 1, 1, 2, 3, 5, 8, 13, … That is:
fib 1 = 1,
fib 2 = 1, and
fib n = fib (n-1) + fib (n-2) for any n > 2.

Test your function in the toplevel. 
> let rec fib n = if n <= 1 then n else fib (n-1) + fib (n-2);;

----- *)

(* Exercise: fib fast [★★★]

How quickly does your implementation of fib compute the 50th Fibonacci number? 
If it computes nearly instantaneously, congratulations! But the recursive solution most 
people come up with at first will seem to hang indefinitely. 
The problem is that the obvious solution computes subproblems repeatedly. 
For example, computing fib 5 requires computing both fib 3 and fib 4, and if those are 
computed separately, a lot of work (an exponential amount, in fact) is being redone.

Create a function fib_fast that requires only a linear amount of work. 
Hint: write a recursive helper function h : int -> int -> int -> int, 
where h n pp p is defined as follows:

h 1 pp p = p, and
h n pp p = h (n-1) p (pp+p) for any n > 1.

The idea of h is that it assumes the previous two Fibonacci numbers were pp and p, 
then computes forward n more numbers. Hence, fib n = h n 0 1 for any n > 0.

What is the first value of n for which fib_fast n is negative, indicating that integer 
overflow occurred? 
> let rec h n pp p = if n = 1 then p else h (n-1) p (pp + p)
> let fib_fast n = h n 0 1

> Very cool solution. n is a counter down, but the fibonacci numbers are 
computed bottom up. 
----- *)
