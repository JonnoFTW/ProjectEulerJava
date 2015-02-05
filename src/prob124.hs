module Main where
import Time
import Primes
import Data.List
rad n = product $ map fst $ primePowerFactors n
answer = (sort $ map (\(x,y) -> (product $ map fst $ primePowerFactors x, y)) $ zip [1..] [1..100000]) !! 9999

main = time $ print  answer