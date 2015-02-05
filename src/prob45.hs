module Main where
import Time
import Data.List
trian = map round [(n*(n+1)/2)  |n<-[1..75000]]
penta = map round [(n*(3*n-1)/2)|n<-[1..75000]]
hexag = map round [(n*(2*n-1))  |n<-[1..75000]]
answer = take 3 [p|p<-(intersect trian penta),p `elem` hexag]
main = do
	putStrLn "Start: "
	time $ print answer
	putStrLn "Finsihes"