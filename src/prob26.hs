module Main where
-- TO solve: http://projecteuler.net/index.php?section=problems&id=26
import Data.List
import Data.Char
import Data.Ratio
-- import Numeric
import Time

--cycleL :: Double -> Int
cycleL n = cycleL' 0 $ tail $  map digitToInt $ show $ floor $ (1%n)*(10^300)

cycleL' :: Int -> [Int] -> Int
cycleL' _ [] = 0
cycleL' _ [n] = 1
cycleL' a x@(n:m:ns) | (2*a) >= (length x) = 0
                     | a == 0 = if (n == m) then 1 else cycleL' (a+1) x
                     | (x !! a) == (x !! (2*a)) = a
                     | otherwise = cycleL' (a+1) x

cycleB :: Int -> [Int] -> Int
cycleB _ []  = 0
cycleB _ [n] = 1
cycleB a x@(n:m:ns) | (2*a) >= (length x) = 0
                    | a == 0 = if (n == m) then 1 else cycleB (a+1) x
                    | | (x !! a) == (x !! (2^a)) = a
                    | otherwise  = cycleB (a+1) x

answer = maximum $ map (\x-> (cycleL x,x)) [2..999]

main = do
	putStrLn "Starting..."
	time $ print answer
	putStrLn "Finished"