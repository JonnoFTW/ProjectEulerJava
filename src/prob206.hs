module Main where
import Time
isInt x = x == fromInteger (round x)
numb xs = read$concatMap show xs :: Integer
xs = [0..9]
answer = head $ filter (isInt) $ [sqrt $fromIntegral$ numb [1,a,2,b,3,c,4,d,5,e,6,f,7,g,8,h,9,i,0]|a<-xs,b<-xs,c<-xs,d<-xs,e<-xs,f<-xs,g<-xs,h<-xs,i<-xs]
squares = [n^2|n<-[1000000000..3200000000],(length$show$n^2) == 19]

main = do 
	putStrLn "Start: "
	time $ print answer
	putStrLn "Finished"