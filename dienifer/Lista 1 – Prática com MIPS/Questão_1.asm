# Lista 1 - Pratica com MIPS

# Questão 1: 

# Faça um programa que some os números decimais 527, -372, 225 e -794 
# e escreva o resultado no registrador $t0. 
# NÃO utilize a instrução sub

ori $t1, $zero, 527  # Coloca no registrador $t1 o valor 572

ori $t2, $zero, 372  # Coloca no registrador $t2 o valor 372
nor $t2, $t2, $zero  # Complemento de 1 - Copia em $t2 o valor de $t2 negado
addi $t2, $t2, 1     # Complemento de 2 - Adiciona 1 em $t2

ori $t3, $zero, 225  # Coloca no registrador $t3 o valor 225

ori $t4, $zero, 794  # Coloca no registrador $t4 o valor 794
nor $t4, $t4, $zero  # Complemento de 1 - Copia em $t4 o valor de $t4 negado
addi $t4, $t4, 1     # Complemento de 2 - Adiciona 1 em $t4

add $t1, $t1, $t2    # Adiciona em $t1 a soma de $t1 com $t2
add $t3, $t3, $t4    # Adiciona em $t3 a soma de $t3 com $t4

add $t0, $t1, $t3    # Adiciona em $t0 a soma de $t1 com $t3

# >"<
