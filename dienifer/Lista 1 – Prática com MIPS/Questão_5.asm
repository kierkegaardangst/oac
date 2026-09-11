# Lista 1 - Pratica com MIPS

# Questão 5:

addi $t1, $zero, 0    # Adiciona em $t1 o valor de x
addi $t2, $zero, 8    # Adiciona em $t2 o valor de y

# Operação 9x

ori $t5, $zero, 9     # Coloca no registrador $t5 o valor 9

mult $t5, $t1         # Operação; $t5 x $t1
mflo $t5              # Move o resultado de lo para $t5

# Operação 3y

ori $t6, $zero, 3     # Coloca no registrador $t6 o valor 3

mult $t6, $t2         # Operação; $t6 x $t2
mflo $t6              # Move o resultado de lo para $t6

# Operação -7

ori $t7, $zero, 7     # Coloca no registrador $t7 o valor 7

nor $t7, $t7, $zero   # Complemento de 1 - Copia em $t7 o valor de $t7 negado
addi $t7, $t7, 1      # Complemento de 2 - Adiciona 1 em $t7
 
# Operação 2x  

ori $s0, $zero, 2     # Coloca no registrador $s0 o valor 2

mult $s0, $t1         # Operação; $s0 x $t1
mflo $s0              # Move o resultado de lo para $s0

# Operação -y       

nor $s1, $t2, $zero   # Complemento de 1 - Copia em $s1 o valor de $t2 negado
addi $s1, $s1, 1      # Complemento de 2 - Adiciona 1 em $s1

# Operação 8  

ori $s2, $zero, 8     # Coloca no registrador $s2 o valor 8

# Somas

add $s3, $t5, $t6     # Adiciona em $s3 a soma de $t5 e $t6
add $s3, $s3, $t7     # Adiciona em $s3 a soma de $s3 e $t7

add $s4, $s0, $s1     # Adiciona em $s4 a soma de $s0 e $s1
add $s4, $s4, $s2     # Adiciona em $s4 a soma de $s4 e $s2

div $s3, $s4          # Operação; $s3 % $s4

mfhi $t4              # Move o resultado de hi para $t4
mflo $t3              # Move o resultado de lo para $t3

# Responda o que acontece quando x = 0 e y = 8

# O programa executa sem erros até o momento da operação de divisão, onde ocorre uma exceção de divisão por zero.

# Devido a essa exceção, o programa não realiza a divisão e os valores nos registradores $t4 e $t3 não são alterados

# O programa não mostra nenhum aviso a respeito da divisão por zero.

# >"<