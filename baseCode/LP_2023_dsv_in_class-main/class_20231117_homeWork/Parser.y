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
    '*'         { TokenAdd }
    '-'         { TokenAdd }
    "&&"        { TokenAnd }
    "||"        { TokenAnd }
    true        { TokenTrue }
    false       { TokenFalse }
    if          { TokenIf }
    then        { TokenThen }
    else        { TokenElse }

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

{

parserError :: [Token] -> a 
parserError _ = error "Syntax error!"

}