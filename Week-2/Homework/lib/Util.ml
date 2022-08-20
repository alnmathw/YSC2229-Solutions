(*********************************************)
(*     Useful functions and data types       *)
(*********************************************)

(*********************************************)
(*        Useful functions on arrays         *)
(*********************************************)

(* Swapping two elements in an array *)

let swap arr i j =
  let tmp = arr.(i) in
  arr.(i) <- arr.(j);
  arr.(j) <- tmp

(* Printing a sub-array of elements *)

let print_int_sub_array l u arr =
  assert (l <= u);
  assert (u <= Array.length arr);
  Printf.printf "[| ";
  for i = l to u - 1 do
    Printf.printf "%d" arr.(i);
    if i < u - 1 then Printf.printf "; " else ()
  done;
  Printf.printf " |] "

(* Print the entire array *)

let print_int_array arr =
  let len = Array.length arr in
  print_int_sub_array 0 len arr

(* Some examples in a nested module *)
module ArrayExamples = struct
  let a1 = [|6; 8; 5; 2; 3; 7; 0|]

  (* An array of 10 zeroes *)
  let a2 = Array.make 10 0

  let a3 = [|5; 6; 1; 3; 3; 2; 2; 2; 15; 12|]
end

(*******************************************************)
(* Auxiliary functions for checking if array is sorted *)
(*******************************************************)

let rec sorted ls =
  match ls with
  | [] -> true
  | h :: t -> List.for_all (fun e -> e >= h) t && sorted t

(* Convert an array to list *)
(* The following three are an exercises *)

let subarray_to_list l u arr =
  assert (l <= u);
  let res = ref [] in
  let i = ref (u - 1) in
  while l <= !i do
    res := arr.(!i) :: !res;
    i := !i - 1
  done;
  !res

(* Converting the entire array to list *)

let array_to_list arr = subarray_to_list 0 (Array.length arr) arr

(* Check if a sub-array [l...u) is sorted *)

let sub_array_sorted l u arr =
  let ls = subarray_to_list l u arr in
  sorted ls

(* Sorting the entire array *)

let array_sorted arr = sub_array_sorted 0 (Array.length arr) arr

(* Ensuring that two lists have same elements *)
let same_elems ls1 ls2 =
  List.for_all
    (fun e -> List.find_all (fun e' -> e = e') ls2 = List.find_all (fun e' -> e = e') ls1)
    ls1
  && List.for_all
       (fun e ->
         List.find_all (fun e' -> e = e') ls2 = List.find_all (fun e' -> e = e') ls1)
       ls2
