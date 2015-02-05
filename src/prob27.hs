module Main where
import Time
import Primes
import Data.List

fn a b     = 
	let n  = length $ takeWhile (isPrime) $ map (\n-> n^2 + a*n + b) [0..] 
	in ((fromIntegral n) , a , b)
r = 1000
xs         = [ (0-r),(0-r+2) .. r]
bs = filter (<= 1000) primesTo10000
t2l (a,b,c) = [a,b*c]
xn = map t2l [ fn a b | a <- xs , b <- bs ,  (head $ t2l $ fn a b) /= 0 ]

answer = last $ head $ dropWhile (< maximum (  xn))  xn

main = do
	putStrLn "Starting..."
	time $ print answer
	putStrLn "...Finito"
