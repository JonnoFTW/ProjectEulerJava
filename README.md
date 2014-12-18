Project Euler
=============
Some of my project euler solutions that I wrote in Java. To speed things up,
I frequently make use of every core on my machine. Not every solution I have
here correctly solves the problems, just the ones described below.

[Prob96](https://projecteuler.net/problem=96)
=============================================
The sudoku solver uses simulated annealing with a preliminary check
that attempts to solve (and fill in as many cells as it can) by deduction.

This step should help the randomised step.

[Prob46](https://projecteuler.net/problem=46)
=============================================
Uses simple brute force with O(n<sup>2</sup>) to check.

[Prob62](https://projecteuler.net/problem=62)
=============================================
Generates cubes and stores it's already seen permutations in a `HashMap`. Once any sorted cube has 5 permutations,
stop.

[Prob206](https://projecteuler.net/problem=206)
===============================================
Generates squares until it matches the given regex.

[Prob145](https://projecteuler.net/problem=145)
===============================================
Brute forces.

[Prob50](https://projecteuler.net/problem=50)
=============================================
Uses a sliding window to gradually increase the length of the sum until the maximum
is reached. Generates all primes below one-million and sorts them.