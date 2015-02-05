module Main where
import Data.List
import Time
import ArithmeticFunctions


trian n = (n*(n+1))`div`2
trians = [ trian n | n<- [1..]]
answer = head [a|a<-(zip trians $ map numDivisors trians), snd a > 500]

main = do 
	putStrLn "IT BEGINS"
	time $ print answer
	putStrLn "......Done"