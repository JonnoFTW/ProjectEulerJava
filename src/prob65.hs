module Main where
import Data.Ratio

e n 0 = 1+n
e n x = e (1%(2+n)) (x-1)