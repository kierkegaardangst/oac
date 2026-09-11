.data

v0: .word 4
v1: .word 4
v2: .word 4
v3: .word 4
v4: .word 4
v5: .word 4
v6: .word 4
v7: .word 4

soma: .space 4

.text  

lui $t0, 0x1001

addi $t2, $zero, 0 # cont = 0

LOOP: 	lw $s0, 0x0($t0) 

	addi $s0, $s0, 1 	# Adiciona 1 no valor de s0
	
	add $t1, $t1, $s0 	# Somatorio -> t1 = t1 + s0
	
	addi $s0, $s0, 4 	# deslocamento
	
	addi $t2, $t2, 1 	# cont++
	
	slti $t6, $t2, 8 	# t2 < 8
	
	beq $t6, $zero, FIM # se forem iguais -> fim
	
	j LOOP 

FIM:

	sw $t1, 0x20($t0) 	# grava na memoria
	
#---------------------------------#

# lw $s0, 0x0($t0)
# addi $s0, $s0, 1
# add $t1, $t1, $s0

# lw $s1, 0x4($t0)
# addi $s1, $s1, 1
# add $t1, $t1, $s1

# lw $s2, 0x8($t0)
# addi $s2, $s2, 1
# add $t1, $t1, $s2

# lw $s3, 0xC($t0)
# addi $s3, $s3, 1
# add $t1, $t1, $s3

# lw $s4, 0x10($t0)
# addi $s4, $s4, 1
# add $t1, $t1, $s4

# lw $s5, 0x14($t0)
# addi $s5, $s5, 1
# add $t1, $t1, $s5

# lw $s6, 0x18($t0)
# addi $s6, $s6, 1
# add $t1, $t1, $s6

# lw $s7, 0x1C($t0)
# addi $s7, $s7, 1
# add $t1, $t1, $s7

#---------------------------------#

	
			
