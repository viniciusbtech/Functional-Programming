
repetirOperacao :: Int -> IO()
repetirOperacao n = do
    if n <= 0
        then return()  -- caso base: quando n é 0 ou menor,termina
        else do 
            print n  --- imprime  valor atual de n 
            repetirOperacao(n -1) --- chamar recusivamente com n-1 



main :: IO()
main = do 
    repetirOperacao 3 -- For