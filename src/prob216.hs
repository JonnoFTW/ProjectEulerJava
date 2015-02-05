module Main where
import Time
import Primes

t n = 2*n*n -1
answer = length $ filter isPrime $ map t [2..1000000]
main = time $ print answer