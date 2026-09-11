# 9. Faça um programa que calcule a seguinte equação:
# y = 9x + 7 / 2x + 8
# Armazene x em $t1, com a instrução addi $t1, $zero, x, substituindo x pelo valor desejado, 
# e sempre que precisar o valor de x, utilize o valor armazenado no registrador $t1.
# Armazene o quociente da divisão em $t2 e o resto em $t3.
# Responda o que acontece quando x = -4.

addi $t1, $zero, -4 # x

add $t4, $t1, $t1 # 2x = x + x 
add $t4, $t4, $t4 # 4x = 2x + 2x
add $t4, $t4, $t4 # 8x = 4x + 4x
add $t4, $t4, $t1 # 9x = 8x + x

addi $t5, $zero, 7 # $t5 = 7

add $s0, $t4, $t5 # $s0 = $t4 + $t5

add $t6, $t1, $t1  # $t6 = x + x

addi $t7, $zero, 8 # $t7 = 8

add $s1, $t6, $t7 # $s1 = $t6 + $t7

div $s0, $s1 # $s0 / $s1
mflo $t2 # quociente
mfhi $t3 # resto

# >"<