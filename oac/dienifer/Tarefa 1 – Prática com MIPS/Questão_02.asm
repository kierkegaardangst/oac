# Questão 2: 

# Encontre a soma dos números múltiplos de 3 contidos no seguinte intervalo de valores:
# 1,2,3...,299,300

ori $s0, $zero, 2		# Inicializa $s0 com 1 - Contador
 
ori $s1, $zero, 0		# Inicializa $s1 com 0 - Somatorio 

ori $s2, $zero, 301		# Inicializa $s2 com 303 - Auxiliar

ori $s3, $zero, 3 		# Inicializa $s3 com 3 - Auxiliar

LOOP: 	

	addi $s0, $s0, 1 	# Incrementa $s0

	beq $s0, $s2, FIM 	# Se $s0 == $s2, vai para FIM
		
	div $s0, $s3		# Realiza a divisão $s0 / 3
	
	mfhi $s4  		# Armazena o resto da divisão em $s4
	
	bne $s4, $zero, LOOP	# Se $s4 != 0, vai para LOOP
	
	add $s1, $s1, $s0	# Se for múltiplo de 3, adiciona o valor de $s0 a $s1
	
	j LOOP			# Repete o LOOP
	
FIM:

	# Resultado está em $s1
