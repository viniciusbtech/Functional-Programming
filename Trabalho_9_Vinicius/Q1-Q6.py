# Consultas: livros por pessoa e pessoas por livro.

teste = [("Paulo", "A Mente Nova do Rei",),
         ("Ana", "O Segredo de Luiza"),
         ("Paulo", "O Pequeno Principe"),
         ("Mauro", "O Capital"),
         ("Francisco", "O Auto da Compadecida")
         ]


def livros(banco, pessoa):
    # Equivalente a null banco: verifica se a lista esta vazia. -[] True 
    if banco == []:
        return []
    else:
        if banco[0][0] == pessoa:
            return [banco[0][1]] + livros(banco[1:], pessoa)
        else:
            return livros(banco[1:], pessoa)


def pessoas(banco, livro):
    if banco == []:
        return []
    else:
        if banco[0][1] == livro:
            return [banco[0][0]] + pessoas(banco[1:], livro)
        else:
            return pessoas(banco[1:], livro)


def emprestado(banco, livro):
    if banco == []:
        return False
    else:
        if banco[0][1] == livro:
            return True
        else:
            return emprestado(banco[1:], livro)


def quantidadeLivros(banco, pessoa):
    if banco == []:
        return 0
    else:
        if banco[0][0] == pessoa:
            return 1 + quantidadeLivros(banco[1:], pessoa)
        else:
            return quantidadeLivros(banco[1:], pessoa)


def emprestar(banco, pessoa, livro):
    return banco + [(pessoa, livro)]


def devolver(banco, pessoa, livro):
    if banco == []:
        return []
    else:
        if banco[0] == (pessoa, livro):
            return banco[1:]
        else:
            return [banco[0]] + devolver(banco[1:], pessoa, livro)


def continuar(banco):
    resposta = input("Deseja continuar? (S/N)\n")
    if resposta == "s" or resposta == "S":
        menu(banco)
    else:
        print("Programa encerrado.")


def menu(banco):
    print("1 - Consultar livros por pessoa")
    print("2 - Consultar pessoas por livro")
    print("3 - Verificar se um livro esta emprestado")
    print("4 - Consultar quantidade de livros por pessoa")
    print("5 - Registrar emprestimo")
    print("6 - Registrar devolucao")
    print("0 - Sair")
    opcao = input()

    if opcao == "0":
        print("Programa encerrado.")
    elif opcao == "5":
        pessoa = input("Digite o nome da pessoa:\n")
        livro = input("Digite o titulo do livro:\n")
        print("Emprestimo registrado.")
        continuar(emprestar(banco, pessoa, livro))
    elif opcao == "6":
        pessoa = input("Digite o nome da pessoa:\n")
        livro = input("Digite o titulo do livro:\n")
        if devolver(banco, pessoa, livro) == banco:
            print("Emprestimo nao encontrado.")
        else:
            print("Devolucao registrada.")
        continuar(devolver(banco, pessoa, livro))
    else:
        if opcao == "1":
            pessoa = input("Digite o nome da pessoa:\n")
            print("Livros emprestados:")
            print(livros(banco, pessoa))
        elif opcao == "2":
            livro = input("Digite o titulo do livro:\n")
            print("Pessoas que tomaram o livro emprestado:")
            print(pessoas(banco, livro))
        elif opcao == "3":
            livro = input("Digite o titulo do livro:\n")
            if emprestado(banco, livro):
                print("O livro esta emprestado.")
            else:
                print("O livro nao esta emprestado.")
        elif opcao == "4":
            pessoa = input("Digite o nome da pessoa:\n")
            print("Quantidade de livros emprestados:")
            print(quantidadeLivros(banco, pessoa))
        else:
            print("Opcao invalida.")

        continuar(banco)


def main():
    menu(teste)


if __name__ == "__main__":
    main()
