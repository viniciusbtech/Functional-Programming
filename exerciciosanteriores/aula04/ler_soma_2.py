def soma_n_lidos_acc(n: int, acumulador: int) -> int:
    if n <= 0:
        return acumulador
    else:
        valor = int(input())
        # Passa o n decrescido e atualiza o acumulador somando o valor digitado
        return soma_n_lidos_acc(n - 1, acumulador + valor)

def main():
    print("=== Soma de n numeros lidos ===")
    n = int(input("Digite quantos numeros deseja somar (n): "))
    
    print("Agora digite os numeros:")
    
    # Chama a função direto dentro do print (equivalente ao >>= do Haskell)
    print(f"Soma: {soma_n_lidos_acc(n, 0)}")

if __name__ == "__main__":
    main()