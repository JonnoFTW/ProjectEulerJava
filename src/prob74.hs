module Main where
import Time
import Data.Char
import Data.List
import qualified Data.MemoCombinators as M

fac n = foldl' (*) 1 $ enumFromTo 1 n
sum' xs = foldl' (+) 0 xs
sumFac  = M.integral sumFac'
    where
        sumFac' n = sum' $ map fac $  map digitToInt $ show n

chain  = M.integral chain'
    where
        chain' x xs | x `elem` xs = length xs
                    | otherwise   = chain s (x:xs)
                        where 
                            s = sumFac x
            
answer = length $ [(x,y)|y<-[1..((10^6)-1)],x<- [chain y []], x == 60]
main = do 
	time $ print answer
