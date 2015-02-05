module Main where
import Time

answer' = length  [(n,d)| d<-[1..12000], n <-[(d`div`3) +1..d`div`2], gcd  d n == 1]
main = do
	putStrLn "Starting..."
	time $ print answer'
	putStrLn "Done."