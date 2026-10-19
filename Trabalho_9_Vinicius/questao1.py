# Consultas: livros por pessoa e pessoas por livro.

teste = [("Paulo", "A Mente Nova do Rei",),
         ("Ana", "O Segredo de Luiza"),
         ("Paulo", "O Pequeno Principe"),
         ("Mauro", "O Capital"),
         ("Francisco", "O Auto da Compadecida"),
         ("Paulo", "O Segredo de Luiza")]


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


def main():
    print("1 - Consultar livros por pessoa")
    print("2 - Consultar pessoas por livro")
    print("3 - Verificar se um livro esta emprestado")
    print("0 - Sair")
    opcao = input()

    if opcao == "0":
        print("Programa encerrado.")
    else:
        if opcao == "1":
            pessoa = input("Digite o nome da pessoa:\n")
            print("Livros emprestados:")
            print(livros(teste, pessoa))
        elif opcao == "2":
            livro = input("Digite o titulo do livro:\n")
            print("Pessoas que tomaram o livro emprestado:")
            print(pessoas(teste, livro))
        elif opcao == "3":
            livro = input("Digite o titulo do livro:\n")
            if emprestado(teste, livro):
                print("O livro esta emprestado.")
            else:
                print("O livro nao esta emprestado.")
        else:
            print("Opcao invalida.")

        resposta = input("Deseja continuar? (S/N)\n")
        if resposta == "s" or resposta == "S":
            main()
        else:
            print("Programa encerrado.")


if __name__ == "__main__":
    main()
