def calcular_imc(peso, altura):
    return peso / (altura * altura)

def main():
    print("=== Calculadora de IMC ===")

    peso = float(input("Digite seu peso (kg): "))
    altura = float(input("Digite sua altura (ex:1.75): "))

    print()

    # Mostra o IMC direto na função
    print(f"Seu Imc e: {calcular_imc(peso, altura):.2f}")

    # Mostra a classificação direto no print, sem criar variável (igualzinho no Haskell)
    if calcular_imc(peso, altura) < 18.5:
        print("Desnutrição")
    elif calcular_imc(peso, altura) <= 25.9:
        print("Eutofria")
    elif calcular_imc(peso, altura) < 29.9:
        print("Sobrepeso")
    else:
        print("Obesidade")
    
if __name__ == "__main__":
    main()