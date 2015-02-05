module Main where
import Time

a n | n == 1         = [n]
    | n `rem` 3 == 0 = n: (a $ n`div`3)
    | n `rem` 3 == 1 = n: (a $ (4*n +2)`div`3)
    | n `rem` 3 == 2 = n: (a $ (2*n -1)`div`3)

f n | n `rem` 3 == 0 ='D'
    | n `rem` 3 == 1 ='U'
    | n `rem` 3 == 2 ='d'

b m = take 30 $ map f (a m)

str = "UDDDUdddDDUDDddDdDddDDUDDdUUDd"
str2 = "DdDddUUdDD"

ls = [10^15 +4,10^15 + 7..]
nums = [x|x<-ls,x`rem`3==1,(((4*x +2) `div`2)`rem`3)==0]

answer =head $ filter (\x->str == snd x) $ zip nums $ map b nums
answer2 = head$filter (\x->str2 == snd x) $ zip [10^6..] $ (map (take 10)$ map b [10^6..])

main = print answer2