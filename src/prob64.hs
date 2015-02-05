module Main where

prob63 = [ n | n <- [1..] , i <-[1..10], i^(length $ show n) == n]

nums n | odd (n) == True = filter odd [n..]
	   | otherwise         = filter even [n..]
	  
	  
prob63b :: [Integer]
prob63b = test 1
  where
    test s = next : test (next + 1)
      where
        next = head [n | n <- [s,s+2..], i <-[1..10], i^(length $ show n) == n]
