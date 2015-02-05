module Main where
import Time
import Data.List

r a n | odd n = 2*n*a
	  | even n = 2
r2 a n =( ((a-1)^n) + (a+1)^n ) `rem` (a*a)
rMax a = maximum [r a n|n<-[1..2*a]]

rMax2 a | odd a = a*(a-1)
		| otherwise =  a*(a-2)
answer = sum $ map rMax2 [3..1000]
main = do 
	putStrLn "Start: "
	time $ print answer
	putStrLn "Finished"