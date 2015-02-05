module Main where 
import Time
import Data.List

decToList x = reverse $ decToList' x
	where
		decToList' 0 = []
		decToList' y = let (a,b) = quotRem y 10 in [b] ++ decToList' a

chain n | (n == 1) || (n == 89) = n
		| otherwise = chain (sumSq n)
			where
				sumSq xs = sum $ map (^2) (decToList xs)
answer =length $ filter (== 89) $ map chain [1..10^7]
a2 = map chain [1..10^7]
main = do 
	putStrLn "Start: "
	time $ print answer
	putStrLn "Finished"