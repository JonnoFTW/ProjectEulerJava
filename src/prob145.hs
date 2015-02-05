module Main where
import Time
import Data.List
import Data.Char

rev n =all odd $ map digitToInt $show  (n + (read $reverse $ show n))
answer = length $ filter rev $ filter ls ([1..10^5] ++ [10^6..10^7] ++ [10^8..10^9 -1])
r = 999999999

ls x | odd (digitToInt $ head $ show x)  = even x
	 | ((length  $ show x) > 5) && (odd $ length $ show x) = False
     | otherwise = odd x

main = do
	putStrLn "Starting..."
	time $ print (answer)
	putStrLn "Done."