module Main where
import Data.List
import Char
import Time

triangles = length [ c | c <- [n^2 | n <- [1..], n <= 10^16] , b <- [1..c] ,a <- [1..b], a^2 + b^2 == c^2 , (gcd a b == 1) == True ,  ((gcd b c ) == 1) == True , ((0.5*a*b) `rem` 6) == False , ((fromIntegral $ 0.5*a*b) `rem` 28) == False]

main = do
	putStrLn "Starting..."
	time $ print triangles
	putStrLn "Done."