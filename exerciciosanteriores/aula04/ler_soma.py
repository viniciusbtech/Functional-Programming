def soma_ate(n):
    if n <= 0:
        return 0
    else:
        return n + soma_ate(n - 1)


def main():
    print("=== soma dos n naturais ===")
    number = int(input())
    print(f"Soma:{soma_ate(number)}")


if __name__ == "__main__":
    main()