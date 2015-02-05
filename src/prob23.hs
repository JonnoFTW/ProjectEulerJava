module Main where
import Time
import Data.List
import Primes

divisors =  init . map product . sequence . map (\(x,y) -> map (x^) [0..y]) . primePowerFactors
sum' xs = foldl' (+) 0 xs

perfect   n = (sum' $ divisors n) == n
abundant  n = (sum' $ divisors n) > n
deficient n = (sum' $ divisors n) < n

abundance = filter abundant ns
ns =[n|n<-[12..20161],even n || (n `rem` 5 == 0)]

main = do
	putStrLn "Start: "
	time $ print answer
	putStrLn "Finish"
   
answer :: Integer
answer = sum' [x | x <- [1..46]++[47,49..20161], null . filter (`elem` abundantNums) . map ((-) x) $ takeWhile (<x)abundantNums]
		   where abundantNums = abundance
allSums [] = []
allSums (x:xs) = map (+x) xs : allSums xs

answer2 = sum' $ (abundance) `intersect` (nub $ filter (<20161) $ concat $ allSums abundance)
    