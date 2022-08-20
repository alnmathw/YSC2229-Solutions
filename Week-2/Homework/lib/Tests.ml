(*

This file contains some tests for the functions from your tasks to implement.

*)

(*****************)

open InsertSortBackwards

let%test "insert_sort_backwards" =
  let a = [|5; 4; 3; 2; 1|] in
  insert_sort_backwards a;
  a = [|1; 2; 3; 4; 5|]

let%test "insert_sort_backwards1" =
  let a = [|5; 4; 3; 2; 1; 1; 1; 2|] in
  insert_sort_backwards a;
  a = [|1; 1; 1; 2; 2; 3; 4; 5|]

let%test "insert_sort_backwards2" =
  let a = [|2; 2; 2; 2; 2; 2|] in
  insert_sort_backwards a;
  a = [|2; 2; 2; 2; 2; 2|]

let%test "insert_sort_backwards3" =
  let a = [||] in
  insert_sort_backwards a;
  a = [||]

let%test "insert_sort_backwards4" =
  let a = [|2; 3; 1; 5; 6; 3; 8; 2; 6|] in
  insert_sort_backwards a;
  a = [|1; 2; 2; 3; 3; 5; 6; 6; 8|]

(****************)
(* Select Sort General *)

open SelectSortGeneral

let%test "select_sort_general-ints" =
  let a = [|5; 4; 3; 2; 1|] in
  select_sort_general a (fun x y -> x < y);
  a = [|1; 2; 3; 4; 5|]

let%test "select_sort_general-ints1" =
  let a = [|5; 4; 6; 2; 6; 2; 1; 7|] in
  select_sort_general a (fun x y -> x < y);
  a = [|1; 2; 2; 4; 5; 6; 6; 7|]

let%test "select_sort_general-list_length" =
  let a = [|[2; 2]; [1]; [5; 5; 5; 5; 5]; [8; 8; 8; 8; 8; 8; 8; 8]; [3; 3; 3]|] in
  select_sort_general a (fun x y -> List.length x < List.length y);
  a = [|[1]; [2; 2]; [3; 3; 3]; [5; 5; 5; 5; 5]; [8; 8; 8; 8; 8; 8; 8; 8]|]

let%test "select_sort_general-arr_length" =
  let a = [|[|2; 2|]; [|1|]; [|5; 5; 5; 5; 5|]; [|4; 4; 4; 4|]; [|3; 3; 3|]; [||]|] in
  select_sort_general a (fun x y -> Array.length x < Array.length y);
  a = [|[||]; [|1|]; [|2; 2|]; [|3; 3; 3|]; [|4; 4; 4; 4|]; [|5; 5; 5; 5; 5|]|]

(*******************)

open BubbleSort

let%test "bubble_sort" =
  let a = [|5; 4; 3; 2; 1|] in
  bubble_sort a;
  a = [|1; 2; 3; 4; 5|]

(* TODO: provide more tests *)
let%test "bubble_sort1" =
  let a = [|2; 2; 2; 2; 2; 2|] in
  bubble_sort a;
  a = [|2; 2; 2; 2; 2; 2|]

let%test "bubble_sort2" =
  let a = [||] in
  bubble_sort a;
  a = [||]

let%test "bubble_sort3" =
  let a = [|2; 3; 1; 5; 6; 3; 8; 2; 6|] in
  bubble_sort a;
  a = [|1; 2; 2; 3; 3; 5; 6; 6; 8|]
