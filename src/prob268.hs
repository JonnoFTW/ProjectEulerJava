module Main where
import Time
import Data.List
import Primes

n = primesTo100
factors = take 4 . filter (`elem` primesTo100) . map product . sequence . map (\(x,y) -> map (x^) [0..y]) . primePowerFactors

answer = length [n|n<-[1..(1000)], (length $ factors n) = 4]
main = time $ print answer