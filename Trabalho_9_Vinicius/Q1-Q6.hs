type Pessoa = String
type Livro = String
type BancodeDados = [(Pessoa, Livro)]   

teste :: BancodeDados
teste = [("Paulo", "A Mente Nova do Rei"),
         ("Ana", "O Segredo de Luiza"),
         ("Paulo", "O Pequeno Principe"),
         ("Mauro", "O Capital"),
         ("Francisco", "O Auto da Compadecida")
         ]
livros :: BancodeDados -> Pessoa -> [Livro] 
livros banco pessoa =
    if null banco
        then []
        else if fst (head banco) == pessoa
            then [snd (head banco)] ++ livros (tail banco) pessoa
            else livros (tail banco) pessoa
pessoas :: BancodeDados -> Livro -> [Pessoa] 
pessoas banco livro =
    if null banco
        then []
        else if snd (head banco) == livro
            then [fst (head banco)] ++ pessoas (tail banco) livro
            else pessoas (tail banco) livro

emprestado :: BancodeDados -> Livro -> Bool
emprestado banco livro =
    if null banco
        then False
        else if snd (head banco) == livro
            then True
            else emprestado (tail banco) livro

quantidadeLivros :: BancodeDados -> Pessoa -> Int 
quantidadeLivros banco pessoa =
    if null banco 
        then 0
        else if fst (head banco) == pessoa 
            then 1 + quantidadeLivros (tail banco) pessoa
            else quantidadeLivros (tail banco) pessoa 


emprestar :: BancodeDados -> Pessoa -> Livro -> BancodeDados
emprestar banco pessoa livro = banco ++ [(pessoa, livro)]

devolver :: BancodeDados -> Pessoa -> Livro -> BancodeDados
devolver banco pessoa livro =
    if null banco
        then []
        else if head banco == (pessoa, livro)
            then tail banco
            else [head banco] ++ devolver (tail banco) pessoa livro

continuar :: BancodeDados -> IO ()
continuar banco = do
    putStrLn "Deseja continuar? (S/N)"
    resposta <- getLine
    if resposta == "s" || resposta == "S"
        then menu banco
        else putStrLn "Programa encerrado."

menu :: BancodeDados -> IO ()
menu banco = do
    putStrLn "1 - Consultar livros por pessoa"
    putStrLn "2 - Consultar pessoas por livro"
    putStrLn "3 - Verificar se um livro esta emprestado"
    putStrLn "4 - Consultar quantidade de livros por pessoa"
    putStrLn "5 - Registrar emprestimo"
    putStrLn "6 - Registrar devolucao"
    putStrLn "0 - Sair"
    opcao <- getLine

    if opcao == "0"
        then putStrLn "Programa encerrado."
        else if opcao == "5"
            then do
                putStrLn "Digite o nome da pessoa:"
                pessoa <- getLine
                putStrLn "Digite o titulo do livro:"
                livro <- getLine
                putStrLn "Emprestimo registrado."
                continuar (emprestar banco pessoa livro)
            else if opcao == "6"
                then do
                    putStrLn "Digite o nome da pessoa:"
                    pessoa <- getLine
                    putStrLn "Digite o titulo do livro:"
                    livro <- getLine
                    if devolver banco pessoa livro == banco
                        then putStrLn "Emprestimo nao encontrado."
                        else putStrLn "Devolucao registrada."
                    continuar (devolver banco pessoa livro)
                else do
                    if opcao == "1"
                        then do
                            putStrLn "Digite o nome da pessoa:"
                            pessoa <- getLine
                            putStrLn "Livros emprestados:"
                            print (livros banco pessoa)
                        else if opcao == "2"
                            then do
                                putStrLn "Digite o titulo do livro:"
                                livro <- getLine
                                putStrLn "Pessoas que tomaram o livro emprestado:"
                                print (pessoas banco livro)
                            else if opcao == "3"
                                then do
                                    putStrLn "Digite o titulo do livro:"
                                    livro <- getLine
                                    if emprestado banco livro
                                        then putStrLn "O livro esta emprestado."
                                        else putStrLn "O livro nao esta emprestado."
                                else if opcao == "4"
                                    then do
                                        putStrLn "Digite o nome da pessoa:"
                                        pessoa <- getLine
                                        putStrLn "Quantidade de livros emprestados:"
                                        print (quantidadeLivros banco pessoa)
                                    else putStrLn "Opcao invalida."

                    continuar banco


main :: IO ()
main = menu teste



