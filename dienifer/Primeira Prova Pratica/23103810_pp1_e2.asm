.data

x: .word 5 # Ox10010000
y: .word 5
z: .word 5
w: .space 4

.text

lui $t0, 0x1001

lw $t1, 0x0($t0)
lw $t2, 0x4($t0)
lw $t3, 0x8($t0)

# w = 5x - 2y + 3z - 4

addi $s0, $zero, 5 	# s0 = 5
mult $s0, $t1  	# 5x
mflo $s0 		# s0 = 5x

addi $s1, $zero, 2 	# s1 = 2
mult $s1, $t2 	# 2y
mflo $s1 		# s1 = 2y
nor $s1, $s1, $zero	
addi $s1, $s1, 1	# -2y

addi $s2, $zero, 3	# s2 = 3
mult $s2, $t2	# 3z
mflo $s2		# s2 = 3z

addi $s3, $zero, -4 # s2 = -4

add $s0, $s0, $s1 	# s0 = s0 + s1
add $s2, $s2, $s3	# s2 = s2 + s3
add $s4, $s0, $s2	# s4 = s0 + s2

sw $s4, 0xC($t0)    # manda o valor de s4 pra memoria





















