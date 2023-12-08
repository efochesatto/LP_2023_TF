module Main where

import Lexer 
import Parser
import TypeChecker
import Interpreter

main = getContents >>= print . eval . typecheck . parser . lexer
-- pega tudo o que o usuaŕio digitou e joga pro lexer e depois imprime