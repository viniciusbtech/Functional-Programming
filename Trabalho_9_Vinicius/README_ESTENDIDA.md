# Biblioteca estendida — questões 7, 8 e 9

Arquivos independentes da versão básica:

- `BibliotecaEstendida.hs`
- `biblioteca_estendida.py`

## Executar na pasta do projeto

```text
runghc Trabalho_9_Vinicius/BibliotecaEstendida.hs
python Trabalho_9_Vinicius/biblioteca_estendida.py
```

## Estrutura e conteúdo das aulas

A implementação mantém recursão, condicionais, concatenação, listas e tuplas,
usando `null`, `head`, `tail`, `fst` e `snd`, apresentados em `aulas.md`.
As funções verificam listas vazias antes de acessar cabeça e cauda.
Não utiliza `map`, `filter`, lambdas, laços imperativos, `let` ou `where`.
O Python acompanha a estrutura do Haskell com índices e fatiamento.

O catálogo associa cada título a suas palavras-chave:

```text
("O Pequeno Principe", ["literatura", "amizade"])
```

O empréstimo passa a ser um par de pares:

```text
(("Ana", "O Segredo de Luiza"), (20261001, 20261010))
```

O primeiro par contém pessoa e livro; o segundo, data de retirada e data limite.
Por exemplo, `snd (snd emprestimo)` seleciona o prazo de devolução.
O catálogo é separado dos empréstimos. As duas versões começam com os mesmos dados.

## Q7 — Limite por pessoa

`limiteLivros` vale `3` nas duas versões e pode ser ajustado nesse ponto.
A função `emprestar` usa `quantidadeLivros` antes de acrescentar um registro.
Se a pessoa já atingiu o limite, retorna a base recebida, sem novo empréstimo.
O menu também informa o bloqueio. A contagem é uma função auxiliar da Q7.

Só é possível registrar títulos do catálogo, para que todo livro registrado
tenha palavras-chave. Não há controle de exemplares: o mesmo título pode
aparecer em mais de um empréstimo, como na versão básica.

## Q8 — Palavras-chave

`temPalavra` percorre a lista de palavras recursivamente.
`livrosPorPalavra` consulta todo o catálogo, incluindo títulos emprestados.
A comparação é exata, respeitando maiúsculas e minúsculas.
Na opção `8`, pesquisar `literatura` retorna `O Pequeno Principe` e
`O Auto da Compadecida`. Uma palavra ausente retorna `[]`.
O catálogo inicial é fixo; seus títulos e palavras podem ser editados nos dados.

## Q9 — Datas e atrasos

As datas são números inteiros no formato **AAAAMMDD**, com ano de quatro
dígitos, mês e dia de dois dígitos. Exemplo: 19/10/2026 é `20261019`.
Para datas válidas nesse formato, a comparação numérica segue a ordem do calendário,
inclusive entre meses e anos. Não se somam números para calcular prazos.

Na opção `7`, o usuário informa retirada e data limite, sem prazo fixo em dias.
A retirada deve ser positiva e o prazo não pode ser anterior à retirada.
**Informe datas reais e números nesse formato:** a implementação não valida
o calendário (quantidade de dias de cada mês, ano bissexto) nem trata texto
onde se espera um número, seguindo a leitura numérica simples das aulas.

Na opção `9`, o usuário informa a data de referência; o programa não consulta
o relógio do computador. `emprestimosVencidos` retorna os registros cuja
data limite é menor que a referência. No próprio dia do vencimento, não há atraso.
O resultado mostra pessoa, título, retirada e prazo, para identificar cada empréstimo.
Na base inicial, para `20261019`, aparecem os empréstimos de Ana e Mauro.
O de Paulo com prazo `20261019` só aparece a partir de `20261020`.

## Menu e atualização da base

O menu contém somente as três questões:

```text
7 - Registrar emprestimo respeitando o limite
8 - Buscar livros por palavra-chave
9 - Consultar emprestimos vencidos
```

`S` ou `s` em `Deseja continuar?` repete o menu por recursão.
Outra resposta encerra. Não há outras opções de exercícios no menu.

`main` inicia `menu teste`. `continuar` repassa a base atualizada após um
empréstimo registrado na Q7, que também passa a ser considerado pela Q9.
As atualizações duram apenas durante a execução. As questões 1 a 6 não fazem
parte destes arquivos. Os arquivos da versão básica permanecem intactos.
