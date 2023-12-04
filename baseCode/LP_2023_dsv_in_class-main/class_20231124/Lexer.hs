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
          | Var String                  -- referente ao cálculo lambda
          | Lam String Expr             -- referente ao cálculo lambda
          | App Expr Expr               -- referente ao cálculo lambda
          | Paren Expr 
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
           | TokenVar String -- referente ao cálculo lambda
           | TokenLam -- referente ao cálculo lambda
           | TokenArrow -- referente ao cálculo lambda
           | TokenLParen -- referente ao cálculo lambda
           | TokenRParen -- referente ao cálculo lambda
           deriving (Show, Eq)

-- 
isSymb :: Char -> Bool 
isSymb c = c `elem` "+&|-*\\->()" -- adicionados símbolos |-* [homeWork class 20231117]
-- tem que colocar \\ porque \ em haskell tbm é scape
-- -> é o símbolo de TokenArrow e \ de TokenLamb
-- 
lexer :: String -> [Token]
lexer [] = [] 
lexer ('(':cs) = TokenLParen : lexer cs -- tirado do lexSymbol para não dar erro quando tem outro símbolo junto 
lexer (')':cs) = TokenRParen : lexer cs
lexer (c:cs) | isSpace c = lexer cs 
             | isDigit c = lexNum (c:cs)
             | isSymb c = lexSymbol (c:cs) -- isSymbol não existe no haskell nativamente, então se desenvolveu a função isSymbol acima; se for um símbolo, aí chama a lexSymbol; 
             | isAlpha c = lexKW (c:cs) -- serve para palavras-chave

-- 
lexNum :: String -> [Token]
lexNum cs = case span isDigit cs of 
              (num, rest) -> TokenNum (read num) : lexer rest

-- 
lexSymbol :: String -> [Token]
lexSymbol cs = case span isSymb cs of -- case indica que enquanto for símbolo, fica seguindo na string; antes de ir para o pattern matting aabaixo, o span le toda a sequencia contínua de caracteres que forem símbolo; seja esta sequencia de 1 ou de n símbolos; 
                 ("+", rest) -> TokenAdd : lexer rest 
                 ("&&", rest) -> TokenAnd : lexer rest
                 ("*", rest) -> TokenMul : lexer rest -- adicionado [homeWork class 20231117]
                 ("-", rest) -> TokenSub : lexer rest -- adicionado [homeWork class 20231117]
                 ("||", rest) -> TokenOr : lexer rest -- adicionado [homeWork class 20231117]
                 ("\\", rest) -> TokenLam : lexer rest  -- referente ao cálculo lambda
                 ("->", rest) -> TokenArrow : lexer rest -- referente ao cálculo lambda
                 --('(', rest) -> TokenLParen : lexer rest -- referente ao cálculo lambda
                 --(')', rest) -> TokenRParen : lexer rest -- referente ao cálculo lambda
                 _ -> error "Lexical error: invalid symbol!"

-- 
lexKW :: String -> [Token]
lexKW cs = case span isAlpha cs of 
             ("true", rest) -> TokenTrue : lexer rest 
             ("false", rest) -> TokenFalse : lexer rest
             ("if", rest) -> TokenIf : lexer rest 
             ("then", rest) -> TokenThen : lexer rest 
             ("else", rest) -> TokenElse : lexer rest
             (var, rest) -> TokenVar var : lexer rest 
             --_ -> error "Lexical error: invalid keyword!"