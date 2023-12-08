module Lexer where 
 
import Data.Char 

-- Criando expressões que poderão ser aceitas 
-- Representação da árvore de sintaxe abstrata (AST)
data Expr = BTrue
          | BFalse 
          | Num Int 
          | Add Expr Expr 
          | Mul Expr Expr  
          | Sub Expr Expr   
          | And Expr Expr 
          | Or Expr Expr  
          | Nand Expr Expr  
          | Nor Expr Expr  
          | Xor Expr Expr  
          | Fat Expr  
          | Pot Expr Expr  
          | Igual Expr Expr
          | Diferente Expr Expr
          | Maior Expr Expr
          | Maiorigual Expr Expr
          | Menor Expr Expr
          | Menorigual Expr Expr
          | If Expr Expr Expr 
          | Var String                   
          | Lam String Ty Expr           
          | App Expr Expr                
          | Paren Expr
          | Let String Expr Expr 
          deriving Show

-- adicionando para o tratamento de tipo
-- Utilizado em TypeChecker.hs para verificar a validade dos tipos de uma expressão
data Ty = TBool 
        | TNum 
        | TFun Ty Ty
        deriving (Show, Eq) -- para poder tratar a igualdade do tipo também 

-- definição dos tokens válidos para a linguagem 
-- Tipo de dado ("Token") criado para etapa de identificação/geração de tokens
data Token = TokenTrue 
           | TokenFalse 
           | TokenNum Int 
           | TokenAdd
           | TokenMul  
           | TokenSub  
           | TokenAnd
           | TokenOr   
           | TokenNand  
           | TokenNor  
           | TokenXor  
           | TokenIgual   
           | TokenDiferente   
           | TokenMaior   
           | TokenMaiorigual   
           | TokenMenor   
           | TokenMenorigual   
           | TokenPot   
           | TokenFat  
           | TokenIf 
           | TokenThen 
           | TokenElse
           | TokenVar String     
           | TokenLam            
           | TokenArrow          
           | TokenLParen         
           | TokenRParen         
           | TokenLet 
           | TokenEq 
           | TokenIn
           | TokenColon -- token para :
           | TokenBoolean 
           | TokenNumber
           deriving (Show, Eq)

-- isSpace do Haskell, assim como isDigit e isAlpha também são
-- elem indica se um determinado caracter existe em uma lista 
isSymb :: Char -> Bool 
isSymb c = c `elem` "+&|-*\\->()=:</"
--isSymb c = c `elem` "+&|-*" -- adicionados símbolos |-* [homeWork class 20231117]
-- tem que colocar \\ porque \ em haskell tbm é scape
-- -> é o símbolo de TokenArrow e \ de TokenLamb

lexer :: String -> [Token]
lexer [] = [] 
lexer ('(':cs) = TokenLParen : lexer cs -- tirado do lexSymbol para não dar erro quando tem outro símbolo junto 
lexer (')':cs) = TokenRParen : lexer cs
lexer (c:cs) | isSpace c = lexer cs 
             | isDigit c = lexNum (c:cs)
             | isSymb c = lexSymbol (c:cs)      -- isSymbol não existe no haskell nativamente, então se desenvolveu a função isSymbol acima; se for um símbolo, aí chama a lexSymbol; 
             | isAlpha c = lexKW (c:cs) -- serve para palavras-chave
lexer _ = error "Lexical error!"

-- o span faz tipo um loop, no caso abaixo, ele lê enquanto for dígito; quando encontrar um elemento diferente de digit, coloca no rest
lexNum :: String -> [Token]
lexNum cs = case span isDigit cs of 
              (num, rest) -> TokenNum (read num) : lexer rest
              -- divide em num e rest; read serve para converter para int
              -- TokenNum é a 'saída', porque este foi o nome definido em data Token

lexSymbol :: String -> [Token]
lexSymbol cs = case span isSymb cs of -- case indica que enquanto for símbolo, fica seguindo na string; antes de ir para o pattern matting aabaixo, o span le toda a sequencia contínua de caracteres que forem símbolo; seja esta sequencia de 1 ou de n símbolos; 
                 ("+", rest)  -> TokenAdd : lexer rest 
                 ("&&", rest) -> TokenAnd : lexer rest 
                 ("*", rest) -> TokenMul : lexer rest  
                 ("-", rest) -> TokenSub : lexer rest  
                 ("||", rest) -> TokenOr : lexer rest  
                 ("-&&", rest) -> TokenNand : lexer rest  
                 ("-||", rest) -> TokenNor : lexer rest  
                 ("-&|", rest) -> TokenXor : lexer rest  
                 ("==", rest)  -> TokenIgual :lexer rest  
                 ("/=", rest)  -> TokenDiferente :lexer rest  
                 (">", rest)  -> TokenMaior :lexer rest  
                 (">=", rest)  -> TokenMaiorigual :lexer rest  
                 ("<", rest)  -> TokenMenor :lexer rest  
                 ("<=", rest)  -> TokenMenorigual : lexer rest  
                 ("***", rest) -> TokenFat : lexer rest  
                 ("**", rest) -> TokenPot : lexer rest  
                 ("\\", rest) -> TokenLam : lexer rest   
                 ("->", rest) -> TokenArrow : lexer rest  
                 ("=", rest)  -> TokenEq : lexer rest 
                 (":", rest)  -> TokenColon : lexer rest 
                 _ -> error "Lexical error: invalid symbol!"

lexKW :: String -> [Token]
lexKW cs = case span isAlpha cs of 
             ("true", rest) -> TokenTrue : lexer rest 
             ("false", rest) -> TokenFalse : lexer rest
             ("if", rest) -> TokenIf : lexer rest 
             ("then", rest) -> TokenThen : lexer rest 
             ("else", rest) -> TokenElse : lexer rest 
             ("let", rest) -> TokenLet : lexer rest 
             ("in", rest) -> TokenIn : lexer rest 
             ("Num", rest) -> TokenNumber : lexer rest 
             ("Bool", rest) -> TokenBoolean : lexer rest 
             (var, rest) -> TokenVar var : lexer rest 
             --_ -> error "Lexical error: invalid keyword!" NÃO SEI POR QUE FOI COMENTADO EM CLASS 20231104
             -- NO CÓDIGO DO PROFESSOR (FINAL) A LINHA ACIMA NÃO EXISTE


