# 3. Escreva um programa que leia um valor x > 0 da memória (posição 0x10010000) e calcule o x-ésimo termo da série de Fibonacci:
# 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, ...
# Escreva o x-ésimo termo da série (y) em uma palavra (4 bytes) de memória. 
# O resultado deve ser armazenado, obrigatoriamente, na posição 0x10010004 da memória .data. 
# Inicie o código com:

#1º termo (x = 1): 0
#2º termo (x = 2): 1
#3º termo (x = 3): 0 + 1 = 1
#4º termo (x = 4): 1 + 1 = 2
#5º termo (x = 5): 1 + 2 = 3
#6º termo (x = 6): 2 + 3 = 5

.data

x: .word 7
y: .space 4

.text

lui $t0, 0x1001

lw $t1, 0x0($t0)

addi $s0, $zero, 0 # cont

addi $s1, $zero, 1
addi $s2, $zero, 0
addi $s3, $zero, 0

LOOP:	slt $t2, $s0, $t1 # cont < 7

	beq $t2, $zero, FIM # se $t5 == $zero -> fim
	
       	or $s3, $zero, $s1
       	add $s1, $s1, $s2
       	or $s2, $zero, $s3	
	
	addi $s0, $s0, 1  # cont++
	
	j LOOP

FIM:	sw $s2, 0x4($t0)
