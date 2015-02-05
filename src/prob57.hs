module Main where
import Ratio
import Time

expand (x,y) = (length $ show $ numerator (x%y)) > (length $ show $ denominator (x%y))
root :: Int ->  
root n = foldr (2+1/) (1) [1..n]
answer = length [ root n | n<-[1..1000], ,expand x y]

main = do
	putStrLn "Start: "
	time $ print answer
	putStrLn "Finish"