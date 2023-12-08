module TypeChecker where 

import Lexer 


-- Função para realizar a checagem dos tipos de uma expressão 
typeof :: Expr -> Maybe Ty 
typeof BTrue = Just TBool 
typeof BFalse = Just TBool 
typeof (Num _) = Just TNum 
typeof (Add e1 e2) = case (typeof e1, typeof e2) of 
                       (Just TNum, Just TNum) -> Just TNum 
                       _                      -> Nothing
typeof (Mul e1 e2) = case (typeof e1, typeof e2) of               -- adicionado [homeWork class 20231117]
                       (Just TNum, Just TNum) -> Just TNum        -- adicionado [homeWork class 20231117]
                       _                      -> Nothing          -- adicionado [homeWork class 20231117]
typeof (Sub e1 e2) = case (typeof e1, typeof e2) of               -- adicionado [homeWork class 20231117]
                       (Just TNum, Just TNum) -> Just TNum        -- adicionado [homeWork class 20231117]
                       _                      -> Nothing          -- adicionado [homeWork class 20231117]
typeof (And e1 e2) = case (typeof e1, typeof e2) of 
                       (Just TBool, Just TBool) -> Just TBool 
                       _                        -> Nothing
typeof (Or e1 e2) = case (typeof e1, typeof e2) of                  -- adicionado [homeWork class 20231117]
                       (Just TBool, Just TBool) -> Just TBool       -- adicionado [homeWork class 20231117]
                       _                        -> Nothing          -- adicionado [homeWork class 20231117]
typeof (If e1 e2 e3) = case typeof e1 of 
                         Just TBool -> case (typeof e2, typeof e3) of
                                         (Just t1, Just t2)       -> if (t1 == t2) then  -- no if, os dois resultados possíveis tem que ter o mesmo tipo; o if aqui faz isso, testa se os dois tem o mesmo tipo; 
                                                                       Just t1 
                                                                     else 
                                                                       Nothing
                                         _                        -> Nothing
                         _          -> Nothing
typeof (Paren e) = typeof e -- o tipo de um (2) é o tipo de 2



typecheck :: Expr -> Expr 
typecheck e = case typeof e of 
                Just _ -> e 
                _      -> error "Type error!"