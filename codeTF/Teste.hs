module Teste where 

fatorial :: Int -> Int 
fatorial 0 = 1
fatorial n = n * (fatorial (n-1)) 

potencia :: Int -> Int -> Int
potencia a 0 = 1
potencia a b = a * (potencia a (b-1))