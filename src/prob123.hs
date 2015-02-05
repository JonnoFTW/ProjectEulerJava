module Main where
import Time
import Data.Numbers.Primes
import Data.List

p n = primes !! (n-1)
r n = (sum $ map (^n) [p n -1,p n +1]) `mod` ((p n)^2)
answer = head [n|n<-[7036..], (r n) > (1000000000) ]
main = do 
	putStrLn "Start: "
	time $ print answer
	putStrLn "Finished"