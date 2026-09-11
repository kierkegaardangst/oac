# Questão 1 -  Versão 2: 

# Escreva um programa que leia 10 palavras (words) armazenadas a partir do endereço 0x10010000 e
# calcule o somatório dos valores e a média. Escreva os valores nos respectivos endereços de memória de dados

.data

.word 1 
.word 2
.word 3
.word 4
.word 5
.word 6
.word 7
.word 8
.word 9
.word 10

soma: .space 4
média: .space 4

.text

ori $s5, $zero, 10	# Auxiliar na divisão

lui $t0, 0x1001		# Carrega o endereço base da memória em $t0

lw $t1, 0x0($t0)	# Carrega o valor da memória para $t1
lw $t2, 0x4($t0)	# Carrega o valor da memória para $t2
lw $t3, 0x8($t0)	# Carrega o valor da memória para $t3
lw $t4, 0xc($t0)	# Carrega o valor da memória para $t4
lw $t5, 0x10($t0)	# Carrega o valor da memória para $t5
lw $t6, 0x14($t0)	# Carrega o valor da memória para $t6
lw $t7, 0x18($t0)	# Carrega o valor da memória para $t7
lw $s0, 0x1c($t0)	# Carrega o valor da memória para $s0
lw $s1, 0x20($t0)	# Carrega o valor da memória para $s1
lw $s2, 0x24($t0)	# Carrega o valor da memória para $s2

add $t1, $t1, $s1 	# $t1 = 1 + 9
add $t2, $t2, $s0	# $t2 = 2 + 8
add $t3, $t3, $t7	# $t3 = 3 + 7
add $t4, $t4, $t6	# $t4 = 4 + 6
add $t5, $t5, $s2	# $t5 = 5 + 10

add $t1, $t1, $t2	# $t1 = 10 + 10
add $t3, $t3, $t4	# $t3 = 10 + 10
add $t1, $t1, $t3	# $t1 = 20 + 20
add $s3, $t1, $t5	# $s3 = 40 + 10

div $s3, $s5		# Calcula a média: soma / 10

mflo $s4 		# Move o resultado da divisão para $s4

sw $s3, 0x28($t0) 	# Armazena o somatório na memória
sw $s4, 0x2c($t0)	# Armazena a média na memória