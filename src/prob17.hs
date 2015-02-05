module Main where
nones = ["","one","two","three","four","five","six","seven","eight","nine","ten","eleven","twelve","thirteen","fourteen","fifteen","sixteen","seventeen","eighteen","nineteen"]
tens = ["","","twenty","thirty","forty","fifty","sixty","seventy","eighty","ninety"]
num2word :: Int -> String
num2word n | x <= 2 && n < 20 = nones !! n
           | x == 2 && n >= 20 = tens !! fst y ++ nones !! snd y
           | x == 3 = nones !! fst z++"hundred" ++ a
           | n == 1000 = "onethousand"
            where
                x = length $ show n
                y = divMod n 10
                z = divMod n 100
                a | snd z == 0 = ""
                  | otherwise = "and"++num2word (snd z)
main = print $ length $ concatMap num2word [1..1000]