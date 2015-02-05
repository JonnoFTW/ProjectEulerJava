module Main where
h l b = sqrt ((l*l) - ((b/2)^2))

answer =  take 12 [ l | l <- [2..], b <- [(round $ (sqrt l))..l], h <- [(h l b)], (h == (b+1)) || (h == (b-1))]