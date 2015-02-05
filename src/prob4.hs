isPal x = show x == reverse (show x)
answer = maximum $ filter (isPal) [a*b| a<-[100..999],b<-[100..999]]
main =  print answer