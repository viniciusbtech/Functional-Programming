import GHC.Exts.Heap (GenClosure(FloatClosure))
import Text.Printf (printf)

calcularImc :: Float -> Float -> Float
calcularImc peso altura = peso / (altura * altura)

main :: IO()
main = do 
    putStrLn "=== Calculadora de IMC ==="

    putStr "Digite seu peso (kg): "
    peso <- readLn :: IO Float 

    putStr "Digite sua altura (ex:1.75):"
    altura <- readLn :: IO Float 

    putStrLn ""

    -- Trocamos o '$' por parênteses envolvendo todo o argumento
    printf"IMC:%.2f\n"(calcularImc peso altura)

    if calcularImc peso altura < 18.5
        then putStrLn"Desnutrição"
    else if calcularImc peso altura <= 25.9
        then putStrLn"Eutofria"
    else if calcularImc peso altura < 29.9
        then putStrLn"Sobrepeso"
    else putStrLn"Obsidade"
        

