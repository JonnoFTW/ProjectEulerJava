module Main where
import Data.Bits
t :: (Bits a) => a -> a
t 0 = 123456
t i | even tim = tim `div` 2
	| odd  tim = (floor (tim `div` 2)) `xor` 926252
	where
	  tim = t (i-1)
b i = ((t i) `rem` (2^11)) +1 