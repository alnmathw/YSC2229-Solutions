(*

This file contains some tests for the functions from your tasks to implement.

*)

open FunWithLists

(* This is how we can test it *)

let%test "remove 0" = remove_first [1; 2; 3] 0 = [1; 2; 3]

let%test "remove 1" = remove_first [1; 2; 3] 1 = [2; 3]

(*
The following test will fail if uncommented (try it!)
*)

(*
let%test "remove 2" =
  remove_first [1; 2; 3] 2 = [2; 3]
*)

let%test "is_prefix empty" = is_prefix [] [1; 2; 3]

let%test "is_prefix 1" = is_prefix [1; 2] [1; 2; 3]

(* Don't forget to test negative properties! *)
let%test "is_prefix is false" = not @@ is_prefix [1; 3] [1; 2; 3]

(* Using @@ is a shortcut to avoid parentheses *)
(* `foo @@ bar x` is the same as `foo (bar x)` *)

(* Task 1: Find penultimate and last elements of the list (if they exist) *)

let%test "last_two_elems 1" = last_two_elems ["a"; "b"; "c"; "d"] = Some ("c", "d")

let%test "last_two_elems 2" = last_two_elems ["a"; "b"] = Some ("a", "b")

let%test "last_two_elems 3" = last_two_elems ["a"] = None

let%test "last_two_elems 4" = last_two_elems [] = None

(* Task 2: Package consecutive duplicates of list elements into sublists. *)

let%test "package test 1" =
  package ["a"; "a"; "a"; "a"; "b"; "c"; "c"; "a"; "a"; "d"; "d"; "e"; "e"; "e"; "e"]
  = [["a"; "a"; "a"; "a"]; ["b"]; ["c"; "c"]; ["a"; "a"]; ["d"; "d"]; ["e"; "e"; "e"; "e"]]
;;

let%test "package test 2" = package ["a"] = [["a"]]

let%test "package test 3" = package [] = []

(* Task 3: Flatten a list of nested lists. *)

let%test "flatten_nodes 1" =
  flatten_nodes [One "a"; Many [One "b"; Many [One "c"; One "d"]; One "e"]]
  = ["a"; "b"; "c"; "d"; "e"]
;;

let%test "flatten_nodes 2" = flatten_nodes [One "a"] = ["a"]

let%test "flatten_nodes 2" = flatten_nodes [Many [One "a"]] = ["a"]

let%test "flatten_nodes 3" = flatten_nodes [] = []

(* Task 4: Remove consecutive duplicates  *)

let%test "undup 1" =
  undup ["a"; "a"; "a"; "a"; "b"; "c"; "c"; "a"; "a"; "d"; "e"; "e"; "e"; "e"]
  = ["a"; "b"; "c"; "a"; "d"; "e"]
;;

let%test "undup 2" = undup ["a"] = ["a"]

let%test "undup 3" = undup [] = []

(* Task 5: RLE of a list *)

let%test "rle_encode 1" =
  rle_encode ["a"; "a"; "a"; "a"; "b"; "c"; "c"; "a"; "a"; "d"; "e"; "e"; "e"; "e"]
  = [(4, "a"); (1, "b"); (2, "c"); (2, "a"); (1, "d"); (4, "e")]
;;

let%test "rle_encode 2" = rle_encode ["a"] = [(1, "a")]
