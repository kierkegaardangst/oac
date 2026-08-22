# 1. Faça um programa que calcule a seguinte equação:
# y = 32ab - 3a + 7b - 13
# Utilize endereços de memória para armazenar o valore de a, b e o resultado y. 
# Cada valor deve ocupar 4 bytes na memória (.word), assim como para o resultado (.space 4). 
# Utilize as três primeiras posições da memória .data para armazenar, consecutivamente, a, b e y, iniciando o código com:

.data

a: .word 3
b: .word 5

y: .space 4

.text

lui $t0, 0x1001

lw $t1, 0x0($t0)
lw $t2, 0x4($t0)

addi $t3, $zero, 32
mult $t3, $t1
mflo $t3
mult $t3, $t2
mflo $t3

addi $t4, $zero, 3
mult $t4, $t1
mflo $t4

nor $t4, $t4, $zero
addi $t4, $t4, 1

addi $t5, $zero, 7
mult $t5, $t2
mflo $t5

addi $t6, $zero, 13
nor $t6, $t6, $zero
addi $t6, $t6, 1

add $s0, $t3, $t4
add $s1, $t5, $t6

add $s0, $s0, $s1

sw $s0, 0x8($t0)

# >"< 
