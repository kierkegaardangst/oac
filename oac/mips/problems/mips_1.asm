# Escreva um programa em MIPS que some os inteiros de 1 até N e armazene
# o resultado na memória. Considere N = 10.

.data
    vector: .word 10, 20, 30, 2147483647 # Array
    output: .word 0
.text
    la $t0, vector           # $t0 pointer to the start of the array
    lw $t1, 0($t0)           # $t1 = 10 (N)
    lw $t2, 4($t0)           # $t2 = 20
    lw $t3, 8($t0)           # $t3 = 30
    lw $t4, 12($t0)          # $t4 = 2147483647 (can store a value of 32 bits)
    
    li $a0, 1
    bne $a0, $t1, loop
loop:
    beq $a0, $t1, store
    addi $a0, $a0, 1
    j loop

store:
    la $a1, output #a1 receives the address of output
    sw $a0, 0($a1) # store content of a0 into the address inside a1, the address of output in the memory
    
    # test: a2 receives the value inside the address of a1
    lw $a2, 0($a1)

end:
    li $v0, 10
    syscall
	