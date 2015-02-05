module Main where
import Data.Char
import Time

sumOfDig  = sum . (map (read . return) . show)
f x= (sumOfDig $ 137*x) == (sumOfDig x)
answer = length $ filter f [1..100000]

main = time $ print $ show answer