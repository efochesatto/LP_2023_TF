{
module Parser where

import Lexer 
}

%name parser 
%tokentype { Token }
%error { parserError } 

%left '+'

%token 
    num         { TokenNum $$ }
    '+'         { TokenAdd }
    -- '*'         { TokenAdd } -- adicionado [homeWork class 20231117]
    -- '-'         { TokenAdd } -- adicionado [homeWork class 20231117]
    "&&"        { TokenAnd }
    -- "||"        { TokenAnd } -- adicionado [homeWork class 20231117]
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
    '='         { TokenEq }
    let         { TokenLet }
    in          { TokenIn }
    Bool        { TokenBoolean }
    Num         { TokenNumber }
    ':'         { TokenColon }

%%

Exp         : num                           { Num $1 }
            | true                          { BTrue }
            | false                         { BFalse }
            | Exp '+' Exp                   { Add $1 $3 }
            -- | Exp '*' Exp               { Mul $1 $3 }       -- adicionado [homeWork class 20231117]
            -- | Exp '-' Exp               { Sub $1 $3 }       -- adicionado [homeWork class 20231117]
            | Exp "&&" Exp                  { And $1 $3 }
            -- | Exp "||" Exp              { Or $1 $3 }        -- adicionado [homeWork class 20231117]
            | if Exp then Exp else Exp      { If $2 $4 $6 }
            | var                           { Var $1 } -- referente ao cálculo lambda
            | '\\' var ':' Type "->" Exp    { Lam $2 $4 $6 } -- referente ao cálculo lambda
            | Exp Exp                       { App $1 $2 } -- referente ao cálculo lambda
            | '(' Exp ')'                   { Paren $2 } -- referente ao cálculo lambda -- da forma como está posto, tem que ter os dois, no caso, um para abrir e outro fechar; 
            | let var '=' Exp in Exp        { Let $2 $4 $6 }

Type    : Bool                              { TBool }
        | Num                               { TNum }
        | '(' Type "->" Type ')'            { TFun $2 $4 }

{

parserError :: [Token] -> a 
parserError _ = error "Syntax error!"

}