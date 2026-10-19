def ehpar(numero):
    if numero %2 ==0:
        return True
    else:
        False  
    

def main():
    numero=int(input("ME de o numero"))
    if ehpar(numero):
        print("Par")
    else:
        print("Impar")

if __name__ == "__main__":
    main()