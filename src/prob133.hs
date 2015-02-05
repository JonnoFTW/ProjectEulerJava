module Main where
import Time
import Data.List
import Primes

p = primesTo100
x n = r (10^n)
r k = read $concatMap show $ replicate k 1 :: Integer
units = map x [1..10]

takeWhile' _ [] = []
takeWhile' p (x:xs) | p x = x : takeWhile' p xs
                    | otherwise = [x]

pDiv p = head $ dropWhile (/= 0) $ map (`rem` p) units

--answer = [a|a<-p,let b = pDiv a, length b > 0]

--main = time $ print answer