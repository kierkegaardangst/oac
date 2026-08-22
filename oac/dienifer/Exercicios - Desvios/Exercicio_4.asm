# 4. Uma temperatura, armazenada em $t0, pode ficar em dois intervalos:

# 20 ≤ temp ≤ 40 e
# 60 ≤ temp ≤ 80.

# Escreva um programa que coloque uma flag (registrador $t1) para 1 se a temperatura está entre os valores permitidos e para 0 caso contrário.
# Inicie o código com a instrução: ori $t0, $zero, temperatura, substituindo temperatura por um valor qualquer.

ori $t0, $zero, 80

ori $t2, $zero, 1

slti $s0, $t0, 20   	# $t0 < 20 = 1

beq $s0, $t2, Fora  	# $s0 == $t2 -> Fora

slti $s0, $t0, 41   	# $t0 < 41

beq $s0, $t2, Dentro 	# $s0 == $t2 -> Dentro

slti $s0, $t0, 81

beq $s0, $zero, Fora 

slti $s0, $t0, 60

beq $s0, $t2, Fora

j Dentro

Dentro:

	ori $t1, $zero, 1

	j fim

Fora:

	ori $t1, $zero, 0
	
fim: 