module Main where
import Time
import Data.List

fib n = round $ phi ** fromIntegral n / sq5
  where
    sq5 = sqrt 5 :: Double
    phi = (1 + sq5) / 2 :: Double


f x = foldl' (+) 0 $ [x^b * fib b|b<-[1..200]]