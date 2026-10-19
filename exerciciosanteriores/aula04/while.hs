-- Função genérica de repetição (aceita qualquer IO () como operação)
whileRepetir :: IO () -> IO ()
whileRepetir operacao = do
    operacao
    putStrLn "Deseja repetir a operação? (s/n)"
    resposta <- getLine
    if resposta == "s" || resposta == "S"
        then whileRepetir operacao
        else putStrLn "Operação Finalizada"

-- Sua função original que imprime números até n
repetirOperacao :: Int -> IO ()
repetirOperacao n = do
    if n <= 0
        then return ()
        else do 
            print n 
            repetirOperacao (n - 1)

main :: IO ()
main = do 
    putStrLn "--- Iniciando o Programa ---"
    
    -- Passamos o programa (com o parâmetro 3 já aplicado) para o while
    whileRepetir (repetirOperacao 3)            










































































































    