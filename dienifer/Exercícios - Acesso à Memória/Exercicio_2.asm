# 2. Faça um programa que calcule o seguinte polinômio usando o método de Horner:
# y = 9a^3 - 5a^2 + 7a + 15
# Utilize endereços de memória para armazenar o valor de a e o resultado y. 
# Cada valor deve ocupar 4 bytes na memória (.word), assim como para o resultado (.space 4). 
# Utilize as duas primeiras posições da memória .data para armazenar, consecutivamente, a e y, iniciando o código com:
# .data
# a: .word 3
# y: .space 4
# Observe como o método de Horner é mais eficiente (faz menos operações) que calcular o polinômio de forma sequencial.

.data

a: .word 3
y: .space 4

.text

lui $t0, 0x1001

lw $t1, 0x0 ($t0)

addi $t2, $zero, 9 
addi $t3, $zero, -5
addi $t4, $zero, 7
addi $t5, $zero, 15

mult $t1, $t1
mflo $s0
mult $t1, $s0
mflo $s0

mult $t2, $s0
mflo $t2

mult $t1, $t1
mflo $s0

mult $t3, $s0
mflo $t3

mult $t4, $t1
mflo $t4

add $t2, $t2, $t3
addi $t4, $t4, 15

add $t5, $t2, $t4

sw $t5, 0x4 ($t0)

# >"<
