.text

addi $t1, $zero, 48 # $t1 = 2 
addi $t2, $zero, 8  # t1 / 8
addi $t5, $zero, 3  # triplo

addi $s0, $zero, 0 	# cont e quociente

LOOP: 	
	slt $s1, $zero, $t1 # t3 < t1
	beq $s1, $zero, FIM	# se s1 = 0 -> FIM
	sub $t1, $t1, $t2	# t1 = t1 - t2
	addi $s0, $s0, 1	# t4 = t4 + 1 -> cont++
	j LOOP

FIM: 	
	mult $s0, $t5	# s0 . t5
	mflo $t7		# armazena em t7
	