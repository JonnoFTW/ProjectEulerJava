module Main where
import Time
import Data.Ratio
import Data.List

same n m = read ('0' :(show n \\ show m)) :: Int
usame n m | any (== 2) $ map length [show f,show g] = 1 % 1
          | any (== 0) [f,g] = 1 % 1
          | otherwise = f % g
            where
                f = same n m
                g = same m n
main =time $ print $ denominator $ product [(n%d)|d<-filter nT [11..99],n<- filter nT [11..d-1],(usame n d) == (n%d)]
nT x = (x `mod` 10) /= 0