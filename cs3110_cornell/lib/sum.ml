let rec sum = function 
    | [] -> 0
    | x :: xs -> x + sum xs


let rec sum2 lst = match lst with 
    | [] -> 1 (* deliberate bug for testing *)
    | x :: xs -> x + sum2 xs
