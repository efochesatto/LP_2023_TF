{
module Parser where

import Lexer 
}

%name parser 
%tokentype { Token }
%error { parserError } 

%token 
    num         { TokenNum $$ }
    '+'         { TokenAdd }
    '*'         { TokenMul }
    '-'         { TokenSub }
    "&&"        { TokenAnd }
    "||"        { TokenOr }
    true        { TokenTrue }
    false       { TokenFalse }
    if          { TokenIf }
    then        { TokenThen }
    else        { TokenElse }
    var         { TokenVar $$ }
    '\\'        { TokenLam }
    "->"        { TokenArrow }
    '('         { TokenLParen }
    ')'         { TokenRParen }

%%

Exp         : num                       { Num $1 }
            | true                      { BTrue }
            | false                     { BFalse }
            | Exp '+' Exp               { Add $1 $3 }
            | Exp '*' Exp               { Mul $1 $3 }       -- adicionado [homeWork class 20231117]
            | Exp '-' Exp               { Sub $1 $3 }       -- adicionado [homeWork class 20231117]
            | Exp "&&" Exp              { And $1 $3 }
            | Exp "||" Exp              { Or $1 $3 }        -- adicionado [homeWork class 20231117]
            | if Exp then Exp else Exp  { If $2 $4 $6 }
            | var                       { Var $1 }  -- referente ao cálculo lambda
            | '\\' var "->" Exp         { Lam $2 $4 } -- referente ao cálculo lambda
            | Exp Exp                   { App $1 $2 } -- referente ao cálculo lambda
            | '(' Exp ')'               { Paren $2 } -- referente ao cálculo lambda -- da forma como está posto, tem que ter os dois, no caso, um para abrir e outro fechar; 

{

parserError :: [Token] -> a 
parserError _ = error "Syntax error!"

}