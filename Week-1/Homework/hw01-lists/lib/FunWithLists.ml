(*********************************************************************)
(*                  Fun with OCaml Lists                             *)
(*********************************************************************)

(*

This project is aimed to get you up to speed with basic OCaml programming,
refreshing the concepts from the Intro to Computer Science class.

The descriptions of the tasks are given in the comments, along with the types of
the functions. Once you implement your solutions, make sure you get the same
type. Implement your solutions by replacing the code `failwith "TODO"` with your
implementation.

!!! Please, don't modify the provided function names and signatures (i.e., the
number of arguments) !!!

Don't forget to check the file Tests.ml.

*)

(*********************************************************************)
(*                            Examples                               *)
(*********************************************************************)

(* Example 1: The following simple funciton removes the first n elements of the
   list. *)

(*  remove_first: 'a list -> int -> 'a list  *)
let rec remove_first (ls : 'a list) (n : int) : 'a list =
  if n <= 0 then ls 
  else 
    match ls with
    | [] -> []
    | _ :: t -> remove_first t (n-1)
  ;;

(* Example 2: Checking that the list x is a prefix of the list ls *)

(*  is_prefix: 'a list -> 'a list -> bool  *)
let rec is_prefix (xs : 'a list) (ls : 'a list) : bool =
  match (xs, ls) with 
  | ([], _) -> true 
  | (h1 :: t1, h2 :: t2) -> 
    h1 = h2 && is_prefix t1 t2 
  | _ -> false 
;;

(*********************************************************************)
(*                             Tasks                                 *)
(*********************************************************************)

(* Task 1: Find penultimate and last elements of the list (if they exist) *)

(*  last_two_elems : 'a list -> ('a * 'a) option  *)
let rec last_two_elems (ls : 'a list) : ('a * 'a) option = 
  match ls with
  | [] | [_] -> None 
  | [e1; e2] -> Some (e1, e2)
  | _ :: xs -> last_two_elems  xs 
;; 

(* Because the function expects an option type, I (to my knowledge) cannot use 
   tail-recursion to solve this problem *)

(* Task 2: Package consecutive duplicates of list elements into sublists. *)

(* Hint: you might want to define an auxiliary function for this *)

(*  package : 'a list -> 'a list list  *)
let package (list : 'a list) : 'a list list =
  let rec helper curr acc = function
      | [] -> []
      | [x] -> (x :: curr) :: acc
      | a :: (b :: _ as xs) ->
         if a = b then helper (a :: curr) acc xs
         else helper [] ((a :: curr) :: acc) xs
    in
    List.rev (helper [] [] list)
;;

(* Task 3: Flatten a list of nester lists. *)

(* Let us define a new data types. A node of a nested list is either a single
   element (wrapped in a constructor `One`), or a list of nodes (`Many` nodes). *)

type 'a node =
  | One of 'a
  | Many of 'a node list

(*  flatten_nodes : 'a node list -> 'a list  *)
let flatten_nodes (list : 'a node list) : 'a list = 
  let rec helper acc = function
      | [] -> acc
      | One x :: t -> helper (x :: acc) t
      | Many l :: t -> helper (helper acc l) t
    in
    List.rev (helper [] list)
;;

(* Task 4: Remove consecutive duplicates  *)

(*  undup : 'a list -> 'a list  *)
let rec undup (ls : 'a list) : 'a list = 
  match ls with
  | a:: ( b :: _ as l ) -> if a = b then undup l else a :: undup l 
  | _ -> ls
;;

(* Task 5 : RLE of a list *)

(* Read the article on Run-Length Encoding:

https://en.wikipedia.org/wiki/Run-length_encoding

and implement it for lists of repetitive elements.

As an additional challenge, try to implement it using some of the functions
defined above using OCaml functions List.map and List.length.

*)

(*  rle_encode : 'a list -> (int * 'a) list  *)
let rle_encode (list : 'a list) : (int * 'a) list = 
  List.map (fun l -> (List.length l, List.hd l)) (package list)
;;