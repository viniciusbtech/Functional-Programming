main :: IO ()
main = do 
    putStrLn "hello ______!"
    name <- getLine 
    putStrLn("hello"++ name)


-- interpretador runghc aula01.hs  compilador"ghc ola.hs" +  "./ola.exe "  
-- como abrir o interpretador de haskell ghci
-- comandos :l aula01.hs
-- comandos :r aula01.hs
-- sair do :q