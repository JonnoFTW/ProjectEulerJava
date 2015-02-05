module Main where
import Time (time)
import ArithmeticFunctions (eulerTotient)
import Data.List (sort)

answer = minimum [((fromIntegral n)/ (fromIntegral $ eulerTotient n), n)| n <- [1..(10^7)], (sort $ show $ eulerTotient n) == (sort $ show n)]
-- minimum   ((fromIntegral n)/ (fromIntegral $ eulerTotient n))
main = do
	putStrLn "IT CEOMS"
	time $ print answer
	putStrLn "FinitO"