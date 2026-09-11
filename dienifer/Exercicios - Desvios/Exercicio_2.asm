# 2. Escreva um programa que calcule:
# 1 + 2 + 3 + … + 333
# Escreva o resultado (y) em uma palavra (4 bytes) de memória. 
# O resultado deve ser armazenado, obrigatoriamente, na posição 0x10010000 da memória .data. 
# Inicie o código com:

.data

y: .space 4

.text

lui $s0, 0x1001

addi $t0, $zero, 0 # Contador
addi $t1, $zero, 0 # Soma


LOOP:	
	slti $t2, $t0, 334 
	
	beq $t2, $zero FIM    
	
	add $t1, $t1, $t0	
	
	addi $t0, $t0, 1

	j LOOP
	
FIM: 
	sw $t1, 0x0($s0)
	
# >"<
