# Empréstimos — questões 1 a 6

Os arquivos `Q1-Q3.hs` e `questao1.py` contêm quatro consultas e o registro de empréstimos e devoluções:

- `livros`: recebe a base e uma pessoa e retorna seus livros emprestados.
- `pessoas`: recebe a base e um livro e retorna as pessoas que o tomaram emprestado.
- `emprestado`: recebe a base e um livro e retorna `True` se encontrar um empréstimo desse título, ou `False` caso contrário.
- `quantidadeLivros`: recebe a base e uma pessoa e retorna a quantidade de livros que ela tomou emprestado, ou `0` quando não há empréstimos.
- `emprestar`: recebe a base, uma pessoa e um livro e retorna uma nova base com o par adicionado ao final, preservando os empréstimos anteriores.
- `devolver`: recebe a base, uma pessoa e um livro e retorna uma nova base sem o primeiro empréstimo correspondente ao par informado. Se não encontrar, retorna uma base igual à recebida.

As funções `livros` e `pessoas` percorrem a base por recursão, preservam a ordem dos empréstimos
e retornam `[]` quando não há correspondências. Nomes e títulos devem ser
digitados como aparecem na base, respeitando maiúsculas e minúsculas.

## Menu

```text
1 - Consultar livros por pessoa
2 - Consultar pessoas por livro
3 - Verificar se um livro esta emprestado
4 - Consultar quantidade de livros por pessoa
5 - Registrar emprestimo
6 - Registrar devolucao
0 - Sair
```

Após uma consulta ou opção inválida, o programa pergunta `Deseja continuar? (S/N)`.
Responder `S` ou `s` chama `menu` recursivamente com a base atual e exibe o menu novamente.
Outra resposta encerra o programa. A opção `0` encerra diretamente.
As opções são lidas como texto, sem conversão numérica.

`main` inicia `menu` com `teste`. A função `continuar` recebe a base que
será usada na próxima consulta. Após a opção `5`, ela recebe o resultado de
`emprestar`; após a opção `6`, recebe o resultado de `devolver`.
As consultas seguintes utilizam essa nova base. As atualizações
valem durante a execução e não são salvas em arquivo.
O registro acrescenta um par por operação, sem bloquear títulos já emprestados.

## Recursos utilizados

O menu usa condicionais, entrada e saída e recursão, como em
`exerciciosanteriores/aula05/comanda.hs` e `exerciciosanteriores/aula04/while.hs`.
As funções `null`, `head`, `tail`, `fst`, `snd` e o operador `++`
estão apresentados no [material das aulas](../aulas.md).
A lista vazia é verificada antes de acessar o primeiro empréstimo.

No Python, índices acessam os valores das tuplas, `banco[1:]` corresponde
a `tail banco` e `+` concatena listas. O menu também repete por recursão.

## Executar na pasta do projeto

```text
runghc Trabalho_9_Vinicius/Q1-Q3.hs
python Trabalho_9_Vinicius/questao1.py
```

Na opção `1`, consultar `Ana` na base inicial retorna `O Segredo de Luiza`.
Na opção `2`, consultar `O Capital` retorna `Mauro`.
Na opção `3`, consultar `O Capital` informa que está emprestado.
Um título ausente da base é informado como não emprestado; isso não comprova
que exista no acervo, pois a base registra somente empréstimos.

A função `emprestado` usa o mesmo padrão recursivo: lista vazia retorna
`False`; título encontrado retorna `True`; caso contrário, consulta `tail banco`.

Na opção `4`, consultar `Ana` na base inicial retorna `1`
e consultar uma pessoa ausente da base retorna `0`.
A função `quantidadeLivros` retorna `0` para a lista vazia. Para cada
empréstimo da pessoa procurada, soma `1` ao resultado da chamada recursiva;
nos demais casos, apenas consulta o restante da base. Essa soma recursiva
segue a ideia de `exerciciosanteriores/aula04/ler_somar_n.hs`.

Na opção `5`, registrar `Ana` e `Livro Novo` e responder `S` permite consultar
esse empréstimo nas opções `1`, `2` e `3`. A opção `4` passa a retornar `2`
para Ana. A atualização usa `banco ++ [(pessoa, livro)]` no Haskell e
`banco + [(pessoa, livro)]` no Python, sem alterar a lista recebida.

Na opção `6`, informe a pessoa e o título do livro. A função `devolver`
percorre a base por recursão, preserva os pares anteriores à correspondência
e retorna o restante da lista ao encontrar o empréstimo. Assim, remove
somente um registro por devolução, mesmo se houver pares repetidos.
Empréstimos do mesmo título para outras pessoas são preservados.
Se o par não existir, o menu informa `Emprestimo nao encontrado.`
Após devolver o único livro de Ana, a opção `4` retorna `0` para ela.
