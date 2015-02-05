module Main where
import Data.List
import Time

answer = read $ concatMap show  $ last $  take (10^6) $ sort $ permutations [0..9] :: Integer


main = do
	putStrLn "Starting..."
	time $ print answer
	putStrLn "Finito"