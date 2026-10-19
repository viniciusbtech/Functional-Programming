# Biblioteca estendida: limite, palavras-chave e datas.
# Datas validas no formato AAAAMMDD, por exemplo: 20261019.
limiteLivros = 3

catalogo = [("A Mente Nova do Rei", ["ciencia", "mente"]),
            ("O Segredo de Luiza", ["negocios", "empreendedorismo"]),
            ("O Pequeno Principe", ["literatura", "amizade"]),
            ("O Capital", ["economia", "politica"]),
            ("O Auto da Compadecida", ["literatura", "teatro"])]

# Cada registro: ((pessoa, livro), (data do emprestimo, data limite)).
teste = [(("Paulo", "A Mente Nova do Rei"), (20261001, 20261025)),
         (("Ana", "O Segredo de Luiza"), (20261001, 20261010)),
         (("Paulo", "O Pequeno Principe"), (20261005, 20261019)),
         (("Mauro", "O Capital"), (20261002, 20261015)),
         (("Francisco", "O Auto da Compadecida"), (20261010, 20261030))]


# Auxiliar da Q7: contar os emprestimos da pessoa.
def quantidadeLivros(banco, pessoa):
    if banco == []:
        return 0
    else:
        if banco[0][0][0] == pessoa:
            return 1 + quantidadeLivros(banco[1:], pessoa)
        else:
            return quantidadeLivros(banco[1:], pessoa)


def existeLivro(acervo, livro):
    if acervo == []:
        return False
    else:
        if acervo[0][0] == livro:
            return True
        else:
            return existeLivro(acervo[1:], livro)


# Q7: impedir novos emprestimos quando o limite for atingido.
def emprestar(banco, pessoa, livro, retirada, prazo):
    if quantidadeLivros(banco, pessoa) >= limiteLivros:
        return banco
    else:
        if existeLivro(catalogo, livro):
            if retirada > 0 and prazo >= retirada:
                return banco + [((pessoa, livro), (retirada, prazo))]
            else:
                return banco
        else:
            return banco


# Q8: procurar a palavra na lista associada a cada titulo.
def temPalavra(palavras, palavra):
    if palavras == []:
        return False
    else:
        if palavras[0] == palavra:
            return True
        else:
            return temPalavra(palavras[1:], palavra)


def livrosPorPalavra(acervo, palavra):
    if acervo == []:
        return []
    else:
        if temPalavra(acervo[0][1], palavra):
            return [acervo[0][0]] + livrosPorPalavra(acervo[1:], palavra)
        else:
            return livrosPorPalavra(acervo[1:], palavra)


# Q9: o vencimento no proprio dia ainda nao esta atrasado.
def emprestimosVencidos(banco, referencia):
    if banco == []:
        return []
    else:
        if banco[0][1][1] < referencia:
            return [banco[0]] + emprestimosVencidos(banco[1:], referencia)
        else:
            return emprestimosVencidos(banco[1:], referencia)


def continuar(banco):
    resposta = input("Deseja continuar? (S/N)\n")
    if resposta == "s" or resposta == "S":
        menu(banco)
    else:
        print("Programa encerrado.")


def registrarEmprestimo(banco):
    pessoa = input("Digite o nome da pessoa:\n")
    if quantidadeLivros(banco, pessoa) >= limiteLivros:
        print("Limite de livros atingido.")
        continuar(banco)
    else:
        livro = input("Digite o titulo do livro:\n")
        if existeLivro(catalogo, livro):
            retirada = int(input("Digite a data do emprestimo (AAAAMMDD):\n"))
            prazo = int(input("Digite a data limite de devolucao (AAAAMMDD):\n"))
            if retirada > 0 and prazo >= retirada:
                print("Emprestimo registrado.")
                continuar(emprestar(banco, pessoa, livro, retirada, prazo))
            else:
                print("Periodo invalido: a data limite deve ser igual ou posterior a retirada.")
                continuar(banco)
        else:
            print("Livro nao encontrado no catalogo.")
            continuar(banco)


def menu(banco):
    print("7 - Registrar emprestimo respeitando o limite")
    print("8 - Buscar livros por palavra-chave")
    print("9 - Consultar emprestimos vencidos")
    print("Limite por pessoa: " + str(limiteLivros))
    opcao = input()
    if opcao == "7":
        registrarEmprestimo(banco)
    else:
        if opcao == "8":
            palavra = input("Digite a palavra-chave (exemplo: literatura):\n")
            print(livrosPorPalavra(catalogo, palavra))
        elif opcao == "9":
            referencia = int(input("Digite a data de referencia (AAAAMMDD):\n"))
            print("Resultado: ((pessoa, livro), (retirada, data limite))")
            print(emprestimosVencidos(banco, referencia))
        else:
            print("Opcao invalida.")
        continuar(banco)


def main():
    menu(teste)


if __name__ == "__main__":
    main()
