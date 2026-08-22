# Lista 1 - Pratica com MIPS

# Questão 3: 

# Escreva um programa que calcule o valor de 8x - 4y + 6z 
# (armazene os valores de x, y e z em $t1, $t2 e $t3, respectivamente) 
# e coloque o resultado em $t7.

ori $t1, $zero, 2    # Coloca no registrador $t1 o valor de x
ori $t2, $zero, 2    # Coloca no registrador $t2 o valor de y
ori $t3, $zero, 2    # Coloca no registrador $t3 o valor de z

add $t4, $t1, $t1    # Operação; 2x = x + x
add $t4, $t4, $t4    # Operação: 4x = 2x + 2x 
add $t4, $t4, $t4    # Operação: 8x = 4x + 4x 

add $t5, $t2, $t2    # Operação; 2y = y + y
add $t5, $t5, $t5    # Operação: 4y = 2y + 2y 

nor $t5, $t5, $zero  # Complemento de 1 - Copia em $t5 o valor de $t5 negado
addi $t5, $t5, 1     # Complemento de 2 - Adiciona 1 em $t5

add $t6, $t3, $t3    # Operação; 2z = z + z
add $t6, $t6, $t6    # Operação: 4z = 2z + 2z 
add $t6, $t6, $t3    # Operação: 5z = 4z + z 
add $t6, $t6, $t3    # Operação: 6z = 5z + z 

add $t7, $t4, $t5    # Adiciona em $t7 a soma de $t4 com $t5
add $t7, $t7, $t6    # Adiciona em $t7 a soma de $t7 com $t6

# >"<