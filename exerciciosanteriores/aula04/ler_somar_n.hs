import Text.Printf (printf)

somaAte :: Int -> Int 
somaAte n
    | n <= 0 = 0
    | otherwise = n + somaAte (n -1)

main :: IO()
main = do 
    putStrLn "=== soma dos n naturais ==="
    number <- readLn :: IO Int 
    printf"Soma:%d\n"(somaAte number)


