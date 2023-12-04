module Interpreter where

import Lexer
import Parser

isValue :: Expr -> Bool
isValue BTrue = True
isValue BFalse = True
isValue (Num _) = True
isValue _ = False

step :: Expr -> Expr
step (Add (Num n1) (Num n2)) = Num (n1 + n2)
step (Add (Num n) e) = Add (Num n) (step e)
step (Add e1 e2) = Add (step e1) e2
step (And BFalse _) = BFalse
step (And BTrue e) = e
step (And e1 e2) = And (step e1) e2
step (If BFalse e1 e2) = e2
step (If BTrue e1 e2) = e1
step (If e e1 e2) = If (step e) e1 e2
step e = e

-- Começa a implementação pelos casos-base (que não tem "seta em cima")
-- Sempre que a seta de cima aparece, se tem uma situação de chamada recursiva 
-- As regras da construção acima estão em CC_-_LP_-_Aula_19, slide "semântica da LP e expressões"

-- função para avaliar 'até o final'
eval :: Expr -> Expr
eval e | isValue e = e
       | otherwise = eval (step e)