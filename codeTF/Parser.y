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
    '*'         { TokenMul } -- adicionado [homeWork class 20231117]
    '-'         { TokenSub } -- adicionado [homeWork class 20231117]
    "&&"        { TokenAnd }
    "||"        { TokenOr } -- adicionado [homeWork class 20231117]
    "-&&"       { TokenNand } -- adicionado TF 
    "-||"       { TokenNor } -- adicionado TF
    "-&|"       { TokenXor } -- adicionado TF
    "=="        { TokenIgual }  -- adicionado TF
    "/="        { TokenDiferente }  -- adicionado TF
    ">"         { TokenMaior }  -- adicionado TF
    ">="        { TokenMaiorigual }  -- adicionado TF
    "<"         { TokenMenor }  -- adicionado TF
    "<="        { TokenMenorigual }  -- adicionado TF
    "***"       { TokenFat } -- adicionado TF
    "**"        { TokenPot } -- adicionado TF
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
            | Exp '*' Exp                   { Mul $1 $3 }       -- adicionado [homeWork class 20231117]
            | Exp '-' Exp                   { Sub $1 $3 }       -- adicionado [homeWork class 20231117]
            | Exp "&&" Exp                  { And $1 $3 }
            | Exp "||" Exp                  { Or $1 $3 }        -- adicionado [homeWork class 20231117]
            | Exp "-&&" Exp                 { Nand $1 $3 }        -- adicionado TF
            | Exp "-||" Exp                 { Nor $1 $3 }         -- adicionado TF
            | Exp "-&|" Exp                 { Xor $1 $3 }         -- adicionado TF
            | Exp "==" Exp                  { Igual $1 $3 }       -- adicionado TF
            | Exp "/=" Exp                  { Diferente $1 $3 }   -- adicionado TF
            | Exp ">" Exp                   { Maior $1 $3 }       -- adicionado TF
            | Exp ">=" Exp                  { Maiorigual $1 $3 }  -- adicionado TF
            | Exp "<" Exp                   { Menor $1 $3 }       -- adicionado TF
            | Exp "<=" Exp                  { Menorigual $1 $3 }  -- adicionado TF
            | "***" Exp                     { Fat $2 }            -- adicionado TF
            | Exp "**" Exp                  { Pot $1 $3 }         -- adicionado TF
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