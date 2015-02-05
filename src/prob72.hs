module Main where
import Time
import Data.Ratio
import Data.Numbers.Primes
import Data.List
answer =(1,1):[(n,d)|d<-[1..8],n<-ns d, gcd n d == 1]
	where
	ns d | d `elem` [1..5] = [1..(d-1)]
		 | d `rem` 5 == 0 = [1..(d-1)]
		 | even d    = takeWhile (< d) primes
		 | otherwise = [1..(d-1)]
         
         
answer' = length $ nub  [(n%d)| d<-[1..1000000], n <-[1..d-1], gcd  d n == 1]

		 
main = do
	putStrLn "Starting..."
	time $ print answer'
	putStrLn "Done."