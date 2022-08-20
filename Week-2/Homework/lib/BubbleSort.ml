open Util

let bubble_sort (arr : int array) : unit =
  let len = Array.length arr in
  for i = len - 1 downto 0 do
    for j = 0 to i - 1 do
      if arr.(j) > arr.(j + 1)
        then swap arr j (j + 1)
    done 
  done 
    