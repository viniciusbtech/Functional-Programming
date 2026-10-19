-- Equivalente a: for(int i = 1; i <= n; i++) { print(i); }
lacoFor :: Int -> Int -> IO ()
lacoFor atual limite
  | atual > limite = return () -- Condição de parada (fim do loop)
  | otherwise = do
      print atual              -- Ação do loop
      lacoFor (atual + 1) limite -- Avança para o próximo passo

main :: IO ()
main = do
    lacoFor 1 3 -- Vai imprimir de 1 até 3