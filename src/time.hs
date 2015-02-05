module Time where

import System.CPUTime
import Text.Printf


time :: IO t -> IO t
time a = do
    start <- getCPUTime
    v <- a
    end   <- getCPUTime
    let diff = (fromIntegral (end - start)) / (10^12)
    printf "Computation time: %0.6f sec\n" (diff :: Double)
    return v