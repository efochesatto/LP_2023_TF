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
subst x n (And e1 e2) = And (subst x n e1) (subst x n e2)
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