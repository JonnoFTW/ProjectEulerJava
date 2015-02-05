module Main where
import Data.List
import Time

fac n = foldl' (*) 1 $ filter (\x-> x`mod`10 /= 0) $enumFromTo 1 n
f n = reverse$ take 5 $ show (read $reverse $  show $ fac n :: Integer)
answer = f $ 1000000000000

main = do 
	putStrLn "Start: "
	time $ print answer
	putStrLn "Finished"