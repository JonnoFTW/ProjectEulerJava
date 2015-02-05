module Main where

import Data.List
import Time
import Sets

sum' = foldl' (+) 0

org (a,b) | length a > length b = (a,b)
          | otherwise = (b,a)

f [x]    = [([],[x])]
f (x:xs) = concat [ [(x:a,b),(a,x:b)] | (a,b) <- f xs]
g (x:xs) = [ (x:a,b) | (a,b) <- f xs]

subs xs = [splitAt n xs|n<-[1..length xs -1]]
isSpec xs =False `notElem` $ map (\(b,c)->if length a > length b then ((sum' b) > (sum' c) else (sum' b) /= (sum' c)) $ map org $ g xs 

answer = sum' $ map sum' $ filter (isSpec) sets

answer = time $ print answer