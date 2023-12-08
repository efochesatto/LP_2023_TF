
# Funcionalidades para Interpretador do Lambda Cálculo

Trabalho final do CCR Linguagens de Programação<br>
Bacharelado em Ciência da Computação, 2023/02<br>
Docente: Prof. Dr. Samuel da Silva Feitosa<br>
Discente: Elias Fochesatto<br><br>

## Orientação 

Adição de funcionalidades ao Interpretador do Lambda Cálculo desenvolvido em aula, considerando: (1) implementação e/ou complementação de operadores aritméticos, booleanos e relacionais, operador let, expressões do cálculo lambda, etc.; (2) implementação de uma funcionalidade existente em outra linguagem de programação que deverá ser adicionada à linguagem aqui em desenvolvimento. 

Para as duas situações, deve-se considear todas as etapas: léxica, sintática e semântica. A descrição completa da orientação para o desenvolvimento deste projeto pode ser acessada [aqui](https://github.com/efochesatto/LP_2023_TF/blob/main/TF_descricao.pdf). 
<br><br>

## Implementações realizadas

Considerando o desenvolvimento do código-base (feito durante as aulas do CCR) e o que foi implementado como parte do trabalho final, tem-se as seguintes funcionalidades: 

| Grupo | Em aula | TF |
| :---: | :---: | :---: | 
| Operadores aritméticos | soma (+) | subtração (-) e multiplicação (*) |
| Operadores lógicos | and (&&) | or (\|\|), nand (-&&), nor (-\|\|) e xor (-&\|) | 
| Operadores relacionais |  | igual (==), diferente (/=), maior (>), menor (<), maior ou igual (>=) e menor ou igual (<=) | 
| Outras funcionalidades | let, lambda | potência (\*\*), fatorial (\*\*\*) |
<br><br>

## Informações de Apoio 

###### Tabela verdade de operações lógicas
| A | B | AND | NAND | OR | NOR | EXOR |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| 0 | 0 | 0 | 1 | 0 | 1 | 0 |
| 0 | 1 | 0 | 1 | 1 | 0 | 1 | 
| 1 | 0 | 0 | 1 | 1 | 0 | 1 | 
| 1 | 1 | 1 | 0 | 1 | 0 | 0 |

###### Testes das funcionalidades implementadas

Para testes referentes a este projeto, vale destacar: 

- em ./codeTF todos os arquivos "*.mylang" são arquivos com códigos para teste; 
- para executar um conteúdo passando a expressão pelo próprio terminal, deve-se adotar a seguinte sintaxe: echo "\[comando\]" | runghc file.hs. Para este projeto em específico, é um exemplo deste tipo de ação: echo "if true then 2 else 5" | runghc Main.hs;
- para executar um conteúdo que esteja disponível em um arquivo, deve-se usar a seguinte sintaxe: cat file.ext | runghc file.hs. Para o caso deste projeto, um exemplo seria: cat file.mylang | runghc Main.hs.<br><br>

## Conteúdos do repositório

- ./codeBase: contém os arquivos base para o desenvolvimento deste trabalho final. Os códigos base são produto de desenvolvimento conjunto (docente e discentes) em aulas do CCR de Linguagens da Programação. Note-se que, a verão utilizada como código base é um consolidado, de desenvolvimento próprio, que unificou a versão final do código base fornecida pelo professor (disponível em ./codeBase/code_in_class/class_20231201_filesProfesor) com comentários e complementações feitas ao longo do semestre, quer seja nos momentos de desenvolvimento conjunto em sala de aula, quer seja em momentos extraclasse. Esta unificação está disponível em ./codeBase/code_consolidated.
- ./codeTF: contém a versão do projeto desenvolvido para atendimento ao requisito avaliativo do CCR. 






