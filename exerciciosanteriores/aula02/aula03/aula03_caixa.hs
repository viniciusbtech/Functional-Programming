saldoConstante :: Int
saldoConstante = 1000

main :: IO ()
main = do
    putStrLn "=== Caixa Eletronico ==="
    putStrLn ("Saldo disponivel na conta: R$ " ++ show saldoConstante)
    putStrLn "Digite o valor que deseja sacar:"
    
    saque <- readLn :: IO Int
    
    if saque <= 0
        then do
            putStrLn "Valor de saque invalido."
            main
        else if saque <= saldoConstante 
            then do
                putStrLn ("Autorizado! Novo saldo atual: R$ " ++ show (saldoConstante - saque))
                main
            else 
                putStrLn ("Negado, saldo insuficiente. Saldo atual: R$ " ++ show saldoConstante)
                
            