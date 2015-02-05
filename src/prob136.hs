module Main where
import Data.List
import Time

snub [] = []
snub (x:xs) | elem x xs = snub (filter (/=x) xs)
            | otherwise = x : snub xs
			
nsum (x,y,z) = x^2 - y^2 - z^2
answer = length $ snub $ filter (> 0) $ map nsum [(x, x-d, x-d-d) | x <- [3..5000], d <- [1..x`div`2]]
main = do 
	putStrLn "Start: "
	time $ print answer
	putStrLn "Finished"

	
			
