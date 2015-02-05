
module Main where
import Time
import List
import Char

show x = reverse $ show' x
	where
		show' 0 = []
		show' y = let (a,b) = quotRem y 10 in [b] ++ show' a


palindrome n = show n == (reverse $ show n)
balanced n   = (sum $ take (ceiling ((fromIntegral $ length (show n)) / 2)) (show n)) == (sum $ take (ceiling ((genericLength (reverse (show n))) / 2)) (reverse (show n))) 
set n  | palindrome n ==  True = n : []
	   | balanced   n == True  = n : []
	   | otherwise = []

t n = ((sum [ i | i <- [(10^(n-1))..(10^n - 1)], i `elem` set i]) + sum [t x| x <- [n-1,n-2..1]]
answer = do (t 4) -- `mod` (3^15))
	