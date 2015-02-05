module Main where
import Time
import Data.List
import Data.Char
import Data.Numbers.Primes (primes)
import Primes hiding (primes)

pprimes = dropWhile (<1000) $ takeWhile (<9999) primes
f x = True

answer = filter f primes

permNum :: Integer -> [Integer]
permNum x = sort $ filter isPrime $map read $ permutations $ show x 

g = filter (\x-> (length $ show x)== 4) $ nub $ map (\x ->(read $ sort $ show x)::Integer) pprimes

{-
main = do
	putStrLn "Starting..."
	time $ print answer
	putStrLn "Done."-}  
    
{-snub [] = []
snub (x:xs) | elem x xs = snub (filter (/=x) xs)
            | otherwise = x : snub xs
notpalin = [n|n<-pprimes, (sort $ show n) `elem` (snub $ map sort $ map show pprimes)]-}