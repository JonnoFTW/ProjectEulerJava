module Main where

import Primes
import Time

rad  = product . map fst . primePowerFactors 

abcHit ( a , b , c ) = (all (==1) [gcd a b ,gcd a c , gcd b c]) && ((rad ( a * b * c )) < c )

--hits =sum  [ (c) | b <- [1 .. 1000], a <- [1 .. b - 1] , c <- [a+b] , abcHit (a,b,c),a<b,c<1000]

hits = sum[c|b<-[2..12000],a<-[1..6* b`div`8],c<-[a+b],abcHit(a,b,c),c<12000,a<b]

hits2 = sum [ (c) | b <- [1 .. x], a <- as b, c <- [a+b] , abcHit (a,b,c)]
	where
        as b | even b = [1..b`div`4]
             | otherwise = [1..b-1]
        x = 1000
			 
main = do 
    putStrLn "Start: "
    time $ print hits
    putStrLn "Finished"