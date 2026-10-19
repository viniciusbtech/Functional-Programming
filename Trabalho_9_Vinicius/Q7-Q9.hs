-- Biblioteca estendida: limite, palavras-chave e datas.
type Pessoa = String
type Livro = String
type PalavraChave = String
-- Datas validas no formato AAAAMMDD, por exemplo: 20261019.
type Data = Int
type Emprestimo = ((Pessoa, Livro), (Data, Data))
type BancodeDados = [Emprestimo]
type Catalogo = [(Livro, [PalavraChave])]

limiteLivros :: Int
limiteLivros = 3

catalogo :: Catalogo
catalogo = [("A Mente Nova do Rei", ["ciencia", "mente"]),
            ("O Segredo de Luiza", ["negocios", "empreendedorismo"]),
            ("O Pequeno Principe", ["literatura", "amizade"]),
            ("O Capital", ["economia", "politica"]),
            ("O Auto da Compadecida", ["literatura", "teatro"])]

-- Cada registro: ((pessoa, livro), (data do emprestimo, data limite)).
teste :: BancodeDados
teste = [(("Paulo", "A Mente Nova do Rei"), (20261001, 20261025)),
         (("Ana", "O Segredo de Luiza"), (20261001, 20261010)),
         (("Paulo", "O Pequeno Principe"), (20261005, 20261019)),
         (("Mauro", "O Capital"), (20261002, 20261015)),
         (("Francisco", "O Auto da Compadecida"), (20261010, 20261030))]

-- Auxiliar da Q7: contar os emprestimos da pessoa.
quantidadeLivros :: BancodeDados -> Pessoa -> Int
quantidadeLivros banco pessoa =
    if null banco
        then 0
        else if fst (fst (head banco)) == pessoa
            then 1 + quantidadeLivros (tail banco) pessoa
            else quantidadeLivros (tail banco) pessoa

existeLivro :: Catalogo -> Livro -> Bool
existeLivro acervo livro =
    if null acervo
        then False
        else if fst (head acervo) == livro
            then True
            else existeLivro (tail acervo) livro

-- Q7: impedir novos emprestimos quando o limite for atingido.
emprestar :: BancodeDados -> Pessoa -> Livro -> Data -> Data -> BancodeDados
emprestar banco pessoa livro retirada prazo =
    if quantidadeLivros banco pessoa >= limiteLivros
        then banco
        else if existeLivro catalogo livro
            then if retirada > 0 && prazo >= retirada
                then banco ++ [((pessoa, livro), (retirada, prazo))]
                else banco
            else banco

-- Q8: procurar a palavra na lista associada a cada titulo.
temPalavra :: [PalavraChave] -> PalavraChave -> Bool
temPalavra palavras palavra =
    if null palavras
        then False
        else if head palavras == palavra
            then True
            else temPalavra (tail palavras) palavra

livrosPorPalavra :: Catalogo -> PalavraChave -> [Livro]
livrosPorPalavra acervo palavra =
    if null acervo
        then []
        else if temPalavra (snd (head acervo)) palavra
            then [fst (head acervo)] ++ livrosPorPalavra (tail acervo) palavra
            else livrosPorPalavra (tail acervo) palavra

-- Q9: o vencimento no proprio dia ainda nao esta atrasado.
emprestimosVencidos :: BancodeDados -> Data -> BancodeDados
emprestimosVencidos banco referencia =
    if null banco
        then []
        else if snd (snd (head banco)) < referencia
            then [head banco] ++ emprestimosVencidos (tail banco) referencia
            else emprestimosVencidos (tail banco) referencia

continuar :: BancodeDados -> IO ()
continuar banco = do
    putStrLn "Deseja continuar? (S/N)"
    resposta <- getLine
    if resposta == "s" || resposta == "S"
        then menu banco
        else putStrLn "Programa encerrado."

registrarEmprestimo :: BancodeDados -> IO ()
registrarEmprestimo banco = do
    putStrLn "Digite o nome da pessoa:"
    pessoa <- getLine
    if quantidadeLivros banco pessoa >= limiteLivros
        then do
            putStrLn "Limite de livros atingido."
            continuar banco
        else do
            putStrLn "Digite o titulo do livro:"
            livro <- getLine
            if existeLivro catalogo livro
                then do
                    putStrLn "Digite a data do emprestimo (AAAAMMDD):"
                    retirada <- readLn
                    putStrLn "Digite a data limite de devolucao (AAAAMMDD):"
                    prazo <- readLn
                    if retirada > 0 && prazo >= retirada
                        then do
                            putStrLn "Emprestimo registrado."
                            continuar (emprestar banco pessoa livro retirada prazo)
                        else do
                            putStrLn "Periodo invalido: a data limite deve ser igual ou posterior a retirada."
                            continuar banco
                else do
                    putStrLn "Livro nao encontrado no catalogo."
                    continuar banco

menu :: BancodeDados -> IO ()
menu banco = do
    putStrLn "7 - Registrar emprestimo respeitando o limite"
    putStrLn "8 - Buscar livros por palavra-chave"
    putStrLn "9 - Consultar emprestimos vencidos"
    putStrLn ("Limite por pessoa: " ++ show limiteLivros)
    opcao <- getLine
    if opcao == "7"
        then registrarEmprestimo banco
        else do
            if opcao == "8"
                then do
                    putStrLn "Digite a palavra-chave (exemplo: literatura):"
                    palavra <- getLine
                    print (livrosPorPalavra catalogo palavra)
                else if opcao == "9"
                    then do
                        putStrLn "Digite a data de referencia (AAAAMMDD):"
                        referencia <- readLn
                        putStrLn "Resultado: ((pessoa, livro), (retirada, data limite))"
                        print (emprestimosVencidos banco referencia)
                    else putStrLn "Opcao invalida."
            continuar banco

main :: IO ()
main = menu teste
