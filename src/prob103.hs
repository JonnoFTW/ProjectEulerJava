module Main where
import Data.List
s [1] = 1
s a = sum a

isSpec a = ((s b) /= (s c)) && ((length b) > (length c))
	where 
		
	
optimum a = b:(map (+b) a)
	where
		b = a !! ((length a) `div` 2)

