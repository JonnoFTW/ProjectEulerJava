module Main where

import Data.List
import Data.Char

sum'  xs = foldl' (+) 0 xs
f xs = all (> 9)  $ sum' xs

g = [x|a<-