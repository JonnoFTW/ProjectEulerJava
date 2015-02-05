module Main where
import Data.List
import Primes
import Time

rotate xs n = drop nn xs ++ take nn xs
    where 
      nn = n `mod` length xs
	  
rotat k = [rotate (show k) n | n <- [1..(length $ show k)]]
rotor n = map read $ rotat n :: [Integer]
circlePrime n = (False `elem` (map isPrime (rotor n))) == False
primesList = [n|n<-takeWhile (<10^2) primes]
answer =  length $ nub [n|n<- nums, circlePrime n]

main = do 
	putStrLn "Start"
	time $ print answer
	putStrLn "Finished"
    
nums = filter isPrime $ [1..5]++(filter (cand) [1..10^6])
cand x = (any (`elem` (show x))  ['1','3','7','9']) && (all (`notElem` (show x)) ['0','2','4','5','6','8'])
