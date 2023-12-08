module TypeChecker where

import Lexer
import Parser
import Interpreter

type Ctx = [(String,Ty)]

-- Função para realizar a checagem dos tipos de uma expressão 
-- usa maybe no Ty pq pode retornar alguma coisa ou não
-- data Maybe q = Just a | Nothing
typeof :: Ctx -> Expr -> Maybe Ty -- tipo criado no lexer para o tratamento de tipos
typeof ctx BTrue = Just TBool 
typeof ctx BFalse = Just TBool 
typeof ctx (Num _) = Just TNum 
typeof ctx (Add e1 e2) = case (typeof ctx e1, typeof ctx e2) of 
                       (Just TNum, Just TNum) -> Just TNum 
                       _                      -> Nothing -- se um deles não for um TNum, retorna 'erro', vazio; no caso, Nothing
typeof ctx (Mul e1 e2) = case (typeof ctx e1, typeof ctx e2) of    
                       (Just TNum, Just TNum) -> Just TNum         
                       _                      -> Nothing           
typeof ctx (Sub e1 e2) = case (typeof ctx e1, typeof ctx e2) of    
                       (Just TNum, Just TNum) -> Just TNum         
                       _                      -> Nothing           
typeof ctx (And e1 e2) = case (typeof ctx e1, typeof ctx e2) of 
                       (Just TBool, Just TBool) -> Just TBool 
                       _                        -> Nothing
typeof ctx (Or e1 e2) = case (typeof ctx e1, typeof ctx e2) of       
                       (Just TBool, Just TBool) -> Just TBool        
                       _                        -> Nothing           
typeof ctx (Nand e1 e2) = case (typeof ctx e1, typeof ctx e2) of     
                       (Just TBool, Just TBool) -> Just TBool        
                       _                        -> Nothing           
typeof ctx (Nor e1 e2) = case (typeof ctx e1, typeof ctx e2) of      
                       (Just TBool, Just TBool) -> Just TBool        
                       _                        -> Nothing           
typeof ctx (Xor e1 e2) = case (typeof ctx e1, typeof ctx e2) of      
                       (Just TBool, Just TBool) -> Just TBool        
                       _                        -> Nothing           
typeof ctx (Igual e1 e2) = case (typeof ctx e1, typeof ctx e2) of
                       (Just TNum, Just TNum) -> Just TBool 
                       _                      -> Nothing
typeof ctx (Diferente e1 e2) = case (typeof ctx e1, typeof ctx e2) of
                       (Just TNum, Just TNum) -> Just TBool 
                       _                      -> Nothing
typeof ctx (Maior e1 e2) = case (typeof ctx e1, typeof ctx e2) of
                       (Just TNum, Just TNum) -> Just TBool 
                       _                      -> Nothing
typeof ctx (Maiorigual e1 e2) = case (typeof ctx e1, typeof ctx e2) of
                       (Just TNum, Just TNum) -> Just TBool 
                       _                      -> Nothing
typeof ctx (Menor e1 e2) = case (typeof ctx e1, typeof ctx e2) of
                       (Just TNum, Just TNum) -> Just TBool 
                       _                      -> Nothing
typeof ctx (Menorigual e1 e2) = case (typeof ctx e1, typeof ctx e2) of
                       (Just TNum, Just TNum) -> Just TBool 
                       _                      -> Nothing
typeof ctx (Fat e1) = case (typeof ctx e1) of 
                       (Just TNum)            -> Just TNum
                       _                      -> Nothing
typeof ctx (Pot e1 e2) = case (typeof ctx e1, typeof ctx e2) of 
                       (Just TNum, Just TNum) -> Just TNum 
                       _                      -> Nothing
typeof ctx (If e1 e2 e3) = case typeof ctx e1 of 
                         Just TBool -> case (typeof ctx e2, typeof ctx e3) of
                                         (Just t1, Just t2)       -> if (t1 == t2) then -- no if, os dois resultados possíveis tem que ter o mesmo tipo; o if aqui faz isso, testa se os dois tem o mesmo tipo; 
                                                                       Just t1 
                                                                     else 
                                                                       Nothing
                                         _                        -> Nothing
                         _          -> Nothing
typeof ctx (Paren e) = typeof ctx e -- o tipo de um (2) é o tipo de 2
typeof ctx (Var x) = lookup x ctx 
typeof ctx (Lam v t1 b) = let ctx' = (v, t1):ctx 
                            in case typeof ctx' b of 
                                 Just t2 -> Just (TFun t1 t2)
                                 _       -> Nothing
typeof ctx (App e1 e2) = case (typeof ctx e1, typeof ctx e2) of 
                           (Just (TFun t11 t12), Just t2) -> if (t11 == t2) then 
                                                               Just t12
                                                             else 
                                                               Nothing 
                           _  -> Nothing
typeof ctx (Let v e1 e2) = case typeof ctx e1 of 
                             Just t1 -> typeof ((v, t1):ctx) e2 
                             _       -> Nothing 



typecheck :: Expr -> Expr 
typecheck e = case typeof [] e of 
                Just _ -> e 
                _      -> error "Type error!"