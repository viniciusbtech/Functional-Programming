import Data.Char (digitToInt, intToDigit)


calcularParidade :: Int -> Bool
calcularParidade n = n `mod` 2 == 0




main :: IO()
main = do 
    putStrLn "me de o numero inteiro"
    numero <- readLn :: IO Int 

    if calcularParidade numero 
        then putStrLn"Par"
        else putStrLn"Impar"



    


