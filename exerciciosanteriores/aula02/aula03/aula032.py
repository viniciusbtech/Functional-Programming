# Equivalente à função ageCalculator (retorna o número recebido)
def age_calculator(n: int) -> int:
    return n

def main() -> None:
    numero = int(input("Me de sua idade\n"))

    if age_calculator(numero) < 0:
        print("idade invalida")
    elif age_calculator(numero) < 18:
        print("sala 1")
    elif age_calculator(numero) < 60:
        print("sala 2")
    else:
        print("sala 3")

if __name__ == "__main__":
    main()