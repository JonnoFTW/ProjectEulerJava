module Main where
import Data.List
import Time
import Text.Printf

isInt x = x == fromInteger (round x)
roundTo x =read ( printf "%0.3f" (x :: Float) :: String) :: Double
area (a,b) = {-roundTo-} (b * ((sqrt ((4*a*a) - (b*b))) / 4))
answer = foldl' (+) 0 $ takeWhile (<= 10^6 + 50) [x+x+z|x<-[1..],z<-[x-1,x+1], isInt $ area (x,z), z>0]
answer3 = head $ [x+x+z|x<-[1500,1499..],z<-[x+1,x-1], isInt $ area (x,z), z>0]
answer2 = [(x,z)|x<-[1..],z<-[x+1,x-1], isInt $ area (x,z), z>0]

main = do 
	putStrLn "Start: "
	time $ print answer
	putStrLn "Finished"