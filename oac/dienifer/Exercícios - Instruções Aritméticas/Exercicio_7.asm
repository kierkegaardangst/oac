# 7. Escreva um programa que calcule o valor de 4x - 2y + 3z (armazene os valores de x, y e z em $t1, $t2 e $t3, respectivamente) 
# e coloque o resultado em $t7. 
# Faça testes com alguns valores diferentes de x, y e z. 
# Utilize apenas instruções já vistas na disciplina.

ori $t1, $zero, 2 # x
ori $t2, $zero, 2 # y
ori $t3, $zero, 2 # z

add $t4, $t1, $t1 # x + x
add $t4, $t4, $t4  

ori $t5, $zero, 2

mult $t5, $t2
mflo $t5

nor $t5, $t5, $zero
addi $t5, $t5, 1

ori $t6, $zero, 3

mult $t6, $t3
mflo $t6

add $t4, $t4, $t5
add $t7, $t4, $t6

# >"< 
