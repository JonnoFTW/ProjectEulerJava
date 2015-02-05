module Main where
import System.TimeIt
import Data.List
import Data.Char
import qualified Data.MemoCombinators as M

--fac n = foldl' (*) 1  (enumFromTo 1 n)
fac = M.integral fac' 
    where
        fac' 0 = 1
        fac' 1 = 1
        fac' n = fac (n-1) * n
decToList = map (read . return) . show
		
sols = [1,2,5,15,25,3,13,23,6,16,26,44,144,256,36,136,236,67,167,267,349,1349,2349,49,149,249,9,19,29,129,229,1229,39,139,239,1239,13339,23599,4479,14479,2355679,344479]

f   n = sum $ map fac (decToList n)
sf  n = sum $ decToList (f n) 
g   i = head [ n | n <- sols++[79,179..], sf n == i]
g2  i = head [ n | n <- [234772388879], sf n == i]
sg  i = sum $ decToList (g i)

answer = [ sg i | i <- [1 .. 150] ]

main = do
	putStrLn "Starting..."
	print answer
	putStrLn "Done."