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
subst x n (Var v) = if (x == v) then
                      n 
                    else 
                      (Var v)
subst x n (Lam v t b) = Lam v t (subst x n b)
subst x n (App e1 e2) = App (subst x n e1) (subst x n e2)
subst x n (Add e1 e2) = Add (subst x n e1) (subst x n e2)
subst x n (Sub e1 e2) = Sub (subst x n e1) (subst x n e2) -- adicionado TF
subst x n (Mul e1 e2) = Mul (subst x n e1) (subst x n e2) -- adicionado TF
-- subst x n (Pot e1 e2) = Pot (subst x n e1) (subst x n e2) -- adicionado TF [Abandonado, pois, "No instance for (Floating Int) arising from a use of ‘**’"]
subst x n (And e1 e2) = And (subst x n e1) (subst x n e2)
subst x n (Or e1 e2) = Or (subst x n e1) (subst x n e2) -- adicionado TF
subst x n (Nand e1 e2) = Nand (subst x n e1) (subst x n e2) -- adicionado TF
subst x n (Nor e1 e2) = Nor (subst x n e1) (subst x n e2) -- adicionado TF
subst x n (Xor e1 e2) = Xor (subst x n e1) (subst x n e2) -- adicionado TF
subst x n (Igual e1 e2) = Igual (subst x n e1) (subst x n e2) -- adicionado TF
subst x n (Diferente e1 e2) = Diferente (subst x n e1) (subst x n e2) -- adicionado TF
subst x n (Maior e1 e2) = Maior (subst x n e1) (subst x n e2) -- adicionado TF
subst x n (Maiorigual e1 e2) = Maiorigual (subst x n e1) (subst x n e2) -- adicionado TF
subst x n (Menor e1 e2) = Menor (subst x n e1) (subst x n e2) -- adicionado TF
subst x n (Menorigual e1 e2) = Menorigual (subst x n e1) (subst x n e2) -- adicionado TF
subst x n (If e1 e2 e3) = If (subst x n e1) (subst x n e2) (subst x n e3)
subst x n (Paren e) = Paren (subst x n e)
subst x n (Let v e1 e2) = Let v (subst x n e1) (subst x n e2)
subst x n e = e -- se não encontrar nada, retorna o próprio termo


-- Função que avalia cada passo que a execução deverá realizar
-- Essa função deve ser implementada a partir das regras semântivas definidas
-- Semântica small-step (passo-pequeno): o propósito é descrever a computação com passos individuais 
step :: Expr -> Expr 
step (Add (Num n1) (Num n2)) = Num (n1 + n2)
step (Add (Num n) e) = Add (Num n) (step e)
step (Add e1 e2) = Add (step e1) e2 
step (Mul (Num n1) (Num n2)) = Num (n1 * n2)     -- adicionado [homeWork class 20231117]
step (Mul (Num n) e) = Mul (Num n) (step e)      -- adicionado [homeWork class 20231117]
step (Mul e1 e2) = Mul (step e1) e2              -- adicionado [homeWork class 20231117]
step (Sub (Num n1) (Num n2)) = Num (n1 - n2)     -- adicionado [homeWork class 20231117]
step (Sub (Num n) e) = Sub (Num n) (step e)      -- adicionado [homeWork class 20231117]
step (Sub e1 e2) = Sub (step e1) e2              -- adicionado [homeWork class 20231117]
-- step (Pot (Num n1) (Num n2)) = Num (n1 ** n2)    -- adicionado TF [Abandonado, pois, "No instance for (Floating Int) arising from a use of ‘**’"]
-- step (Pot (Num n) e) = Pot (Num n) (step e)      -- adicionado TF [Abandonado, pois, "No instance for (Floating Int) arising from a use of ‘**’"]
-- step (Pot e1 e2) = Pot (step e1) e2              -- adicionado TF [Abandonado, pois, "No instance for (Floating Int) arising from a use of ‘**’"]
step (And BFalse _) = BFalse 
step (And BTrue e) = e 
step (And e1 e2) = And (step e1) e2 
step (Or BTrue _) = BTrue                        -- adicionado [homeWork class 20231117]
step (Or _ BTrue) = BTrue                        -- adicionado [homeWork class 20231117]
step (Or BFalse BFalse) = BFalse                 -- adicionado [homeWork class 20231117]
step (Or e1 BFalse) = Or (step e1) BFalse         -- adicionado [homeWork class 20231117]
step (Or BFalse e2) = Or BFalse (step e2)          -- adicionado [homeWork class 20231117]
step (Or e1 e2) = Or (step e1) (step e2)
step (Nand BFalse _) = BTrue                                                  -- adicionado TF
step (Nand BTrue BFalse) = BTrue                                              -- adicionado TF
step (Nand BTrue BTrue) = BFalse                                              -- adicionado TF
step (Nand BTrue e) = Nand BTrue (step e)                                     -- adicionado TF
step (Nand e1 BFalse) = Nand (step e1) BFalse                                 -- adicionado TF
step (Nand e1 BTrue) = Nand (step e1) BTrue                                   -- adicionado TF
step (Nand e1 e2) = Nand (step e1) e2                                         -- adicionado TF
step (Nor BTrue _) = BFalse                                                   -- adicionado TF
step (Nor BFalse BFalse) = BTrue                                              -- adicionado TF
step (Nor BFalse BTrue) = BFalse                                              -- adicionado TF
step (Nor BFalse e) = Nor BFalse (step e)                                     -- adicionado TF
step (Nor e BFalse) = Nor (step e) BFalse                                     -- adicionado TF
step (Nor e BTrue) = Nor (step e) BTrue                                       -- adicionado TF
step (Nor e1 e2) = Nor (step e1) (step e2)                                    -- adicionado TF
step (Xor BFalse BFalse) = BFalse                                             -- adicionado TF
step (Xor BTrue BTrue) = BFalse                                               -- adicionado TF
step (Xor BFalse BTrue) = BTrue                                               -- adicionado TF
step (Xor BTrue BFalse) = BTrue                                               -- adicionado TF
step (Xor BTrue e) = Xor BTrue (step e)                                       -- adicionado TF
step (Xor BFalse e) = Xor BFalse (step e)                                     -- adicionado TF
step (Xor e BTrue) = Xor (step e) BTrue                                       -- adicionado TF
step (Xor e BFalse) = Xor (step e) BFalse                                     -- adicionado TF
step (Xor e1 e2) = Xor (step e1) (step e2)                                    -- adicionado TF
step (Igual (Num n1) (Num n2)) = if (n1 == n2) then BTrue else BFalse         -- adicionado TF
step (Igual e1 (Num n)) = Igual (step e1) (Num n)                             -- adicionado TF
step (Igual (Num n) e2) = Igual (Num n) (step e2)                             -- adicionado TF
step (Igual e1 e2) = Igual (step e1) (step e2)                                -- adicionado TF
step (Diferente (Num n1) (Num n2)) = if (n1 /= n2) then BTrue else BFalse     -- adicionado TF
step (Diferente e1 (Num n)) = Diferente (step e1) (Num n)                     -- adicionado TF
step (Diferente (Num n) e2) = Diferente (Num n) (step e2)                     -- adicionado TF
step (Diferente e1 e2) = Diferente (step e1) (step e2)                        -- adicionado TF
step (Maior (Num n1) (Num n2)) = if (n1 > n2) then BTrue else BFalse          -- adicionado TF
step (Maior e1 (Num n)) = Maior (step e1) (Num n)                             -- adicionado TF
step (Maior (Num n) e2) = Maior (Num n) (step e2)                             -- adicionado TF
step (Maior e1 e2) = Maior (step e1) (step e2)                                -- adicionado TF
step (Maiorigual (Num n1) (Num n2)) = if (n1 >= n2) then BTrue else BFalse    -- adicionado TF
step (Maiorigual e1 (Num n)) = Maiorigual (step e1) (Num n)                   -- adicionado TF
step (Maiorigual (Num n) e2) = Maiorigual (Num n) (step e2)                   -- adicionado TF
step (Maiorigual e1 e2) = Maiorigual (step e1) (step e2)                      -- adicionado TF
step (Menor (Num n1) (Num n2)) = if (n1 < n2) then BTrue else BFalse          -- adicionado TF
step (Menor e1 (Num n)) = Menor (step e1) (Num n)                             -- adicionado TF
step (Menor (Num n) e2) = Menor (Num n) (step e2)                             -- adicionado TF
step (Menor e1 e2) = Menor (step e1) (step e2)                                -- adicionado TF
step (Menorigual (Num n1) (Num n2)) = if (n1 <= n2) then BTrue else BFalse    -- adicionado TF
step (Menorigual e1 (Num n)) = Menorigual (step e1) (Num n)                   -- adicionado TF
step (Menorigual (Num n) e2) = Menorigual (Num n) (step e2)                   -- adicionado TF
step (Menorigual e1 e2) = Menorigual (step e1) (step e2)                      -- adicionado TF
step (If BFalse e1 e2) = e2 
step (If BTrue e1 e2) = e1 
step (If e e1 e2) = If (step e) e1 e2 
step (Paren e) = e -- se tem (2), retorna 2; parentesis não causam efeito
step (App (Lam x t b) e2) | isValue e2 = subst x e2 b 
                        | otherwise = (App (Lam x t b) (step e2))
step (App e1 e2) = App (step e1) e2
step (Let v e1 e2) | isValue e1 = subst v e1 e2 
                   | otherwise = Let v (step e1) e2
step e = error (show e)


-- Começa a implementação pelos casos-base (que não tem "seta em cima")
-- Sempre que a seta de cima aparece, se tem uma situação de chamada recursiva 
-- As regras da construção acima estão em CC_-_LP_-_Aula_19, slide "semântica da LP e expressões"

-- função para avaliar 'até o final'


eval :: Expr -> Expr 
eval e | isValue e = e 
       | otherwise = eval (step e)