module TipeChecker where

import Lexer
import Parser
import Interpreter

-- usa maybe no Ty pq pode retornar alguma coisa ou não
-- data Maybe q = Just a | Nothing
typeof :: Expr -> Maybe Ty -- tipo criado no lexer para o tratamento de tipos
typeof BTrue = Just TBool
typeof BFalse = Just TBool
typeof (Num _) = Just TNum
typeof (Add e1 e2) = case (typeof e1, typeof e2) of
                       (Just TNum, Just TNum) -> Just TNum
                       _                      -> Nothing -- se um deles não for um TNum, retorna 'erro', vazio; no caso, Nothing
typeof (And e1 e2) = case (typeof e1, typeof e2) of 
                      (Just TBool, Just TBool) -> Just TBool 
                      _                        -> Nothing
typeof (If e1 e2 e3) = case (typeof e1) of 
                        Just TBool -> case (typeof e2, typeof e3) of 
                                        (Just t1, Just t2)  -> if (t1 == t2) then 
                                                                 Just t1
                                                               else 
                                                                 Nothing
                                        _                   -> Nothing
                        _          -> Nothing 

typecheck :: Expr -> Expr
typecheck e = case typeof e of 
               Just _ -> e
               _      -> error "Type error!"