import Text.Printf (printf)

-- Função auxiliar com acumulador (recebe n e a soma atual)
somaNLidosAcc :: Int -> Int -> IO Int
somaNLidosAcc n acumulador
    | n <= 0    = return acumulador
    | otherwise = do
        valor <- readLn :: IO Int
        -- Passa o n decrescido e atualiza o acumulador somando o valor digitado
        somaNLidosAcc (n - 1) (acumulador + valor)

main :: IO ()
main = do 
    putStrLn "=== Soma de n numeros lidos ==="
    putStr "Digite quantos numeros deseja somar (n): "
    n <- readLn :: IO Int 
    
    putStrLn "Agora digite os numeros:"
    
    -- Começa a contar de 'n' com o acumulador em 0, e joga direto no printf
    somaNLidosAcc n 0 >>= printf "Soma: %d\n"