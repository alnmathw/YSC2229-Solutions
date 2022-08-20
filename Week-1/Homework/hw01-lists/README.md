# Fun with OCaml Lists

This is a warm-up homework aiming to refresh your programming skills with the
most basic OCaml data structures, recursion, and pattern matching.

Submit your solution to this assignment by running `make dist` and uploading
`_build/hw01-lists.tar.gz` to Canvas.

You are expected to solve these tasks _individually_. Your code will be run
through the plagiarism checker to make sure that you didn't copy your solutions
(changing names of variables don't help).

## Building this Project

To build the project and run all the tests, simply execute `make
clean && make` from the command line, and you should be good to go. A
number of failing test reports will indicate missing implementation
parts that you will have to provide.

## Your Tasks

The tasks below should be implemented in the corresponding templates
files provided in the folder `lib` of the project:

1. Check out the file `FunWithLists.ml` and follow the examples and
   the explanations in the comments.

2. Check the file `Tests.ml` and make sure that all provided tests
   for your implementation pass.

## Remarks

* Do not use OCaml library functions `List.length` and `List.rev` when
  implementing your solutions. The goal of this exercise is not to test your
  knowledge of the library by rather make sure that you remember how to write
  OCaml code from scratch.

* Make sure your solutions match the expected types!

* To get more ideas on what your function should do, check the provided tests in
  `Tests.ml`.
