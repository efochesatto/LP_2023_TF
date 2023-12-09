
# Funcionalidades para Interpretador de LP

**Trabalho final do CCR Linguagens de Programação**<br>
**Bacharelado em Ciência da Computação, 2023/02**<br>
**Docente:** Prof. Dr. Samuel da Silva Feitosa<br>
**Discente:** Elias Fochesatto<br><br><br><br>

## Orientação 

Adição de funcionalidades ao Interpretador do Lambda Cálculo desenvolvido em aula, considerando: (1) implementação e/ou complementação de operadores aritméticos, booleanos e relacionais, operador let, expressões do cálculo lambda, etc.; (2) implementação de uma funcionalidade existente em outra linguagem de programação que deverá ser adicionada à linguagem aqui em desenvolvimento. Para as duas situações, deve-se considear todas as etapas: léxica, sintática e semântica. A descrição completa da orientação para o desenvolvimento deste projeto pode ser acessada [aqui](https://github.com/efochesatto/LP_2023_TF/blob/main/TF_descricao.pdf). 

## Conteúdos do repositório

- [./codeBase](https://github.com/efochesatto/LP_2023_TF/tree/main/codeBase): contém os arquivos base para o desenvolvimento deste projeto. Os códigos base são produto de desenvolvimento conjunto (docente e discentes) em aulas do CCR. Em ./codBase/codProfesor há a versão final do código base fornecida pelo professor; em ./codeBase/codeConsolidated há versão com comentários e complementações feitas ao longo do semestre, quer seja nos momentos de desenvolvimento conjunto em sala de aula, quer seja em momentos extraclasse;
- [./codeTF](https://github.com/efochesatto/LP_2023_TF/tree/main/codeTF): contém a versão do projeto desenvolvido para atendimento ao requisito avaliativo do CCR. 

Em relação ao [./codeTF](https://github.com/efochesatto/LP_2023_TF/tree/main/codeTF), a relação entre as fases do ciclo de interpretação e arquivos é a seguinte: 

- a **análise léxica** apresenta a definição da sintaxe abstrata da linguagem, considerando tipos e expressões ("data expr" e "data Ty") que são suportados pela linguagem; esta estapa recebe um código fonte do usuário e, como resultado de seu processamento, entrega uma lista de tokens que passa a representar o código inicial e que será usada nas etapas seguintes para os demais procedimentos de análise e avaliação ([ver Lexer.hs](https://github.com/efochesatto/LP_2023_TF/blob/main/codeTF/Lexer.hs));

- a **análise sintática** recebe a lista de tokens gerados na análise léxica e vai monta a AST. Essa tarefa visa a verificação de se a sequência de tokens gerada com base no código fonte está adequada ao que a linguagem suporta. Ou seja, diferente da análise léxica (onde a verificação é de se as expressões do código fonte pertencem à linguagem), a análise sintática dá um passo na avaliação geral e verifica se a adequação da disposição dos elementos. Para este projeto, utiliza-se um gerador de AST do Haskell (happy), estando o mapemaneto de tokens e expressões declarado em [Parser.y](https://github.com/efochesatto/LP_2023_TF/blob/main/codeTF/Parser.y);

- a **análise semântica**, por fim, compreende a avalição de tipos e expressões em vista de, concluído o ciclo de processamento dos comandos explicitados no código-fonte, devolver resultado ao usuário. [Typechecker.hs](https://github.com/efochesatto/LP_2023_TF/blob/main/codeTF/TypeChecker.hs) e [Interpreter.hs](https://github.com/efochesatto/LP_2023_TF/blob/main/codeTF/Interpreter.hs) contém as operaçoes para este fim. No primeiro, o objetivo é, através da verificação dos tipos, identificar e filtrar casos indesejados; no segundo, faz-se o tratamento dos problemas (expressões) em si, tratando, passo a passo, cada situação até que se chegue a uma expressão terminal. 

## Implementações realizadas

Considerando o desenvolvimento do código-base (feito durante as aulas do CCR) e o que foi implementado como parte do trabalho final, tem-se as seguintes funcionalidades: 

| Grupo | Em aula | Trabalho Final |
| :---: | :---: | :---: | 
| Operadores aritméticos | soma (+) | subtração (-) e multiplicação (*) |
| Operadores lógicos | and (&&) | or (\|\|), nand (-&&), nor (-\|\|) e xor (-&\|) | 
| Operadores relacionais |  | igual (==), diferente (/=), maior (>), menor (<), maior ou igual (>=) e menor ou igual (<=) | 
| Outras funcionalidades | if, let, lambda, toda a estrutura para interpretação (léxica, sintática e semântica) | potência (\*\*), fatorial (\*\*\*) |

## Informações de Apoio 

### Tabela verdade de operações lógicas
Em vista de apoiar a verificação das implementações das operações lógicas, replica-se, a seguir, tabela-verdade das operações implementadas. 

| A | B | AND | NAND | OR | NOR | EXOR |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| 0 | 0 | 0 | 1 | 0 | 1 | 0 |
| 0 | 1 | 0 | 1 | 1 | 0 | 1 | 
| 1 | 0 | 0 | 1 | 1 | 0 | 1 | 
| 1 | 1 | 1 | 0 | 1 | 0 | 0 |

### Testes das funcionalidades implementadas

- para executar um conteúdo passando a expressão pelo próprio terminal, deve-se adotar a seguinte sintaxe: echo "\[comando\]" | runghc file.hs. Para este projeto em específico, é um exemplo deste tipo de ação: ***echo "if true then 2 else 5" | runghc Main.hs***;
- para executar um conteúdo que esteja disponível em um arquivo, deve-se usar a seguinte sintaxe: cat file.ext | runghc file.hs. Para o caso deste projeto, um exemplo seria: ***cat file.mylang | runghc Main.hs***.<br><br>

### Exemplos das funcionalidades implementadas

- ao se passar expressões (sem o parser) para avaliação da função lexer (Lexer.hs), é possível obter a cadeia de tokens da mesma, cadeia esta que será objeto de avaliação das etapas seguintes. Os exemplos abaixo devem ser executados acionando a função lexer de Lexer.hs.<br>
***Exemplo:*** Xor (BTrue BFalse)<br>
***Sugestão de execução:*** lexer "(Xor (BTrue BFalse))"<br>
***Resultado esperado:*** [TokenLParen,TokenVar "Xor",TokenLParen,TokenVar "BTrue",TokenVar "BFalse",TokenRParen,TokenRParen]

- verificar o processamento de operador relacionado (TNum -> TNum -> TBool) e nos casos de avaliação do if, são apresentadas operações que prescindem da avaliação por passos (conforme definido em Interpreter.hs, steps).<br>
***Exemplo:*** if (3 /= 4) then 10 - ( 3 + 1) else (\*\*\*5) + (3\*\*2)<br>
***Sugestão de execução:*** echo "if (3 /= 4) then 10 - ( 3 + 1) else (\*\*\*5) + (3\*\*2)" | runghc Main.hs<br>
***Resultado esperado:*** Num 6

- utilizando o interpretados Lambda construído em aula, pode-se também aplicar as funcionalidades adicionadas, como no exemplo acima. Note que x receberá o resultado da operação (***3) e, posteriormente, elevará o mesmo à potência 4.<br>
***Exemplo:*** (\x : Num -> x \*\* 4) (\*\*\*3)<br>
***Sugestão de execução:*** echo "(\x : Num -> x \*\* 4) (\*\*\*3)" | runghc Main.hs<br>
***Resultado esperado:*** Num 1296

- o caso abaixo segue a ideia do exemplo anterior, porém agora testando as funcionalidades de operações lógicas que foram implementadas, indicado à expressão lambda que se trata do tipo Bool<br>
***Exemplo:*** (\x : Bool -> x || false) (false -|| true)<br>
***Sugestão de execução:*** echo "(\x : Bool -> x || false) (false -|| true)" | runghc Main.hs<br>
***Resultado esperado:*** BFalse

### Vídeo com demonstração das funcionalidades implementadas

Como parte dos itens avaliativos do Trabalho Final, foi requisita a gravação de pequeno vídeo (até 5 minutos), demosntrando a implementação das funcionalidades do TF e exemplos de funcionamento. Este conteúdo pode ser acessado [aqui](https://youtu.be/AjsxZFf769A). 

## Dependências

Para este projeto utilizou-se a linguagem Haskell e para compilação a versão 8.8.4 do [GHCi](https://www.haskell.org/ghc/).