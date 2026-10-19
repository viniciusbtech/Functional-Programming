-- comanda para ler produtos
-- tem que ler os produtos
--  ele quer receber o número de produtos 
-- e ele vai digitar os valores 


lerValores :: Int -> Double -> IO Double

lerValores 0 total = return total

lerValores quantidade total = do
    putStrLn "Digite o valor do produto:"
    valor <- readLn
    lerValores (quantidade - 1) (total + valor)


main :: IO ()
main = do
    putStrLn "Deseja processar uma comanda? (S/N)"
    resposta <- getLine

    if resposta == "S"
        then do
            putStrLn "Digite a quantidade de itens:"
            quantidade <- readLn

            putStrLn "Total da comanda"
            lerValores quantidade 0 >>= print

            main
        else
            putStrLn "Expediente encerrado."