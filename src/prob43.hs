module Main where
import Data.List
import List
import Time

xs          = permutations [0..9]
ints n      = read $ concatMap show n :: Integer
xsi         = [ n | n <- xs , (ints n) `rem` 17 == 0]

primeDiv2 n = even  (ints $ take 3 $ drop  1 n) 
primeDiv3 n = ints  (take 3 $ drop  2 n) `rem` 3  == 0
primeDiv4 n = ints  (take 3 $ drop  3 n) `rem` 5  == 0
primeDiv5 n = ints  (take 3 $ drop  4 n) `rem` 7  == 0
primeDiv6 n = ints  (take 3 $ drop  5 n) `rem` 11 == 0
primeDiv7 n = ints  (take 3 $ drop  6 n) `rem` 13 == 0
primeDiv8 n = ints  (take 3 $ drop  7 n) `rem` 17 == 0
-- sum $ map ints
answer      = sum $ map ints [ n | n <- xsi ,
					primeDiv2 n,
					primeDiv3 n,
					primeDiv4 n,
					primeDiv5 n,
					primeDiv6 n,
					primeDiv7 n,
					primeDiv8 n]

main = do
	putStrLn "Starting..."
	time $ print answer
	putStrLn "Done."


