module Main where

import Time
import Data.List
import Primes

factors n = map (\(x,y)->x^y) $ primePowerFactors n
consec n= concat $ map factors [n..n+3]
uniqueFs xs = xs == nub xs

answer = head [x|x<-[647..],(length $ consec x) == 16,uniqueFs $ consec x ]

main = do 
   time $ print answer