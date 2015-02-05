module Main where
import Time
import Data.List
import Data.Bits

panD x = ( (length $ nub $ take 9 $ show x) == 9) && ( (length $ nub $ take 9 $ reverse $ show x) == 9)


pan2 x | (length $ show x) < 18 = False
       | otherwise = ((sort $ take 9 $ reverse xs) == ns) && ((sort $ take 9 xs) == ns)
    where ns = concatMap show [1..9]
          xs = show x

fib n = round $ phi ** fromIntegral n / sq5
  where
    sq5 = sqrt 5 :: Double
    phi = (1 + sq5) / 2 :: Double


answer = head [k|k<-[1..], pan2 $ fib k]
main = time $ print answer