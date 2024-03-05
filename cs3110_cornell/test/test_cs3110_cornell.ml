open OUnit2
open Cs3110_cornell.Sum

let tests = "test suite for sum" >::: [
  "empty"           >:: (fun _ -> assert_equal 0 (sum []));
  "singleton"       >:: (fun _ -> assert_equal 1 (sum [1]));
  "two_elements"    >:: (fun _ -> assert_equal 3 (sum [1; 2]));
]

let tests_sum2 = "test suite for sum2" >::: [
(* ~printer gives better output. Output is expected to be an int, so we need to 
   convert it to a string 
*)
  "empty"           >:: (fun _ -> assert_equal 0 (sum2 []) ~printer:string_of_int); 
  "singleton"       >:: (fun _ -> assert_equal 1 (sum2 [1]) ~printer:string_of_int);
  "two_elements"    >:: (fun _ -> assert_equal 3 (sum2 [1; 2]) ~printer:string_of_int);
]

let _ = run_test_tt_main tests
let _ = run_test_tt_main tests_sum2
