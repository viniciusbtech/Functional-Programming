# comanda para ler produtos
# tem que ler os produtos
# ele quer receber o número de produtos
# e ele vai digitar os valores


def lerValores(quantidade, total):

    if quantidade == 0:
        return total

    print("Digite o valor do produto:")
    valor = float(input())

    return lerValores(quantidade - 1, total + valor)


def main():

    resposta = input("Deseja processar uma comanda? (S/N)")

    if resposta == "S":

        quantidade = int(input("Digite a quantidade de itens:"))

        print("Total da comanda")
        print(lerValores(quantidade, 0))

        main()

    else:

        print("Expediente encerrado.")


main()