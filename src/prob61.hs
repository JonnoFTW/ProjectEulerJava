module Main where
import Time
import Data.List

p3 n = n*(n+1) `div` 2
p4 n = n*n
p5 n = n*(3*n -1) `div` 2
p6 n = n*(2*n -1)
p7 n = n*(5*n -3) `div` 2
p8 n = n*(3*n -2)

x n = take 2 $ show n
x2 n = reverse $ take 2 $ reverse $ show n

isCyclic [a,b,c,d,e,f] = x2 a == x b && x2 b == x c && x2 c == x d && x2 d == x e && x2 e == x f && x2 f == x a
isCyclic2 [a,b,c]      = x2 b == x c && x2 c == x a && x2 a == x b

ns = head [x|a <- pX p3 , b <- pX p4 , c <- pX p5 , d <- pX p6 , e <- pX p7 , f <- pX p8 , x <- permutations [a,b,c,d,e,f], isCyclic x ]

pX p = [n|n<- dropWhile (< 999) $ takeWhile (< 9999) [p n|n<-[1..]] , ((show n) !! 2) /= '0', (n `mod` 100) > 10]

ns2 = head [x|a <- pX p3 , b <- pX p5 , c <- pX p4 , x <- permutations [a,b,c], isCyclic2 x ]

main = do 
	putStrLn "Start"
	time $ print ns2
	putStrLn "Finish"