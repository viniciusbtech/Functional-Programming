Questão 1 
livros :: BancodeDados -> Pessoa -> [Livro] -- funcao livros que recebe BD e Pessoa e retorna [Livro] Lista
livros banco pessoa =
    -- Verifica a lista vazia antes de usar head ou tail. (null) caso base  //  -[] True 
    if null banco
        then []
        -- fst seleciona a pessoa do primeiro emprestimo e verifica se é igual a pessoa)
        else if fst (head banco) == pessoa --   
            --seleciona o segundo elemento da tupla, tranasoforma ela em uma lista com um unico elemento e soma
            --chama recursivamente livros com uma lista dos demais elementos da sequência

            -- Se nao chama recursivamente livros com uma lista dos demais elementos da sequência
            then [snd (head banco)] ++ livros (tail banco) pessoa
            else livros (tail banco) pessoa


Questao 2 IGUAL A QUESTAO 1
pessoas :: BancodeDados -> Livro -> [Pessoa] -- Funcao que recebe banco de dados e pessoa e retorna uma lista
pessoas banco livro =
    if null banco -- verificar se a lista esta vazia se sim retorna vazio
        then []
        else if snd (head banco) == livro -- verificar o segundo elemento da tupla da cabeça da lista 
            -- se for igual retorna o primeiro elemento da tupla e chama pessoas com o restante dos elementos da lista passando livro como argumento
            then [fst (head banco)] ++ pessoas (tail banco) livro
            -- se for diferente retorna chama pessoas com o restante dos elementos da lista passando livro como argumento  
            else pessoas (tail banco) livro

Questao 3

emprestado :: BancodeDados -> Livro -> Bool FUNCAO emprestado que recebe um banco de dados e um livro e retorna um booleano
emprestado banco livro =
    if null banco // se o banco for vazio retorna falso condicao de parada
        then False
        else if snd (head banco) == livro -- Verifica se o segundo elemento da cabeça da lista de tuplas é igual ao livro procurado
            then True
            else emprestado (tail banco) livro 
            -- se nao for chama emprestado recursivamente 

Glossário e Resumo 

--Lista 
--sta é uma estrutura de dados formada por uma sequência de valores (elementos) do mesmo tipo.
--Os elementos de uma lista são identificados pela posição em que ocorrem na lista.
--lista vazia []
--head o primeiro elemento da sequência
--tail uma lista dos demais elementos da sequência
--head: retorna o primeiro elemento de uma lista.



--tupla tem ("Pedro",19)
--fst: seleciona o primeiro componente da tupla:PEdro
--snd: seleciona o segundo componente de um par:19