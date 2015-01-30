module Main where
import System.TimeIt
import Data.Bits (xor)

x m n o | (xor o (xor m n) :: Int) == 0 = 0
        | otherwise = 1
x' n = x n (2*n) (3*n)
main =timeIt $ print $ length $  filter (== 0) [x' n | n<-[1..2^30]]
