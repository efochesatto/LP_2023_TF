{ -- tem que ser entre chaves para o happy entender
module Parser where

import Lexer

}

%name parser -- informa o nome da função que o happy deverá criar, neste caso, parser;
%tokeypt { Token } -- nome do tipo de tipo criado no lexer
%error { parserError } -- função ainda a ser criada

-- tem que fazer uma espécie de mapeamento 
-- descrever quais são os tokens
%token
    num     { TokenNum $$ }
    '+'     { TokenAdd }
    "&&"    { TokenAnd }
    true    { TokenTrue }
    false   { TokenFalse }
    if      { TokenIf }
    then    { TokenThen }
    else    { TokenElse }

-- agora tem que passar a gramática que tem que ser seguida
%%
-- %% indica que antes era definição e agora, depois do %% é a gramática

Exp         : num               { Num $1 }
            | true              { BTrue }
            | false             { BFalse }
            | Exp '+' Exp       { Add $1 $3 } -- $3 porque Exp é a terceira expressão
            | Exp '&&' Exp      { And $1 $3 }
            | if Exp Exp Exp    { If $2 $4 $6}

{

parserError :: [Token] -> a
parserError = error "Syntax error!"

}