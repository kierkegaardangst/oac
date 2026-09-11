# 4. Escreva a sequência 0x12345678 em $t1.
# A seguir, escreva um código que inverta a sequência, escrevendo 0x87654321 em $t2. 
# Obviamente o código deve inverter os bits de $t1 e não simplesmente escrever 0x87654321 diretamente em $t2.

ori $t1, $zero, 0x1234
sll $t1, $t1, 16
ori $t1, $t1, 0x5678

