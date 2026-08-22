# Lista 1 - Pratica com MIPS

# Questão 4: 

# Faça um programa que calcule a seguinte equação: y = 3x^2 − 5x + 7.

addi $t5, $zero, 2   # Adiciona em $t5 o valor de x
addi $t7, $zero, 7   # Adiciona em $t7 o valor 7
 
mult $t5, $t5        # Operação: x^2 
mflo $t1             # Move o resultado de lo para $t1

add $t2, $t1, $t1    # Operação: 2x = x + x
add $t2, $t2, $t1    # Operação: 3x = 2x + x

add $t3, $t5, $t5    # Operação: 2x = x + x
add $t3, $t3, $t3    # Operação: 4x = 2x + 2x
add $t3, $t3, $t5    # Operação: 5x = 4x + x

nor $t3, $t3, $zero  # Complemento de 1 - Copia em $t3 o valor de $t3 negado
addi $t3, $t3, 1     # Complemento de 2 - Adiciona 1 em $t3

add $t6, $t2, $t3    # Adiciona em $t6 a soma de $t2 com $t3
add $t6, $t6, $t7    # Adiciona em $t6 a soma de $t6 com $t7

# Se for ultilizado (ori) no lugar de (addi):

# Numeros positivos: Funciona normalmente

# ori $t5, $zero, 2

# Numeros negativos: Apresenta erro. "Extended (pseudo) instruction or format not permitted."

# ori $t5, $zero, -3

# >"<