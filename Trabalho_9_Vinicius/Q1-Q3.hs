-- Consultas: livros por pessoa e pessoas por livro.
type Pessoa = String
type Livro = String
type BancodeDados = [(Pessoa, Livro)]   

teste :: BancodeDados
teste = [("Paulo", "A Mente Nova do Rei"),
         ("Ana", "O Segredo de Luiza"),
         ("Paulo", "O Pequeno Principe"),
         ("Mauro", "O Capital"),
         ("Francisco", "O Auto da Compadecida"),
         ("Paulo", "O Segredo de Luiza")]
-- Q1
livros :: BancodeDados -> Pessoa -> [Livro] 
livros banco pessoa =
    if null banco
        then []
        else if fst (head banco) == pessoa --   
            then [snd (head banco)] ++ livros (tail banco) pessoa
            else livros (tail banco) pessoa
-- Q2
pessoas :: BancodeDados -> Livro -> [Pessoa] 
pessoas banco livro =
    if null banco
        then []
        else if snd (head banco) == livro
            then [fst (head banco)] ++ pessoas (tail banco) livro
            else pessoas (tail banco) livro

-- Q3
emprestado :: BancodeDados -> Livro -> Bool
emprestado banco livro =
    if null banco
        then False
        else if snd (head banco) == livro
            then True
            else emprestado (tail banco) livro

-- Q4
quantidadeLivros :: BancodeDados -> Pessoa -> Int
quantidadeLivros banco pessoa =
    if null banco
        then 0
        else if fst (head banco) == pessoa
            then 1 + quantidadeLivros (tail banco) pessoa
            else quantidadeLivros (tail banco) pessoa

main :: IO ()
main = do
    putStrLn "1 - Consultar livros por pessoa"
    putStrLn "2 - Consultar pessoas por livro"
    putStrLn "3 - Verificar se um livro esta emprestado"
    putStrLn "4 - Consultar quantidade de livros por pessoa"
    putStrLn "0 - Sair"
    opcao <- getLine

    if opcao == "0"
        then putStrLn "Programa encerrado."
        else do
            if opcao == "1"
                then do
                    putStrLn "Digite o nome da pessoa:"
                    pessoa <- getLine
                    putStrLn "Livros emprestados:"
                    print (livros teste pessoa)
                else if opcao == "2"
                    then do
                        putStrLn "Digite o titulo do livro:"
                        livro <- getLine
                        putStrLn "Pessoas que tomaram o livro emprestado:"
                        print (pessoas teste livro)
                    else if opcao == "3"
                        then do
                            putStrLn "Digite o titulo do livro:"
                            livro <- getLine
                            if emprestado teste livro
                                then putStrLn "O livro esta emprestado."
                                else putStrLn "O livro nao esta emprestado."
                        else if opcao == "4"
                            then do
                                putStrLn "Digite o nome da pessoa:"
                                pessoa <- getLine
                                putStrLn "Quantidade de livros emprestados:"
                                print (quantidadeLivros teste pessoa)
                            else putStrLn "Opcao invalida."

            putStrLn "Deseja continuar? (S/N)"
            resposta <- getLine
            if resposta == "s" || resposta == "S"
                then main
                else putStrLn "Programa encerrado."



