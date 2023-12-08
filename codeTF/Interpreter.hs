module Interpreter where 

import Lexer 
import Parser

isValue :: Expr -> Bool 
isValue BTrue = True 
isValue BFalse = True
isValue (Num _) = True 
isValue (Lam _ _ _) = True
isValue _ = False 

--  função de substituição
-- no primeiro caso abaixo x é a variável que quero substituir; o que irá substituir o x; primeiro caso é se eu tiver apenas uma variável v; quero substituir n por x, se v for do tipo x; 
subst :: String -> Expr -> Expr -> Expr 
subst x n (Var v) = if (x == v) then n else (Var v)
subst x n (Lam v t b) = Lam v t (subst x n b)
subst x n (App e1 e2) = App (subst x n e1) (subst x n e2)
subst x n (Add e1 e2) = Add (subst x n e1) (subst x n e2)
subst x n (Sub e1 e2) = Sub (subst x n e1) (subst x n e2)  
subst x n (Mul e1 e2) = Mul (subst x n e1) (subst x n e2)  
subst x n (And e1 e2) = And (subst x n e1) (subst x n e2)
subst x n (Or e1 e2) = Or (subst x n e1) (subst x n e2)  
subst x n (Nand e1 e2) = Nand (subst x n e1) (subst x n e2)  
subst x n (Nor e1 e2) = Nor (subst x n e1) (subst x n e2)  
subst x n (Xor e1 e2) = Xor (subst x n e1) (subst x n e2)  
subst x n (Igual e1 e2) = Igual (subst x n e1) (subst x n e2)  
subst x n (Diferente e1 e2) = Diferente (subst x n e1) (subst x n e2)  
subst x n (Maior e1 e2) = Maior (subst x n e1) (subst x n e2)  
subst x n (Maiorigual e1 e2) = Maiorigual (subst x n e1) (subst x n e2)  
subst x n (Menor e1 e2) = Menor (subst x n e1) (subst x n e2)  
subst x n (Menorigual e1 e2) = Menorigual (subst x n e1) (subst x n e2) 

-- ################# quando é somente para 1
subst x n (Fat e1) = Fat (subst x n e1) 
subst x n (Pot e1 e2) = Pot (subst x n e1) (subst x n e2)  
subst x n (If e1 e2 e3) = If (subst x n e1) (subst x n e2) (subst x n e3)
subst x n (Paren e) = Paren (subst x n e)
subst x n (Let v e1 e2) = Let v (subst x n e1) (subst x n e2)
subst x n e = e


-- Função que avalia cada passo que a execução deverá realizar
-- Essa função deve ser implementada a partir das regras semântivas definidas
-- Semântica small-step (passo-pequeno): o propósito é descrever a computação com passos individuais 
step :: Expr -> Expr 
step (Add (Num n1) (Num n2)) = Num (n1 + n2)
step (Add (Num n) e) = Add (Num n) (step e)
step (Add e1 e2) = Add (step e1) e2 
step (Mul (Num n1) (Num n2)) = Num (n1 * n2)
step (Mul (Num n) e) = Mul (Num n) (step e) 
step (Mul e1 e2) = Mul (step e1) e2         
step (Sub (Num n1) (Num n2)) = Num (n1 - n2)
step (Sub (Num n) e) = Sub (Num n) (step e) 
step (Sub e1 e2) = Sub (step e1) e2         
step (And BFalse _) = BFalse 
step (And BTrue e) = e 
step (And e1 e2) = And (step e1) e2 
step (Or BTrue _) = BTrue                
step (Or _ BTrue) = BTrue                
step (Or BFalse BFalse) = BFalse         
step (Or e1 BFalse) = Or (step e1) BFalse
step (Or BFalse e2) = Or BFalse (step e2)
step (Or e1 e2) = Or (step e1) (step e2)
step (Nand BFalse _) = BTrue                                                  
step (Nand BTrue BFalse) = BTrue                                              
step (Nand BTrue BTrue) = BFalse                                              
step (Nand BTrue e) = Nand BTrue (step e)                                     
step (Nand e1 BFalse) = Nand (step e1) BFalse                                 
step (Nand e1 BTrue) = Nand (step e1) BTrue                                   
step (Nand e1 e2) = Nand (step e1) e2                                         
step (Nor BTrue _) = BFalse                                                   
step (Nor BFalse BFalse) = BTrue                                              
step (Nor BFalse BTrue) = BFalse                                              
step (Nor BFalse e) = Nor BFalse (step e)                                     
step (Nor e BFalse) = Nor (step e) BFalse                                     
step (Nor e BTrue) = Nor (step e) BTrue                                       
step (Nor e1 e2) = Nor (step e1) (step e2)                                    
step (Xor BFalse BFalse) = BFalse                                             
step (Xor BTrue BTrue) = BFalse                                               
step (Xor BFalse BTrue) = BTrue                                               
step (Xor BTrue BFalse) = BTrue                                               
step (Xor BTrue e) = Xor BTrue (step e)                                       
step (Xor BFalse e) = Xor BFalse (step e)                                     
step (Xor e BTrue) = Xor (step e) BTrue                                       
step (Xor e BFalse) = Xor (step e) BFalse                                     
step (Xor e1 e2) = Xor (step e1) (step e2)                                    
step (Igual (Num n1) (Num n2)) = if (n1 == n2) then BTrue else BFalse         
step (Igual e1 (Num n)) = Igual (step e1) (Num n)                             
step (Igual (Num n) e2) = Igual (Num n) (step e2)                             
step (Igual e1 e2) = Igual (step e1) (step e2)                                
step (Diferente (Num n1) (Num n2)) = if (n1 /= n2) then BTrue else BFalse     
step (Diferente e1 (Num n)) = Diferente (step e1) (Num n)                     
step (Diferente (Num n) e2) = Diferente (Num n) (step e2)                     
step (Diferente e1 e2) = Diferente (step e1) (step e2)                        
step (Maior (Num n1) (Num n2)) = if (n1 > n2) then BTrue else BFalse          
step (Maior e1 (Num n)) = Maior (step e1) (Num n)                             
step (Maior (Num n) e2) = Maior (Num n) (step e2)                             
step (Maior e1 e2) = Maior (step e1) (step e2)                                
step (Maiorigual (Num n1) (Num n2)) = if (n1 >= n2) then BTrue else BFalse    
step (Maiorigual e1 (Num n)) = Maiorigual (step e1) (Num n)                   
step (Maiorigual (Num n) e2) = Maiorigual (Num n) (step e2)                   
step (Maiorigual e1 e2) = Maiorigual (step e1) (step e2)                      
step (Menor (Num n1) (Num n2)) = if (n1 < n2) then BTrue else BFalse          
step (Menor e1 (Num n)) = Menor (step e1) (Num n)                             
step (Menor (Num n) e2) = Menor (Num n) (step e2)                             
step (Menor e1 e2) = Menor (step e1) (step e2)                                
step (Menorigual (Num n1) (Num n2)) = if (n1 <= n2) then BTrue else BFalse    
step (Menorigual e1 (Num n)) = Menorigual (step e1) (Num n)                   
step (Menorigual (Num n) e2) = Menorigual (Num n) (step e2)                   
step (Menorigual e1 e2) = Menorigual (step e1) (step e2)
step (Fat (Num n)) = Num (fatorial n)
step (Fat e) = Fat (step e)
step (Pot (Num n1) (Num n2)) = Num (potencia n1 n2)
step (Pot e (Num n1)) = Pot (step e) (Num n1)
step (Pot (Num n1) e) = Pot (Num n1) (step e)
step (Pot e1 e2) = Pot (step e1) (step e2)
step (If BFalse e1 e2) = e2 
step (If BTrue e1 e2) = e1 
step (If e e1 e2) = If (step e) e1 e2
step (Paren e) = e
step (App (Lam x t b) e2) | isValue e2 = subst x e2 b 
                          | otherwise = (App (Lam x t b) (step e2))
step (App e1 e2) = App (step e1) e2
step (Let v e1 e2) | isValue e1 = subst v e1 e2 
                   | otherwise = Let v (step e1) e2
step e = error (show e)


fatorial :: Int -> Int
fatorial 0 = 1
fatorial n = n * (fatorial (n-1)) 


potencia :: Int -> Int -> Int
potencia a 0 = 1
potencia a b = a * (potencia a (b-1))


eval :: Expr -> Expr 
eval e | isValue e = e 
       | otherwise = eval (step e)
