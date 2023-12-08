
# Complementação de funcionalidades de Interpretador do Lambda Cálculo

Trabalho final do CCR Linguagens de Programação<br>
Bacharelado em Ciência da Computação, 2023/02<br>
Docente: Prof. Dr. Samuel da Silva Feitosa<br>
Discente: Elias Fochesatto

## Orientação 

Adição de funcionalidades ao Interpretador do Lambda Cálculo desenvolvido em aula, considerando:
- implementação e/ou complementação de operadores aritméticos, booleanos e relacionais, operador let, expressões do cálculo lambda, etc.; e 
- implementação de uma funcionalidade existente em outra linguagem de programação que deverá ser adicionada à linguagem aqui em desenvolvimento. 

Para as duas situações, deve-se considear todas as etapas: léxica, sintática e semântica.

A descrição completa da orientação para o desenvolvimento deste projeto pode ser acessada [aqui](). 

## Implementações realizadas

Considerando o desenvolvimento do código-base (feito durante as aulas do CCR) e o que foi implementado como parte do trabalho final, tem-se as seguintes funcionalidades: 

| Grupo | Implementação em Aula | Implementação TF |
| :---: | :---: | :---: | 
| Operadores aritméticos | soma (+) | subtração (-) e multiplicação (*) |
| Operadores lógicos | and (&&) | or (\|\|), nand (-&&), nor (-\|\|) e xor (-&\|) | 
| Operadores relacionais |  | igual (==), diferente (/=), maior (>), menor (<), maior ou igual (>=) e menor ou igual (<=) | 
| Outras funcionalidades | let, lambda |  | 
| Funcionalidades especificas de outras linguagens (TF) |  | potência (\*\*), fatorial (\*\*\*) |


como executar passando expressão e chamando o main
echo "if true then 2 else 5" | runghc Main.hs

como executar lendo o arquivo para o main
cat file.extFile | runghc Main.hs


## Conteúdos do repositório

- ./codeBase: contém os arquivos base para o desenvolvimento deste trabalho final. Os códigos base são produto de desenvolvimento conjunto (docente e discentes) em aulas do CCR de Linguagens da Programação. Note-se que, a verão utilizada como código base é um consolidado, de desenvolvimento próprio, que unificou a versão final do código base fornecida pelo professor (disponível em ./codeBase/code_in_class/class_20231201_filesProfesor) com comentários e complementações feitas ao longo do semestre, quer seja nos momentos de desenvolvimento conjunto em sala de aula, quer seja em momentos extraclasse. Esta unificação está disponível em ./codeBase/code_consolidated.






###### Tabela verdade de operações lógicas

| A | B | AND | NAND | OR | NOR | EXOR |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| 0 | 0 | 0 | 1 | 0 | 1 | 0 |
| 0 | 1 | 0 | 1 | 1 | 0 | 1 | 
| 1 | 0 | 0 | 1 | 1 | 0 | 1 | 
| 1 | 1 | 1 | 0 | 1 | 0 | 0 |