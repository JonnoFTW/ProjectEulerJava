module Main where
import Control.Applicative
import Data.List
import Data.Char
import Time
toArab :: String -> [Int]
toArab x = map toArab' x
    where
        toArab' x | x == 'I' = 1
                  | x == 'V' = 5
                  | x == 'X' = 10
                  | x == 'L' = 50
                  | x == 'C' = 100
                  | x == 'D' = 500
                  | x == 'M' = 1000

fromRoman :: String -> Int
fromRoman  = fromRoman' 0 . toArab

fromRoman' a [] = a
fromRoman' a [x] = a+x
fromRoman' a (x:y:xs) | y > x = fromRoman' (a+(y-x)) xs
                      | otherwise = fromRoman' (a+x) (y:xs)

toList :: Int -> [Int]
toList n = zipWith (\x y-> (10^x)*y ) [(length $ show n)-1,(length $ show n)-2..0] $ map digitToInt $ show n

roman x = concatMap toRoman $ toList x
toRoman :: Int -> String
toRoman x = toRoman' "" x

toRoman' a x | x == 0 = a++""
             | x == 1 =   toRoman' (a++"I") (x-1)
             | 2 == x =   toRoman' (a++"II") (x-2)
             | 3 == x =   toRoman' (a++"III") (x-3)
             | 4 == x =   toRoman' (a++"IV") (x-4)
             | 6 == x =   toRoman' (a++"VI") (x-6)
             | 7 == x =   toRoman' (a++"VII") (x-7)
             | 8 == x =   toRoman' (a++"VIII") (x-8)
             | 9 == x =   toRoman' (a++"IX") (x-9)
             | 40 == x =  toRoman' (a++"XL") (x-40)
             | 90 == x =  toRoman' (a++"XC") (x-90)
             | 400 == x = toRoman' (a++"CD") (x-400)
             | 900 == x = toRoman' (a++"CM") (x-900)
             | g 1000 = f 'M' 1000
             | g 500  = f 'D' 500
             | g 100  = f 'C' 100
             | g 50   = f 'L' 50
             | g 10   = f 'X' 10
             | g 5    = f 'V' 5
             | g 1    = f 'I' 1
                where
                    f c n= toRoman' ([c]++a) (x-n)
                    g c = (x `mod` c) == 0
                    

answer = do
    input <- lines <$> readFile "C:\\Haskell\\roman.txt"
    let output = show $ sum $ fmap (\x-> (length x) - (length $ roman $ fromRoman x) ) input
    putStrLn output
    
main = time answer