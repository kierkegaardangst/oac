# INSTRUÇÕES: Instruções Lógicas Bit-a-Bit

# INSTRUÇÕES FORMATO I:

# Instrução OR

# Coloca no registrador $t1 o valor do OR bit-a-bit entre $t2 e $t3
# Se tiver pelo menos um "1" então é 1

or $t1, $t2, $t4

# Instrução AND

# Coloca no registrador $t1 o valor do AND bit-a-bit entre $t2 e $t3
# Se tiver pelo menos um "0" então é 0

and $t1, $t2, $t4

# Instrução XOR

# Coloca no registrador $t1 o valor do XOR bit-a-bit entre $t2 e $t3
# Dois valores iguais = 0, valores diferentes = 1

xor $t1, $t2, $t4

# Instrução NOR

# Coloca no registrador $t1 o valor do XOR bit-a-bit entre $t2 e $t3
# OR invertida

nor $t1, $t2, $t4

# Instrução SLL

# Deslocamento
# Coloca no registrador $t1 o resultado do deslocamento lógico de $t2 duas casas à esquerda 
# Preenche os espaços criados à direita com zeros

sll $t1, $t2, 2

# Instrução SRL

# Deslocamento
# Coloca no registrador $t1 o resultado do deslocamento lógico de $t2 duas casas à direita
# Preenche os espaços criados à direita com zeros

srl $t1, $t2, 2

#---------------------------------------#

# INSTRUÇÕES FORMATO I:

# Instrução ORI

# Coloca no registrador $t1 o valor do OR bit-a-bit entre $t2 e 0x15

ori $t1, $t2, 0x15

# Instrução ANDI

# Coloca no registrador $t1 o valor do AND bit-a-bit entre $t2 e 0x15

andi $t1, $t2, 0x15

# Instrução XORI

# Coloca no registrador $t1 o valor do XOR bit-a-bit entre $t2 e 0x15

xori $t1, $t2, 0x15

# Utilizações Especiais

# Copia o valor em $t2 para $t1

or $t1, $t2, $zero

# Coloca no registrador $t1 o valor 0x6

ori $t1, $zero, 0x6

# Copia para $t1 o valor de $t2 negado, isto é, $t1  NOT $t2

nor $t1, $t2, $zero # NOT

#---------------------------------------#

# INSTRUÇÕES: Operações Aritméticas

# INSTRUÇÕES FORMATO R:

# Instrução ADD

add $t2, $t0, $t1 # $t2 = $t0 + $t1

# Instrução SUB

sub $t2, $t0, $t1 # $t2 = $t0 - $t1

#---------------------------------------#

# INSTRUÇÕES FORMATO I:

# Instrução ADDI

addi $t2, $t0, 0x12  # $t2 = $t0 + 0x12

# Instrução SUBI

# Não existe, mas pode ser feito usando uma soma imediata utilizando uma constante negativa

# a - b == a + (-b)

#---------------------------------------#

# Complemento de dois

# -X == NOT(X) + 1

ori $t5, $zero, 2
nor $t5, $t5, $zero  # Complemento de 1 - Copia em $t5 o valor de $t5 negado
addi $t5, $t5, 1     # Complemento de 2 - Adiciona 1 em $t5

# INSTRUÇÕES ESPECIAIS:

# Instrução ADDU
# Instrução ADDIU
# Instrução SUBU

# Realizam a soma (ou subtração) sobre inteiros sem sinal (unsigned)

#---------------------------------------#

# INSTRUÇÕES FORMATO R:

# Multiplicação -> MULT

mult $t0, $t1 # Multiplicação de inteiros com sinal

multu $t0, $t1 # Multiplicação de inteiros sem sinal

mfhi $t2 # Move o resultado em hi para $t2 -> Resto = hi

mflo $t3 # Move o resultado em lo para $t3 -> Quociente = lo

# Divisão -> DIV

div $t0, $t1 # Divisão de inteiros com sinal

divu $t0, $t1 # Divisão de inteiros sem sinal

mfhi $t2 # Move o resultado em hi para $t2 // Resto = hi // hi  $t0 % $t1

mflo $t3 # Move o resultado em lo para $t3 // Quociente = lo // lo  $t0 / $t1

# Instrução SRA

# Tem função similar ao srl, mas mantém o bit mais significativo

sra $t1, $t0, 4 

#---------------------------------------#

# INSTRUÇÕES: Acesso à Memória

# rd = Registrador destino
# desl = Deslocamento
# b = Base
# rs = Registrador fonte

# Instrução LOAD WORD (LW)

# Carrega uma word (32 bits) da memória para um registrador

## lw rd, desl(b) 

# Instrução STORE WORD (SW)

# Carrega uma word (32 bits) de um registrador para a memória

## sw rs, dels(b) 

# Instrução LOAD HALFWORD (lH)

# Carrega uma halfword da memória para os 16 bits menos significativos de um registrador

## lh rd, desl(b)

# Instrução STORE HALFWORD (SH)

# Carrega uma halfword (16 bits) dos 16 bits menos significativos de um registrador para a memória

# Quando lh é usada, os 16 bits mais significativos do registrador são completados com extensão do sinal

## sh rs, desl(b)

# Instrução STORE HALFWORD UNSIGNED (LHU)

# Carrega uma halfword da memória para os 16 bits menos significativos de um registrador

# Quando lhu é usada, os 16 bits mais significativos do registrador são completados com zeros

## lhu rd, desl(b)





#---------------------------------------#

# INSTRUÇÕES: Instruções de Desvios

# Desvios Condicionais

# Instrução BEQ

# Vai para a instrução na posição L1 se o valor em $t1 for igual ao valor em $t2

beq $t1, $t2, L1

# Instrução BNE

# Vai para a instrução na posição L1 se o valor em $t1 for diferente do valor em $t2

bne $t1, $t2, L1

# Instrução SLT 

# Se $t2 < $t3, coloca 1 em $t1; Senão, coloca 0 em $t1

slt $t1, $t2, $t3

# Instrução SLTI

# Se $t2 < 100, coloca 1 em $t1; Senão, coloca 0 em $t1

slti $t1, $t2, 100

# Desvios Incondicionais

# Instrução J

# Vai para a instrução rotulada como L1

j L1

# Instrução JR

# Vai para a instrução cujo endereço está armazenado em $t2

jr $t2







##