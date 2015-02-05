module Main where 
import Data.List
import Time
import qualified Data.MemoCombinators as Memo

isBoun x = ((reverse $ sort $ show x) /= (show x)) && ((sort $ show x) /= (show x))
bouncers = Memo.integral bouncers' 
    where
        bouncers' x = length $ filter isBoun [1..x]
answer = head [x|x<-[1..], (100 * (x - bouncers x)) == x]
main = do
	time $ print answer