# Questão 2 - Versão 2: 

# Encontre a soma dos números múltiplos de 3 contidos no seguinte intervalo de valores:
# 1,2,3...,299,300

ori $s1, $zero, 0		# Inicializa $s1 com 0 - Somatorio

ori $s2, $zero, 303		# Inicializa $s2 com 303 - Auxiliar

ori $s3, $zero, 3 		# Inicializa $s3 com 3 - Contador

LOOP:	

	beq $s3, $s2, FIM	# Se $s3 == $s2, sai do LOOP

	add $s1, $s1, $s3	# Se for múltiplo de 3, adiciona o valor de $s3 a $s1

	addi $s3, $s3, 3	# Incrementa $s3

	j LOOP 			# Repete o LOOP

FIM:

	# Resultado está em $s1