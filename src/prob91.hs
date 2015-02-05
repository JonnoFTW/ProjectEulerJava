module Main where
import Data.List

pq (x1,y1,x2,y2) = ( (x2 - x1)^2 + (y2 - y1)^2 )
op (x2,y2) =  ( (0-x2)^2 + (0-y2)^2 )
oq (x1,y1) =  ( (0-x1)^2 + (0-y1)^2 )

n = [0..2]
isRight (x1,y1,x2,y2) = hyp == (opp + adj)
		where
			op' = op (x2,y2)
			oq' = oq (x1,y1)
			pq' = pq (x1,y1,x2,y2)
			pts = [op',oq',pq']
			hyp = maximum pts
			opp = minimum pts
			adj = head $ delete opp $ delete hyp pts
			
isRight2 (x1,y1,x2,y2) = (((x0-x1)^2 + (y0 - y1)^2) + ((x0-x2)^2 + (y0 - y2)^2)) == (((x1-x2)^2 + (y1 - y2)^2))
	where
		x0 = 0
		y0 = 0
	
answer =  [(x1,y1,x2,y2)|x1<-n, y1<-n, x2<-n, y2<-n,
						isRight (x1,y1,x2,y2)]
						{-(x1 /= x2) && (y1 /= y2),
						(x1 /= 0) && (y1 /= 0),
						(x2 /= 0) && (y2 /= 0)]-}
