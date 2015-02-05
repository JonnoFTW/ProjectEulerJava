module Main where
import Data.List
import Data.Ratio
import Time
r = 8000
{-fracs = f $ last $ sort [ (n,d) | d<-tail [0,7..r], n <- [1..d-1] , gcd n d == 1, n%d == 3%7]
    where
        f xs =last $ takeWhile (/= 3%7) $sort  [ (n%d)| d<-[(snd xs),(snd xs)-1..1],n<-[(fst xs),(fst xs)-1..1], gcd n d == 1]
main = 	time $ print fracs

nums d = takeWhile (\(x,y) -> x%y < 3%7) [(n,d)| n<- [1..d-1]] 

dicks = sort $ map (\(x,y)-> x%y) [ns | n <- [1..r], ns<- nums n]-}

answer = last $ takeWhile(< 3%7) $ sort [n%d |d<-[1..r],n<-[1..d-1],gcd n d == 1]
main = time $ print answer