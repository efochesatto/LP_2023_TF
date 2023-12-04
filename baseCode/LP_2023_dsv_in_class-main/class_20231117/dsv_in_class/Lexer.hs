module Lexer where

import Data.Char

data Expr = BTrue
          | BFalse
          | Num Int
          | Add Expr Expr
          | And Expr Expr
          | If Expr Expr Expr
    deriving Show


-- adicionando para o tratamento de tipo
data Ty = TBool
        | TNum
        deriving (Show, Eq) -- para poder tratar a igualdade do tipo também 

-- definição dos tokens válidos para a linguagem 
data Token = TokenTrue
           | TokenFalse
           | TokenNum Int
           | TokenAdd
           | TokenAnd
           | TokenIf
           | TokenThen
           | TokenElse
           deriving (Show, Eq)

-- isSpace do Haskell, assim como isDigit e isAlpha também são
-- elem indica se um determinado caracter existe em uma lista 
isSymb :: Char -> Bool
isSymb c = c `elem` "+&"

lexer :: String -> [Token]
lexer [] = []
lexer (c:cs) | isSpace c = lexer cs
             | isDigit c = lexNum(c:cs)
             | isSymb c = lexSymbol(c:cs)
             | isAlpha c = lexKW (c:cs)
lexer _ =  error "Lexical error"

-- o span faz tipo um loop, no caso abaixo, ele lê enquanto for dígito; quando encontrar um elemento diferente de digit, coloca no rest
lexNum :: String -> [Token]
lexNum cs = case span isDigit cs of 
              (num, rest) -> TokenNum (read num) : lexer rest
              -- divide em num e rest; read serve para converter para int
              -- TokenNum é a 'saída', porque este foi o nome definido em data Token

lexSymbol :: String -> [Token]
lexSymbol cs = case span isSymbol cs of 
                ("+", rest)  -> TokenAdd : lexer rest
                ("&&", rest) -> TokenAnd : lexer rest
                _            -> error "Lexical error: invalid symbol"


lexKW :: String -> [Token]
lexKW cs = case span isAlpha cs of
         ("true", rest)  -> TokenTrue : lexer rest
         ("false", rest) -> TokenFalse : lexer rest
         ("if", rest)    -> TokenIf : lexer rest
         ("then", rest)  -> TokenThen : lexer rest
         ("else", rest)  -> TokenElse : lexer rest
         _               -> error "Lexical error: invalid keyword"  

