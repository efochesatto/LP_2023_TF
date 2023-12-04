module Interpreter where 

import Lexer 
import Parser

isValue :: Expr -> Bool 
isValue BTrue = True 
isValue BFalse = True
isValue (Num _) = True 
isValue _ = False 

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
step (And BFalse _) = BFalse 
step (And BTrue e) = e 
step (And e1 e2) = And (step e1) e2 
step (Or BTrue _) = BTrue                        -- adicionado [homeWork class 20231117]
step (Or _ BTrue) = BTrue                        -- adicionado [homeWork class 20231117]
step (Or BFalse BFalse) = BFalse                 -- adicionado [homeWork class 20231117]
step (Or e1 e2) = Or (step e1) e2                -- adicionado [homeWork class 20231117]
step (If BFalse e1 e2) = e2 
step (If BTrue e1 e2) = e1 
step (If e e1 e2) = If (step e) e1 e2 
step (Paren e) = e -- se tem (2), retorna 2; parentesis não causam efeito
step e = e 

eval :: Expr -> Expr 
eval e | isValue e = e 
       | otherwise = eval (step e) 