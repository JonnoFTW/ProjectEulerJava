module Main where
import Data.List
import Time
import qualified Data.MemoCombinators as Memo
a = Memo.memo2 Memo.integral Memo.integral a'
    where
        a' m n | m == 0 = n+1
               | m > 0 && n == 0 = a (m-1) 1
               | m > 0 && n > 0  = a (m-1) (a m (n-1))
answer =( foldl' (+) 0 [a 0 0,a 1 1, a 2 2, a 3 3, a 4 4, a 5 5, a 6 6 ]) `mod` (14^8)
main = time $ print answer
a2 m n = (((hyperN 2 (m-2))*(n-3)) -3)
hyperN a b = foldl1 (^) $ replicate b a 

fac = Memo.integral fac'
    where
        fac' 1 = 1
        fac' n = fac n-1
        fac' = foldl' (*) 1 . enumFromTo 1