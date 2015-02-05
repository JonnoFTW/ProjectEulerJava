module Main where
import Data.List
import Control.Applicative
import Time

homo [] = True
homo (x:xs) = all (== x) xs

consec xs = all (\(a, b) -> succ a == b) (zip xs (tail xs))


data Hand = HHigh Value 
          | HOne Value 
          | HTwo Value Value
          | HThree Value 
          | HStraight Value 
          | HFlush  Value
          | HFull Value Value 
          | HFour Value 
          | HStraightF Value 
          | HRoyalF 
         deriving (Ord, Show, Eq)
data Value = Two | Three | Four | Five | Six | Seven | Eight | Nine | Ten | Jack | Queen | King | Ace deriving (Ord, Show, Eq, Enum)
data Suit  = Clubs | Spades | Diamonds | Hearts deriving (Show, Eq, Ord)


result :: String -> Hand
result x | homo f && v == [Ten .. Ace] = HRoyalF
         | homo f && consec v          = HStraightF (maximum v)
         | consec (tail v) || consec (init v) = HFour (last $ head $ filter consec [ init v, tail v])
         | any ((== 3) . length) vg && any ((== 2) . length) vg = HFull (head $ last vg) (head $ head vg)
         | homo f                      = HFlush (maximum v)
         | consec v                    = HStraight (maximum v)
         | any ((== 3) . length) vg    = HThree (head $ head $ filter ((== 3) . length) vg)
         | ((== 2) . length)  $ filter ((== 2) . length) vg   = HTwo (head $ head $ filter ((== 2) . length) vg) (last $ head $ filter ((== 2) . length) vg)
         | any ((== 2) . length) vg    = HOne (head $ head $ filter ((== 2) . length) vg)
         | otherwise                   = HHigh (maximum v)
    where 
        xs = words x
        h = map toC xs
        v = sort $ map fst h
        vg = group v
        f = sort $ map snd h
winner :: (String,String) -> Bool
winner (x,y) = (result x) > (result y)

toC :: String -> (Value,Suit)
toC [a,b] = (toVal a,toSuit b)

toVal :: Char -> Value
toVal x = case x of
    '2' -> Two
    '3' -> Three
    '4' -> Four
    '5' -> Five
    '6' -> Six
    '7' -> Seven
    '8' -> Eight
    '9' -> Nine
    'T' -> Ten
    'J' -> Jack
    'Q' -> Queen
    'K' -> King
    'A' -> Ace
    
toSuit :: Char -> Suit
toSuit x = case x of
    'D' -> Diamonds
    'H' -> Hearts
    'S' -> Spades
    'C' -> Clubs

answer pok = length $ filter winner pok

main = do
    input <- lines <$> readFile "C:\\Haskell\\poker.txt"
    let poker = fmap (splitAt 5)  input
    print (answer poker)