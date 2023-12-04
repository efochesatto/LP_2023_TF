module Lexer where 

import Data.Char 


-- Criando expressões que poderão ser aceitas 
-- Representação da árvore de sintaxe abstrata (AST)
data Expr = BTrue
          | BFalse 
          | Num Int 
          | Add Expr Expr
          | Mul Expr Expr -- adicionado [homeWork class 20231117]
          | Sub Expr Expr -- adicionado [homeWork class 20231117] 
          | And Expr Expr 
          | Or Expr Expr -- adicionado [homeWork class 20231117]
          | If Expr Expr Expr 
          deriving Show

-- Utilizado em TypeChecker.hs para verificar a validade dos tipos de uma expressão
data Ty = TBool 
        | TNum 
        deriving (Show, Eq)

-- Tipo de dado ("Token") criado para etapa de identificação/geração de tokens
data Token = TokenTrue 
           | TokenFalse 
           | TokenNum Int 
           | TokenAdd
           | TokenMul -- adicionado [homeWork class 20231117]
           | TokenSub -- adicionado [homeWork class 20231117]
           | TokenAnd
           | TokenOr -- adicionado [homeWork class 20231117] 
           | TokenIf 
           | TokenThen 
           | TokenElse
           deriving (Show, Eq)

-- 
isSymb :: Char -> Bool 
isSymb c = c `elem` "+&|-*" -- adicionados símbolos |-* [homeWork class 20231117]

-- 
lexer :: String -> [Token]
lexer [] = [] 
lexer (c:cs) | isSpace c = lexer cs 
             | isDigit c = lexNum (c:cs)
             | isSymb c = lexSymbol (c:cs)
             | isAlpha c = lexKW (c:cs)

-- 
lexNum :: String -> [Token]
lexNum cs = case span isDigit cs of 
              (num, rest) -> TokenNum (read num) : lexer rest

-- 
lexSymbol :: String -> [Token]
lexSymbol cs = case span isSymb cs of 
                 ("+", rest) -> TokenAdd : lexer rest 
                 ("&&", rest) -> TokenAnd : lexer rest
                 ("*", rest) -> TokenMul : lexer rest -- adicionado [homeWork class 20231117]
                 ("-", rest) -> TokenSub : lexer rest -- adicionado [homeWork class 20231117]
                 ("||", rest) -> TokenOr : lexer rest -- adicionado [homeWork class 20231117]
                 _ -> error "Lexical error: invalid symbol!"

-- 
lexKW :: String -> [Token]
lexKW cs = case span isAlpha cs of 
             ("true", rest) -> TokenTrue : lexer rest 
             ("false", rest) -> TokenFalse : lexer rest
             ("if", rest) -> TokenIf : lexer rest 
             ("then", rest) -> TokenThen : lexer rest 
             ("else", rest) -> TokenElse : lexer rest 
             _ -> error "Lexical error: invalid keyword!"