module Main where
import Data.List
import Time

r k = read $ concatMap show $ replicate k 1 :: Integer
ns = [n|n<-[1..],(gcd n 10) == 1]
a n = [k|k<-[1..10],n<-ns, (r k `rem` n) == 0]
{-
answer = head $ dropWhile (< 10^6) [a n|n<-[1..]]

main = do 
	putStrLn "Start: "
	time $ print answer
	putStrLn "Finished"
	-}