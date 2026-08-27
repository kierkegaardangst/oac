# Guia Completo de Programação em MIPS

Este guia é uma referência prática e direta para entender os conceitos fundamentais da arquitetura MIPS, indo desde operações aritméticas simples até a manipulação avançada de memória e vetores.

Cada seção contém explicações conceituais detalhadas seguidas por um bloco de código independente. Todos os códigos possuem seções de dados e texto (`.data` e `.text`) e estão prontos para serem copiados, colados e executados individualmente no simulador **MARS**.

---

## 1. Operações Aritméticas Básicas (ADD e SUB)

No MIPS, as operações aritméticas são realizadas diretamente sobre os **registradores**. A arquitetura segue o princípio de que a "simplicidade favorece a regularidade", o que significa que instruções aritméticas como soma (`add`) e subtração (`sub`) sempre operam com três operandos (um registrador de destino e dois de origem).

Para facilitar a programação, utilizamos a pseudo-instrução `li` (Load Immediate) para carregar valores constantes numéricas (imediatos) diretamente nos registradores antes de realizar as operações.

**Exemplo Prático:**
O código a seguir carrega os valores 15 e 10, calcula a soma e a subtração, e encerra o programa de forma limpa.

```assembly
.text
.globl main

main:
    # Carregando valores nos registradores temporários
    li $t0, 15          # $t0 = 15
    li $t1, 10          # $t1 = 10
    
    # Realizando as operações matemáticas
    add $t2, $t0, $t1   # $t2 recebe $t0 + $t1 (15 + 10 = 25)
    sub $t3, $t0, $t1   # $t3 recebe $t0 - $t1 (15 - 10 = 5)

    # Encerrando o programa corretamente (Syscall 10)
    li $v0, 10
    syscall
```

---

## 2. Acesso à Memória e Entendendo o Offset (LW e SW)

Os registradores são extremamente rápidos, porém muito limitados em quantidade. A maior parte dos dados e variáveis de um programa mais complexo viverá na **memória principal** (RAM). No MIPS, a única forma de manipular esses dados é transferindo-os entre a memória e os registradores usando as instruções de carregamento `lw` (Load Word) e armazenamento `sw` (Store Word).

### Endereço Base e Deslocamento (Offset)
A memória do MIPS é endereçada a nível de *byte*, e uma palavra (word) ocupa **4 bytes**. Para acessar um dado, utilizamos o formato `offset($registrador_base)`:
- **Endereço Base:** É o local exato onde sua variável começa na memória. Usamos a instrução `la` (Load Address) para mapear esse endereço em um registrador.
- **Deslocamento (Offset):** É uma constante numérica somada ao endereço base para encontrar o dado. É muito útil quando temos estruturas de dados compostas.

**Exemplo Prático:**
Lendo o valor de uma variável da memória, modificando-o no processador e salvando o novo resultado em outra variável.

```assembly
.data
    var1: .word 42      # Variável na memória com valor inicial 42
    var2: .word 0       # Variável na memória com valor inicial 0

.text
.globl main

main:
    # Passo 1: Ler da memória (Load)
    la $s0, var1        # Carrega o endereço base de 'var1' no registrador $s0
    lw $t4, 0($s0)      # Lê a word usando offset 0 a partir de $s0. Agora, $t4 = 42
    
    # Passo 2: Modificar o dado no registrador
    addi $t4, $t4, 8    # Soma o imediato 8 ao valor (42 + 8 = 50)
    
    # Passo 3: Salvar na memória (Store)
    la $s1, var2        # Carrega o endereço base de 'var2' em $s1
    sw $t4, 0($s1)      # Escreve o novo valor de $t4 (50) no offset 0 de $s1

    # Encerrando o programa
    li $v0, 10
    syscall
```

---

## 3. Criação e Manipulação de Vetores (Arrays)

Um vetor (array) é, em sua essência, um conjunto de valores do mesmo tipo dispostos sequencialmente na memória. Como cada `.word` ocupa **4 bytes**, os elementos de um vetor de inteiros estarão sempre espaçados de 4 em 4 bytes. 
- Elemento `v[0]` fica no offset `0`.
- Elemento `v[1]` fica no offset `4`.
- Elemento `v[2]` fica no offset `8`, e assim por diante.

### Calculando o deslocamento (Offset dinâmico)
Para acessar uma posição genérica `v[i]`, onde `i` está em um registrador que pode variar (como num loop), não podemos usar um offset estático como `8($s0)`. O offset deve ser calculado em tempo de execução através da seguinte fórmula: `Endereço Final = Endereço Base + (i * 4)`.

Para multiplicar `i` por 4 de forma otimizada e rápida, o MIPS utiliza a instrução de deslocamento de bits **SLL** (Shift Left Logical). Deslocar 2 bits à esquerda é matematicamente equivalente a multiplicar por $2^2$ (ou seja, 4).

**Exemplo Prático:**
Acessando o elemento `array[2]` dinamicamente calculando seu offset, alterando seu valor e, em seguida, acessando `array[3]` através de um offset estático direto.

```assembly
.data
    # Declarando um vetor de 4 posições (words) na memória
    array: .word 10, 20, 30, 40   # Índices: 0, 1, 2 e 3

.text
.globl main

main:
    # ----------------------------------------------------
    # Acesso Dinâmico: Lendo e modificando array[2]
    # ----------------------------------------------------
    li $t0, 2           # Definimos o índice 'i' que queremos acessar (i = 2)
    
    # Multiplica o índice por 4 (tamanho do byte da word) para gerar o offset
    sll $t0, $t0, 2     # $t0 = 2 * 4 = 8 (deslocamento dinâmico calculado)
    
    la $s2, array       # Carrega o endereço base inicial do vetor em $s2
    add $s2, $s2, $t0   # Soma Base + Offset -> $s2 agora aponta para array[2]
    
    lw $t1, 0($s2)      # $t1 recebe o conteúdo de array[2] (lê o valor 30)
    
    addi $t1, $t1, 5    # Soma 5 ao valor que acabamos de ler: $t1 = 35
    sw $t1, 0($s2)      # Escreve o novo valor (35) de volta na memória, em array[2]

    # ----------------------------------------------------
    # Acesso Estático: Lendo array[3] diretamente
    # ----------------------------------------------------
    la $s3, array       # Restabelece o endereço base inicial do vetor em $s3
    lw $t2, 12($s3)     # Usamos a lógica estática (3 * 4 = 12). 
                        # Lê diretamente a 4ª word (array[3]) que é o valor 40

    # Encerrando o programa
    li $v0, 10
    syscall
```
