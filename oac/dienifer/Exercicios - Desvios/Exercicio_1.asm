# 1. Escreva um programa que leia dois halfwords (a e b) da memória 
# e calcule a sua divisão se os dois valores forem diferentes 
# e a sua multiplicação se os dois valores forem iguais. 
# Escreva o resultado (y) em uma palavra (4 bytes) de memória. 
# O resultado deve ser armazenado, obrigatoriamente, na posição 0x10010004 da memória .data. 
# Inicie o código com:

.data

a: .half 10
b: .half 5
y: .space 4

.text

lui $t0, 0x1001

lh $t1, 0x0 ($t0)
lh $t2, 0x2 ($t0)

beq $t1, $t2, MULTI

	div $t1, $t2
	mflo $s0
	
	sw $s0, 0x4($t0)
	
	j EXIT

MULTI:  mult $t1, $t2
      	mflo $s0
      	
      	sw $s0, 0x4($t0)
      	
EXIT: