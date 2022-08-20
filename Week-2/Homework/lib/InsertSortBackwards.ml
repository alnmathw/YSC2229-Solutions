open Util

let insert_sort_backwards (arr : int array) : unit = 
  let len = Array.length arr in 
  for i = (len - 1) downto 0 do 
    let j = ref i in 
    while (!j < (len - 1) && arr.(!j + 1) < arr.(!j)) do 
      swap arr (!j + 1) (!j);
      j := !j + 1
    done 
  done
