module Main where
import Time
import Data.List

penta k = map round [(n*(3*n-1)/2)|n<- [1..k]]
answer =[ d | j<-[1..],
	k<-[1..j],
	pk <- (penta k :: [Integer]),
	pj <- (penta j :: [Integer]),
	(pj - pk) `elem` penta j,
	(pk + pj) `elem` penta (2*j),
	d  <- abs (pk - pj)]
main = do
	putStrLn "Start: "
	time $ print answer
	putStrLn "Finish"