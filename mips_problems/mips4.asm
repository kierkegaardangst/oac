# FOR (int i =0; i < n; i++)

loop:
	add $t0, $zero, $zero
	beq $t0, %t1, exit
	addi $t0, $t0, 1
	j loop
exit: