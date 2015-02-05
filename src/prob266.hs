module Main where
import Time
import Data.List
import Primes

rSq :: Integer -> Integer
rSq n = toInteger $ round $ sqrt (fromInteger n)

psr3 :: Integer -> Integer
psr3 n = head [k|k<-[(rSq n),((rSq n)-1)..1], (n `rem` k) == 0]
psr n = last $ takeWhile (< rSq n) $  sort $ factors n

--factors n =[c|y<-[0..(snd $ last $ primePowerFactors n)],x <- [0..(fst $ last $ primePowerFactors n)],a<-map fst (primePowerFactors n),b<-map snd(primePowerFactors n),c<-(a^x)*(b^y) ]
factors = map product . sequence . map (\(x,y) -> map (x^) [0..y]) . primePowerFactors
factors2 =sequence . map (\(x,y) -> map (x^) [0..y]) . primePowerFactors

p = foldl' (*) 1 $ takeWhile (< 190) primes
psr2 n = (sort $ factors n) !! ((2^((length $ primePowerFactors n)-1))-1)
answer = (psr2 p) `mod` (10^16)


main = do 
	putStrLn "Start: "
	time $ print answer
	putStrLn "Finished"