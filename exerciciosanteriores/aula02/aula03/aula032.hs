
-- Definindo o corpo da função (neste caso, apenas retorna o número recebido)
ageCalculator :: Int -> Int 
ageCalculator n = n

main :: IO()
main = do 
    putStrLn "Me de sua idade"
    numero <- readLn :: IO Int 

    if ageCalculator numero < 0 
        then putStrLn "idade invalida"
        else if ageCalculator numero < 18 
            then putStrLn "sala 1"  -- Corrigido para putStrLn (L maiúsculo)
            else if ageCalculator numero < 60 
                then putStrLn "sala 2"  -- Corrigido para putStrLn (L maiúsculo)
                else putStrLn "sala 3"