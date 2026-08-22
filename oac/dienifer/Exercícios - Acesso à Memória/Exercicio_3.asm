# 3. Faça um programa que calcule o seguinte polinômio usando o método de Horner:
# y = - ax^4 + bx^3 - cx^2 + dx - e
# Utilize endereços de memória para armazenar o valor de a, b, c, d, e, x e o resultado y. 
# Cada valor deve ocupar 4 bytes na memória (.word), assim como para o resultado (.space 4). 
# Utilize as sete primeiras posições da memória .data para armazenar, 
# consecutivamente, a, b, c, d, e, x e y, iniciando o código com:

.data
a: .word -3
b: .word 7
c: .word 5
d: .word -2
e: .word 8
x: .word 4
y: .space 4

.text

lui $t0, 0x1001

lw $t1, 0x0($t0) # a
lw $t2, 0x4($t0) # b
lw $t3, 0x8($t0) # c
lw $t4, 0xC($t0) # d
lw $t5, 0x10($t0) # e
lw $t6, 0x14($t0) # x

mult $t6, $t6
mflo $s0 # x^2
mult $s0, $t6
mflo $s1 # x^3
mult $s1, $t6
mflo $s2 # x^4

mult $t1, $s2
mflo $t1
nor $t1, $t1, $zero
addi $t1, $t1, 1

mult $t2, $s1
mflo $t2

mult $t3, $s0
mflo $t3
nor $t3, $t3, $zero
addi $t3, $t3, 1

mult $t4, $t6
mflo $t4

nor $t5, $t5, $zero
addi $t5, $t5, 1

add $t1, $t1, $t2
add $t3, $t3, $t4
add $t1, $t1, $t3
add $t5, $t5, $t1

sw $t5 0x18 ($t0)

# >"<
