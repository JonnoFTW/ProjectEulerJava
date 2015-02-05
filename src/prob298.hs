module Main where
import Data.List
import Time

game turn nc lm ls rm rs | turn == 11 = [ls, rs]
                         | otherwise = game (turn+1) (ncc nc) 
                            (if nc `elem` lm then (tail lm)++[nc] else lm++[nc]) (score nc lm)
                            (if nc `elem` rm then (tail rm)++[nc] else rm++[nc]) (score nc rm)
                                where
                                    ncc nc | turn == 1 = 1
                                           | turn == 2 = 2
                                           |turn == 3 = 4
                                           |turn == 4 = 6
                                           |turn == 5 = 1
                                           |turn == 6 = 8
                                           |turn == 7 = 10
                                           |turn == 8 = 2
                                           |turn == 9 = 4
                                           |turn == 10 = 1

score x xs = if x `elem` xs then x+1 else x

main = time $ print $ game 1 1 [] 0 [] 0