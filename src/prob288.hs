module Main where
import Data.List
import Primes
import qualified Data.MemoCombinators as Memo

sum' x = foldl' (+) 0 x
fac n = foldl' (*) 1 $ enumFromTo 1 n

nN p q = sum' [(t n) * (p^n)|n<-[0..q]]       
    where
        t n =  (s n) `mod` p

s = Memo.integral s'
    where
    s' n = (iterate (\ x -> x^2 `mod` 50515093) 290797) !! n
        
nfac p q = fac $ nN p q
nF p q = length $ factors $ nfac p q

factors =  filter isPrime . init . map product . sequence . map (\(x,y) -> map (x^) [0..y]) . primePowerFactors