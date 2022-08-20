# Sorting Arrays

This homework assignment continues the exploration into different
algorithms for sorting arrays in place in OCaml.

Submit your solution to this assignment by running `make dist` and uploading
`_build/hw02-arrays.tar.gz` to Canvas.

You are expected to solve these tasks _individually_. Your code will be run
through the plagiarism checker to make sure that you didn't copy your solutions
(changing names of variables don't help).

## Building this Project

To build the project and run all the tests, simply execute `make
clean && make` from the command line, and you should be good to go. A
number of failing test reports will indicate missing implementation
parts that you will have to provide.

## Your Tasks

The tasks below should be implemented in the corresponding templates files
provided in the folder `lib` of the project:

1. Implement, in the file `InsertSortBackwards.ml`, a version of
   insertion sort for arrays called `insert_sort_backwards`, so that
   its outer loop would be starting not from the beginning (i.e.,
   index 0), but from the end of an array (i.e., `(Array.length arr) -
   1`). In addition to that,

   * Provide a tracing version of this algorithm similarly to what's
     been done for `insert_sort` in the class.

   * Encode and check the invariants (see the lecture notes on what invariants
     are) for this version and explain, in comments for your code, how the inner
     loop invariant, upon the loop's termination, implies the outer loop's
     invariant.

2. In the file `SelectSortGeneral.ml` generalize the selection sort to
   take an array of arbitrary type `'a array` and comparator
   `less_than` of type `'a -> 'a -> bool`, and return an array sorted
   in ascending order according to this comparator.

3. Bubble Sort is a popular, but inefficient, sorting algorithm,
   similar to selection sort. Instead of selecting a new minimum, it
   works by repeatedly swapping adjacent elements in the suffix that
   are out of order. In *pseudocode* it is implemented as follows:

   ```
   BubbleSort (A):
    for i = 0 to A.length - 1
      for j = A.length - 1 downto i + 1
        if A[j] < A[j - 1]
          swap A[j] and A[j - 1]
   ```

   * Implement the algorithm in OCaml using ``for-to`` and
     ``for-downto`` constructs in `BubbleSort.ml`.

   * (Optional) Implement a tracing version for it.

## Remarks

* Please, do not change names and signatures of the sorting functions you
  implement (we need this for testing purposes).
