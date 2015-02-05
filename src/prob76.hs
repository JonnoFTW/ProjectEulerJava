module Main where
import Time
import Data.List

fac n = foldl' (*) 1 $ enumFromTo 1 n
combin n k = (fac n) / ((fac k)*(fac (n-k)))

answer = sum [combin 100 k|k<-[1..100]]