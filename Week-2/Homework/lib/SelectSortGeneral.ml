open Util

let less_than_operator a b = if a < b then true else false 

let select_sort_general (arr : 'a array) (less_than : 'a -> 'a -> bool) : unit =
  let len = Array.length arr in
  for i = 0 to len - 1 do 
    for j = i + 1 to len - 1 do 
      if less_than arr.(j) arr.(i)
      then swap arr i  j 
      else ()
    done 
  done

let select_sort_general_partial arr = select_sort_general arr less_than_operator
