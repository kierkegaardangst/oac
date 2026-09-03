# Prática e Exercícios MIPS: Do Básico à Manipulação de Memória e Bits

Este material foi estruturado para ser direto, visual e prático. Cada exercício possui:
1. **O Cenário e o Objetivo** (o que você precisa fazer e por quê).
2. **A Linha de Raciocínio** (o que acontece bit a bit ou na memória).
3. **Código Assembly MIPS Completo**, pronto para copiar, montar (`F3`) e rodar passo a passo (`F7`) no **MARS**.

---

## Módulo 1: Operações de Memória e Offsets

### Exercício 1.1: O Ciclo Completo de uma Variável (Leitura, Modificação e Escrita)
* **Objetivo:** Ler um valor da memória RAM, somar `15` a ele usando a CPU e salvar o novo valor de volta na mesma variável.
* **Conceito-chave:**
  * `la`: obtém o endereço base onde a variável está alocada.
  * `lw`: traz a palavra (4 bytes) da memória para um registrador.
  * `sw`: escreve a palavra do registrador na memória.
  * `offset 0($s0)`: acessa exatamente o início do endereço guardado em `$s0`.

#### Código executável no MARS:
```assembly
.data
    saldo: .word 100        # Cria uma variável na RAM com valor 100 (0x00000064)

.text
.globl main

main:
    # 1. Aponta para onde o saldo está na RAM
    la $s0, saldo           # $s0 recebe o endereço de 'saldo' (ex: 0x10010000)

    # 2. Carrega o valor atual da RAM para o registrador $t0
    lw $t0, 0($s0)          # $t0 = 100

    # 3. Faz a operação na CPU (adiciona 15 de bônus)
    addi $t0, $t0, 15       # $t0 = 100 + 15 = 115 (0x00000073)

    # 4. Devolve o novo saldo para a memória
    sw $t0, 0($s0)          # Grava 115 de volta no endereço 0x10010000

    # Finaliza a execução
    li $v0, 10
    syscall
```
> **Como testar no MARS:** Aperte `F3` (Assemble), observe o valor em **Data Segment** mudar de `0x00000064` (100) para `0x00000073` (115) após a instrução `sw`.

---

### Exercício 1.2: Entendendo Offsets Estáticos (Duas variáveis consecutivas)
* **Objetivo:** Acessar duas variáveis declaradas em sequência usando apenas **um registrador base** e ajustando o **offset**.
* **Conceito-chave:** Como cada `.word` ocupa 4 bytes, a segunda variável está exatamente a **+4 bytes** de distância da primeira.

```text
Endereço Base ($s0):       0x10010000 -> nota1 (80)
Endereço Base + 4 ($s0+4): 0x10010004 -> nota2 (95)
```

#### Código executável no MARS:
```assembly
.data
    nota1: .word 80         # Endereço base (offset 0)
    nota2: .word 95         # Endereço base + 4 bytes (offset 4)
    media: .word 0          # Endereço base + 8 bytes (offset 8)

.text
.globl main

main:
    la $s0, nota1           # Carrega apenas o endereço de nota1 em $s0

    # Lê nota1 e nota2 usando o mesmo registrador base ($s0) com offsets diferentes
    lw $t0, 0($s0)          # Lê no endereço ($s0 + 0) -> $t0 = 80
    lw $t1, 4($s0)          # Lê no endereço ($s0 + 4) -> $t1 = 95

    # Calcula a soma e a divisão por 2 (média simples)
    add $t2, $t0, $t1       # $t2 = 80 + 95 = 175
    sra $t2, $t2, 1         # Deslocamento à direita por 1 bit divide por 2 -> $t2 = 87

    # Guarda a média no espaço reservado 'media' que está a 8 bytes de distância
    sw $t2, 8($s0)          # Grava no endereço ($s0 + 8)

    li $v0, 10
    syscall
```

---

### Exercício 1.3: Vetor Dinâmico com Índice Variável (`v[i]`)
* **Objetivo:** Acessar e alterar o elemento `v[i]` onde `i` é um índice qualquer (ex: $i = 3$).
* **Fórmula do endereço:**
  $$\text{Endereço do elemento} = \text{Endereço Base} + (i \times 4)$$
* **Por que multiplicar por 4 com `sll`?** 
  Deslocar $2$ bits para a esquerda (`sll $reg, $reg, 2`) multiplica qualquer número por $2^2 = 4$ em apenas 1 ciclo de clock.

#### Código executável no MARS:
```assembly
.data
    vetor: .word 10, 20, 30, 40, 50   # Índices: v[0], v[1], v[2], v[3], v[4]

.text
.globl main

main:
    li $t0, 3               # Queremos acessar o índice i = 3 (que vale 40)

    # 1. Calcula o deslocamento em bytes: i * 4
    sll $t1, $t0, 2         # $t1 = 3 * 4 = 12 bytes

    # 2. Obtém o endereço base do vetor
    la $s0, vetor           # $s0 = endereço inicial de 'vetor'

    # 3. Calcula o endereço exato de vetor[3]: Base + Deslocamento
    add $s1, $s0, $t1       # $s1 = &vetor[3]

    # 4. Lê o elemento
    lw $t2, 0($s1)          # $t2 = vetor[3] = 40

    # 5. Multiplica o valor lido por 2 e salva de volta
    sll $t2, $t2, 1         # $t2 = 40 * 2 = 80
    sw $t2, 0($s1)          # vetor[3] agora passa a valer 80 na RAM!

    li $v0, 10
    syscall
```

---

## Módulo 2: Operações Lógicas Bit a Bit (AND, OR, ANDI, ORI)

### Exercício 2.1: Máscara AND para Isolar Bits (Extração de Byte)
* **Objetivo:** Dado o valor `0x1234` em `$t1`, isole apenas os 8 bits menos significativos (o byte baixo `0x34`), descartando o restante.
* **Raciocínio:**
  * Máscara com bits `1` preserva o valor original.
  * Máscara com bits `0` força o resultado para zero.
  * Máscara hexadecimal necessária: `0x00FF`.

```text
    $t1:   0001 0010 0011 0100 (0x1234)
&  Masc:   0000 0000 1111 1111 (0x00FF)
---------------------------------------
Resultado: 0000 0000 0011 0100 (0x0034)
```

#### Código executável no MARS:
```assembly
.text
.globl main

main:
    li $t1, 0x1234          # Valor de entrada
    andi $t0, $t1, 0x00FF   # Isola os últimos 8 bits. $t0 receberá 0x0034

    li $v0, 10
    syscall
```

---

### Exercício 2.2: Operação OR para Combinar e Ligar Bits (Set Bits)
* **Objetivo:** Você tem dois registradores:
  * `$t1 = 0x0F00`
  * `$t2 = 0x00F0`
  Combine ambos em um único registrador para formar `0x0FF0`.
* **Raciocínio:** 
  A operação `or` ativa bits onde quer que haja `1` em qualquer um dos operandos.

```text
   $t1:    0000 1111 0000 0000 (0x0F00)
|  $t2:    0000 0000 1111 0000 (0x00F0)
---------------------------------------
Resultado: 0000 1111 1111 0000 (0x0FF0)
```

#### Código executável no MARS:
```assembly
.text
.globl main

main:
    li $t1, 0x0F00          # Parte alta
    li $t2, 0x00F0          # Parte baixa

    or $t0, $t1, $t2        # Combina os dois: $t0 = 0x0FF0

    # Ligando também o bit 0 usando ORI (OR com imediato)
    ori $t0, $t0, 0x0001    # $t0 passa a ser 0x0FF1

    li $v0, 10
    syscall
```

---

## Módulo 3: Deslocamento de Bits (SLL e SRL)

### Exercício 3.1: Multiplicação e Divisão Rápida por Potências de 2
* **Objetivo:**
  1. Multiplicar `0x0001` por $16$ ($2^4$) usando deslocamento à esquerda (`sll`).
  2. Dividir `0x00F0` por $16$ ($2^4$) usando deslocamento à direita (`srl`).

* **Raciocínio:**
  * Cada bit deslocado à esquerda com `sll` multiplica o número por 2. Deslocar 4 posições multiplica por $2^4 = 16$.
  * Cada bit deslocado à direita com `srl` divide o número por 2 (descarte de resto). Deslocar 4 posições divide por $2^4 = 16$.

```text
sll (4 posições):
0000 0001 (1) << 4  ===>  0001 0000 (0x0010 = 16 em decimal)

srl (4 posições):
1111 0000 (0x00F0) >> 4 ===> 0000 1111 (0x000F = 15 em decimal)
```

#### Código executável no MARS:
```assembly
.text
.globl main

main:
    # 1. Multiplicação usando SLL
    li $t1, 0x0001
    sll $t0, $t1, 4         # $t0 = 0x0010 (16)

    # 2. Divisão usando SRL
    li $t2, 0x00F0
    srl $t3, $t2, 4         # $t3 = 0x000F (15)

    li $v0, 10
    syscall
```

---

## Módulo 4: Desafio Integrado — Manipulação de Campo de Bits (Struct / Registrador de Hardware)

Este é um dos tópicos mais cobrados em avaliações práticas da disciplina: **extrair e substituir um campo interno de bits**.

* **Cenário:**
  * O registrador `$t0` contém a palavra `0xABCD1234`.
  * Queremos extrair o nibble (4 bits) localizado entre os **bits 8 e 11** (que corresponde ao dígito hexadecimal `2`).
  * O resultado final em `$t1` deve ser simplesmente `0x00000002`.

* **Estratégia:**
  1. Primeiro isolamos com máscara (`andi`) ou deslocamos para a esquerda/direita.
  2. Forma mais direta: deslocar à direita por 8 posições (`srl`) para que os bits 8–11 passem para a posição 0–3, e depois aplicar a máscara `0x000F`.

```text
Original ($t0): 0xABCD1234
1. srl 8 bits:  0x00ABCD12  (o '2' agora está na posição menos significativa)
2. andi 0x000F: 0x00000002  (limpa todo o restante à esquerda)
```

#### Código executável no MARS:
```assembly
.text
.globl main

main:
    # Carrega valor de 32 bits usando lui + ori
    lui $t0, 0xABCD         # Coloca 0xABCD na metade superior (bits 31-16)
    ori $t0, $t0, 0x1234    # Coloca 0x1234 na metade inferior (bits 15-0)
                            # Agora $t0 = 0xABCD1234

    # Passo 1: Desloca 8 bits para a direita
    srl $t1, $t0, 8         # $t1 = 0x00ABCD12

    # Passo 2: Aplica máscara de 4 bits para zerar todo o restante
    andi $t1, $t1, 0x000F   # $t1 = 0x00000002

    li $v0, 10
    syscall
```

---

## Tabela Rápida de Mnemônicos para Consulta

| Instrução | Significado | Exemplo MIPS | O que faz na prática |
| :--- | :--- | :--- | :--- |
| **`li`** | Load Immediate | `li $t0, 25` | Carrega o número 25 no registrador `$t0` (CPU) |
| **`la`** | Load Address | `la $s0, var` | Pega o endereço de memória de `var` e guarda em `$s0` |
| **`lw`** | Load Word | `lw $t0, 0($s0)` | Lê 4 bytes da RAM no endereço `$s0 + offset` para `$t0` |
| **`sw`** | Store Word | `sw $t0, 0($s0)` | Escreve os 4 bytes de `$t0` na RAM no endereço `$s0 + offset` |
| **`add` / `sub`** | Soma / Subtração | `add $t2, $t0, $t1` | `$t2 = $t0 + $t1` |
| **`addi`** | Add Immediate | `addi $t0, $t0, 5` | Soma constante inteira diretamente: `$t0 = $t0 + 5` |
| **`sll`** | Shift Left Logical | `sll $t0, $t1, 2` | Move bits à esquerda (equivale a multiplicar por $2^n$) |
| **`srl`** | Shift Right Logical | `srl $t0, $t1, 2` | Move bits à direita com preenchimento de zeros |
| **`and` / `andi`** | E Lógico (bit a bit) | `andi $t0, $t1, 0xFF` | Muito usado para **zerar ou isolar** bits |
| **`or` / `ori`** | OU Lógico (bit a bit) | `ori $t0, $t1, 0x01` | Muito usado para **ligar/setar** bits em 1 |
