# Questão 1: 

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

lui $t0, 0x1001			# Carrega o endereço base da memória em $t0

ori $s0, $zero, 0 		# Inicializa contador com 0

ori $s1, $zero, 0 		# Inicializa somatório com 0

ori $s4, $zero, 10		# Inicializa auxiliar com 10

LOOP: 	

	beq $s0, $s4, FIM 	# Se $s0 == $s4, sai do LOOP
	
	sll $t2, $s0, 2 	# $t2 = $s0 * 4 - Calcula o deslocamento
	
	add $t3, $t0, $t2 	# $t3 = $t0 + $t2 - Endereço do elemento atual na memória
	
	lw $t4, 0($t3) 		# Carrega o valor da memória para $t4

	add $s1, $s1, $t4	# $s1 = $s1 + $s5 - Atualiza o somatório
		
	addi $s0, $s0, 1 	# $s0 = $s0 + 1 - Incrementa contador
	
	j LOOP			# Repete o LOOP
	
FIM:

	sw $s1, 40($t0) 	# Armazena o somatório na memória
	
	div $s1, $s0		# Calcula a média: soma / 10
	
	mflo $s2		# Move o resultado da divisão para $s2
	
	sw $s2, 44($t0)		# Armazena a média na memória
	

