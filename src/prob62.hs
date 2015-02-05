module Main where
import Time
import Data.List


isCube x = (round $ fromIntegral x ** (1/3))^3 == x
cubes = [n^3|n<-[1..]]
perms2 n= [x|x<-(nub$ (map read $ permutations $ show n :: [Integer]) `intersect` (takeWhile (< (read$reverse$sort$show n :: Integer)) cubes))]-- ,--(length$show x) == (length$show n)]
--perms n = [x|x<-(map read $ permutations $ show n :: [Integer]),(length$show x) == (length$show n),x `elem` (takeWhile (< (read$reverse$sort$show x :: Integer)) cubes)]
perms n = map read $ permutations $ show n :: [Integer]
answer = head [n|n<-cubes,(length $ filter (isCube) ( perms n)) == 3]
answer2 = head [n|n<-(dropWhile (< (344^3)) cubes),(length $ perms2 n) == 3]
answer3 = (length $ perms2 $345^3) == 3

main = do 
	putStrLn "Start: "
	time $ print answer2
	putStrLn "Finished"