module Main where

import Data.List
import Time

--http://projecteuler.net/index.php?section=problems&id=68

    --This Solves the given example case -- 
    
lists =  [ [[d,c,b],[e,a,c],[f,b,a]] | n@[a,b,c,d,e,f] <- permutations [1..6], ring n ]
lists3 =sort [ concatMap show $ concat[[a,b,c],[d,c,e],[f,e,b]] | n@[a,b,c,d,e,f] <- permutations [1..6], ring n ]
ring [a,b,c,d,e,f] = (length $ nub $ map sum [[d,c,b],[f,b,a],[e,a,c]]) == 1

l2 = sort [ concatMap show [d,c,b,f,b,a,e,a,c] | n@[a,b,c,d,e,f] <- permutations [1..6], ring n ]


    --This Solves the required solution -- 
lists2 = maximum  [ concatMap show $ concat m | [a,b,c,d,e,f,g,h,i,j] <- permutations [(1 :: Int)..10]
                                ,all (/= 10) [b,c,e,g,i]
                                ,let m = cycleMin [[a,b,c],[d,c,e],[f,e,g],[h,g,i],[j,i,b]]
                                ,ring2 m]
ring2 m = (length $ nub $ map sum m) == 1

cycleMin xs = vs ++ us
    where 
    (us,vs) = break (==m) xs
    m = minimum xs
main = do    
	time $ print lists2
	putStrLn "Finish"
	