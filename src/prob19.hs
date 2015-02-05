module Main where
import Time

isLeap n | (n `mod` 100 /= 0) =  (rem n 4) == 0
		 | otherwise = (rem n 400) == 0

isLeap2 n | (n `mod` 4 == 0 && n `mod` 100 /= 0) || (n `mod` 400 == 0) = True
          | otherwise = False
         

jan = [1..31]
feb = [1..28]
leapFeb =  [1..29]
mar = [1..31]
apr = [1..30]
may = [1..31]
jun = [1..30]
jul = [1..31]
aug = [1..31]
sep = [1..30]
oct = [1..31]
nov = [1..30]
dec = [1..31]

year n | isLeap2 n = jan++leapFeb++mar++apr++may++jun++jul++aug++sep++oct++nov++dec
	   | otherwise =jan++    feb++mar++apr++may++jun++jul++aug++sep++oct++nov++dec


days = concat $ repeat[2,3,4,5,6,7,1]
years = zip days $ concatMap year [1901..2000]
sunStart (x,y) = (x == 7) && (y == 1)
answer = length $ filter (sunStart) years

main = do 
	putStrLn "Start: "
	time $ print answer
	putStrLn "Finished"