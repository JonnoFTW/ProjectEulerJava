module Main where
import Time
import Data.List
import Primes

primesList =[p|p<-[11,13..], isPrime p]
truncPrime n = (False `elem` (map isPrime ((trunc n)++(trunc2 n)))) == False
trunc k = map read $ map reverse [ (drop n $ reverse $ show k)  | n <- [1..((length $ show k) -1)]] :: [Integer]
trunc2 k = map read $ [ (drop n $ show k)  | n <- [0..((length $ show k) -1)]] :: [Integer]
answer =  sum $ take 11 [n| n<- primesList, truncPrime n]

main = do 
	putStrLn "Start"
	time $ print answer
	putStrLn "Finished"