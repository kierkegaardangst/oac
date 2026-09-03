.text
.globl main

main:
    # Load values
    li $t0, 1         # $t0 = 1
    li $t1, 2         # $t1 = 2
    
    add $t2, $t0, $t1   # $t2 = $t0 + $t1 (1 + 2 = 3)
    sub $t3, $t0, $t1   # $t3 = $t0 - $t1 (1 - 2 = -1)

    syscall