.data

	# Arquivos 
	
	ArquivoNivel: .asciiz "C:\\Users\\Dienifer Ledebuhr\\Documents\\AOC_UFPel\\Projeto Final - Miple\\ArquivoNivel.bin"
	
		# ArquivoNivel: Armazena o nível atual do jogo.
		
		# O arquivo contém um contador que é incrementado a cada vez que o jogo é iniciado.
	
		# Esse contador é usado para selecionar a senha correspondente ao nível atual no arquivo de senhas (ArquivoSenhas).
	
		# O jogo possui 365 níveis disponíveis, e o contador garante que o jogador avance progressivamente.
						
	ArquivoVitorias: .asciiz "C:\\Users\\Dienifer Ledebuhr\\Documents\\AOC_UFPel\\Projeto Final - Miple\\ArquivoVitorias.bin"
	
		# ArquivoVitorias: Armazena a quantidade de vitórias do jogador.
		
		# Uma vitoria é registrada quando o jogador consegue adivinhar a senha dentro do número máximo de tentativas.
	
	ArquivoDerrotas: .asciiz "C:\\Users\\Dienifer Ledebuhr\\Documents\\AOC_UFPel\\Projeto Final - Miple\\ArquivoDerrotas.bin"
	
		# ArquivoDerrotas: Armazena a quantidade de derrotas do jogador.
	
		# Uma derrota é registrada quando o jogador não consegue adivinhar a senha dentro do número máximo de tentativas.
	
	ArquivoSenhas: .asciiz "C:\\Users\\Dienifer Ledebuhr\\Documents\\AOC_UFPel\\Projeto Final - Miple\\ArquivoSenhas.txt"
	
		# ArquivoSenhas: Contém 365 senhas disponíveis para o jogo.
	
		# Cada senha é uma palavra de 5 letras, armazenada em sequência, em letras maiúsculas e sem espaços.
	
		# O nível atual do jogo (contido em ArquivoNivel) é usado para selecionar a senha correspondente neste arquivo.
	
	ArquivoDicionario: .asciiz "C:\\Users\\Dienifer Ledebuhr\\Documents\\AOC_UFPel\\Projeto Final - Miple\\ArquivoDicionario.txt"

		# ArquivoDicionario: Armazena uma lista de palavras válidas da língua portuguesa.

		# Este arquivo é usado para verificar se a palavra inserida pelo jogador é uma palavra real e válida.
		
		# Isso impede que o jogador insira palavras inexistentes ou inválidas durante o jogo.
	
	# Vetores
	
	VerificacaoTotal: .word 0, 0, 0, 0, 0 		
	
	# Vetor que armazena a verificação de letras corretas e na posição correta.	
	# Cada posição corresponde a uma letra da palavra inserida pelo jogador.
	# 1 = Letra correta e na posição correta.
	# 0 = Letra incorreta ou na posição errada.
	
	VerificacaoParcial: .word 0, 0, 0, 0, 0
	
	# Vetor que armazena a verificação de letras presentes na palavra, mas em posições incorretas.
	# 1 = Letra presente na palavra, mas na posição errada.
	# 0 = Letra não presente ou já verificada.
	
	VerificacaoLetrasUsadas: .word 0, 0, 0, 0, 0
	
	# Vetor que armazena as letras já usadas em tentativas anteriores.
	# 1 = Letra já usada.
	# 0 = Letra ainda não usada.
	
	# Strings
	
	StringMenu: .asciiz "|-------------------------------------------------------------------------|\n|---|                             M E N U                             |---|\n|-------------------------------------------------------------------------|\n| 1 | - Jogar	                                                          |\n| 2 | - Status		                                                  |\n| 3 | - Tutorial	 	                                          |\n| 4 | - Reiniciar Jogo	 	                                          |\n| 5 | - Sair	 	                                                  |\n|-------------------------------------------------------------------------|\n| Escolha: "
	
	StringLinha01: .asciiz "\n|-------------------------------------------------------------------------|\n"
	
	StringLinha02: .asciiz "|-------------------------------------------------------------------------|\n"
	
	StringBarra: .asciiz "\n"
	
	StringMenuErro: .asciiz "| - | Escolha Invalida 	                                                  |\n"
	
	StringTituloSenha: .asciiz "|-------------------------------------------------------------------------|\n|---|                            S E N H A                            |---|\n|-------------------------------------------------------------------------|\n"
	
	StringTentativa01: .asciiz "| x | "
	
	StringTentativa02: .asciiz " | "
	
	StringTentativa03: .asciiz "|                            "
	
	StringTentativa04: .asciiz "                            |"
	                          
	StringTentativa05: .asciiz "\n|-------------------------------------------------------------------------|\n| - | Palavra Invalida 	                                                  |\n|-------------------------------------------------------------------------|\n"
	
	StringTituloStatus: .asciiz "|-------------------------------------------------------------------------|\n|---|                           S T A T U S                           |---|\n|-------------------------------------------------------------------------|\n"
	
	StringStatus01: .asciiz "| ! | Fase Atual | "
	
	StringStatus02: .asciiz " / 365"
	
	StringStatus03: .asciiz "\n| ! | Vitorias   | "
	
	StringStatus04: .asciiz "\n| ! | Derrotas   | "
	
	StringSenha01: .asciiz "|                             Senha  |  "
	
	StringSenha02: .asciiz "                             |\n|-------------------------------------------------------------------------|\n"
	
	StringTituloVitoria: .asciiz "|-------------------------------------------------------------------------|\n|---|                          V I T O R I A                          |---|\n|-------------------------------------------------------------------------|\n"
	
	StringTituloDerrota: .asciiz "|-------------------------------------------------------------------------|\n|---|                          D E R R O T A                          |---|\n|-------------------------------------------------------------------------|\n"
	
	StringTituloSair: .asciiz "|-------------------------------------------------------------------------|\n|---|                             S A I R                             |---|\n|-------------------------------------------------------------------------|\n"
	
	StringTutorial01: .asciiz "|-------------------------------------------------------------------------|\n|---|                         T U T O R I A L                         |---|\n|-------------------------------------------------------------------------|\n| Descubra a palavra correta em até 6 tentativas.	                  |\n|-------------------------------------------------------------------------|\n| Após cada tentativa, o mapa indica o quão perto você está da solução.   |\n|-------------------------------------------------------------------------|\n| As tentativas não aceitam acentos, portanto, desconsidere-os.           |\n|-------------------------------------------------------------------------|\n| As palavras podem conter letras repetidas.                              |\n|-------------------------------------------------------------------------|\n| Uma nova palavra (senha) é gerada a cada nível.                         |\n|-------------------------------------------------------------------------|\n| O jogo possui 365 fases. Ao completar todas, você conclui o jogo!       |"
	
	StringTutorial02: .asciiz "\n|-------------------------------------------------------------------------|\n|---|                          E X E M P L O                          |---|\n|-------------------------------------------------------------------------|\n| x | CCOMP                                                               \n|-------------------------------------------------------------------------|\n|                            - | - | + | ! | -                            |\n|-------------------------------------------------------------------------|\n| A letra O faz parte da palavra e está na posição correta.  	 	  |\n|-------------------------------------------------------------------------|\n| A letra M faz parte da palavra, mas em outra posição.    		  |\n|-------------------------------------------------------------------------|\n| As letras I, N e L não fazem parte da palavra.           		  |\n|-------------------------------------------------------------------------|\n"
	
	StringJogoConcluido: .asciiz "|-------------------------------------------------------------------------|\n|---|                  J O G O     C O N C L U I D O                  |---|\n|-------------------------------------------------------------------------|\n|---|                               >.<                               |---|\n|-------------------------------------------------------------------------|\n"
	
	StringReiniciarJogo: .asciiz "|-------------------------------------------------------------------------|\n|---|                 J O G O     R E I N I C I A D O                 |---|\n|-------------------------------------------------------------------------|\n"
	
	# Variaveis
	
	TempPalavra: .space 6				# Espaço reservado para armazenar temporariamente uma palavra de 5 letras + 1 byte para o caractere nulo (\0).
	Buffer: .space 6				# Espaço reservado para armazenar a palavra inserida pelo jogador.
	Senha: .space 6					# Espaço reservado para armazenar a senha (palavra a ser adivinhada) do nível atual (5 letras + 1 byte para o caractere nulo).
		
	.align 2					# Alinha os próximos dados em um endereço múltiplo de 4 (necessário para variáveis de 4 bytes).

	Nivel: .space 4					# Armazena o nível atual do jogo (um inteiro de 4 bytes).
	Vitoria: .space 4				# Armazena o número de vitórias do jogador (um inteiro de 4 bytes).
	Derrota: .space 4				# Armazena o número de derrotas do jogador (um inteiro de 4 bytes).
	
.text

	.globl Main
	
Main: 

	li $v0, 4              				# Código para imprimir string (syscall 4)
    	la $a0, StringMenu          			# Carrega o endereço da string "StringMenu" em $a0
    	syscall						# Executa a syscall
    	
    	li $s5, 0					# Inicializa o registrador $s5 com 0 (usado para armazenar a escolha do usuário)
    	
    	li $v0, 5					# Código para ler um inteiro (syscall 5)
    	syscall						# Executa a syscall
    	move $s5, $v0					# Move o valor lido para o registrador $s5
    	
    	li $v0, 4					# Código para imprimir string (syscall 4)
	la $a0, StringLinha02				# Carrega o endereço da string "StringLinha02" em $a0
	syscall						# Executa a syscall
	
	beq $s5, 1, Jogar				# Se $s5 == 1, pula para o rótulo "Jogar" - Iniciar o jogo
	beq $s5, 2, Status				# Se $s5 == 2, pula para o rótulo "Status" - Exibir status do jogo
	beq $s5, 3, Tutorial				# Se $s5 == 3, pula para o rótulo "Tutorial" - Exibir tutorial
	beq $s5, 4, ReiniciarJogo			# Se $s5 == 4, pula para o rótulo "ReiniciarJogo" - Nivel: 0
	beq $s5, 5, Sair				# Se $s5 == 5, pula para o rótulo "Sair" - Encerrar o jogo
	beq $s5, 6, ReiniciarJogo			# Se $s5 == 6, pula para o rótulo "ReiniciarJogo" - Nivel: 365
	
	li $v0, 4					# Código para imprimir string (syscall 4)
	la $a0, StringMenuErro				# Carrega o endereço da string "StringMenuErro"
	syscall						# Executa a syscall
	
	j Main						# Pula para o rótulo "Main"

# --------------------------------------------------------------------------------------------------------------------------------- # Sair

# Sair: Encerra a execução do programa

Sair: 

	li $v0, 4                    			# Codigo para imprimir uma string (syscall 4)
    	la $a0, StringTituloSair  			# Carrega o endereço da string "StringTituloSair" em $a0
    	syscall                      			# Executa a syscall

	li $v0, 10					# Código encerrar programa (syscall 10)
	syscall						# Executa a syscall

# --------------------------------------------------------------------------------------------------------------------------------- # ReiniciarJogo

# ReiniciarJogo: Reseta os valores do jogo e retorna ao menu principal

ReiniciarJogo:

	jal ReiniciarNiveis				# Chama a subrotina "ReiniciarNiveis"
	
	jal ReiniciarVitorias				# Chama a subrotina "ReiniciarVitorias"
		
	jal ReiniciarDerrotas				# Chama a subrotina "ReiniciarDerrotas"
	
	li $v0, 4					# Codigo para imprimir uma string (syscall 4)
	la $a0, StringReiniciarJogo			# Carrega o endereço da string "StringReiniciarJogo" em $a0
	syscall						# Executa a syscall
	
	j Main						# Pula para o rótulo "Main"

# --------------------------------------------------------------------------------------------------------------------------------- # Tutorial	

# Tutorial: Exibe as instruções do jogo

Tutorial:

	li $v0, 4					# Codigo para imprimir uma string (syscall 4)
	la $a0, StringTutorial01			# Carrega o endereço da string "StringTutorial01" em $a0
	syscall						# Executa a syscall
	
	li $v0, 4					# Codigo para imprimir uma string (syscall 4)
	la $a0, StringTutorial02			# Carrega o endereço da string "StringTutorial02" em $a0
	syscall						# Executa a syscall
	
	j Main						# Pula para o rótulo "Main"

# --------------------------------------------------------------------------------------------------------------------------------- # Status

# Status: Exibe o progresso do jogador no jogo

Status:
	
	jal LerArquivoNivel				# Chama a subrotina "LerArquivoNivel"
	
	lw $s4, Nivel					# Carrega o valor de "Nivel" no registrador $s4
	
	li $v0, 4					# Codigo para imprimir uma string (syscall 4)
	la $a0, StringTituloStatus			# Carrega o endereço da string "StringTituloStatus" em $a0
	syscall						# Executa a syscall
	
	li $v0, 4					# Codigo para imprimir uma string (syscall 4)
	la $a0, StringStatus01				# Carrega o endereço da string "StringStatus01" em $a0
	syscall						# Executa a syscall
	
	li $v0, 1					# Código para imprimir um inteiro (syscall 1)
	move $a0, $s4					# Move o valor do nível (em $s4) para o registrador $a0
	syscall						# Executa a syscall
	
	li $v0, 4					# Codigo para imprimir uma string (syscall 4)
	la $a0, StringStatus02				# Carrega o endereço da string "StringStatus02" em $a0
	syscall						# Executa a syscall
	
	jal LerArquivoVitoria				# Chama a subrotina "LerArquivoVitoria"
	
	lw $s4, Vitoria					# Carrega o valor de "Vitoria" no registrador $s4

	li $v0, 4					# Codigo para imprimir uma string (syscall 4)
	la $a0, StringStatus03				# Carrega o endereço da string "StringStatus03" em $a0
	syscall						# Executa a syscall
	
	li $v0, 1					# Código para imprimir um inteiro (syscall 1)
	move $a0, $s4					# Move o valor de vitórias (em $s4) para o registrador $a0
	syscall						# Executa a syscall
	
	jal LerArquivoDerrota				# Chama a subrotina "LerArquivoDerrota"
	
	lw $s4, Derrota					# Carrega o valor de "Derrota" no registrador $s4
	
	li $v0, 4					# Codigo para imprimir uma string (syscall 4)
	la $a0, StringStatus04				# Carrega o endereço da string "StringStatus04" em $a0
	syscall						# Executa a syscall
	
	li $v0, 1					# Código para imprimir um inteiro (syscall 1)
	move $a0, $s4					# Move o valor de derrotas (em $s4) para o registrador $a0
	syscall						# Executa a syscall
	
	li $v0, 4					# Codigo para imprimir uma string (syscall 4)
	la $a0, StringLinha01				# Carrega o endereço da string "StringLinha01" em $a0
	syscall						# Executa a syscall
	
	j Main						# Pula para o rótulo "Main"
	
# --------------------------------------------------------------------------------------------------------------------------------- # Jogar

# Jogar: Todo o processo de jogar


Jogar: 							# Preparar o jogo

	jal LerArquivoNivel				# Chama a subrotina "LerArquivoNivel"
	
	lw $s4, Nivel					# Carrega o valor do nível em $s4	
	
	beq $s4, 366, JogoConcluido			# Se $s4 == 366, pula para o rótulo "JogoConcluido"
	
	li $v0, 13					# Codigo para abrir um arquivo (syscall 13)
	la $a0, ArquivoSenhas				# Carrega o endereço do arquivo "ArquivoSenhas" em $a0
	li $a1, 0					# Modo de abertura: 0 para leitura
	syscall						# Executa a syscall
	move $s0, $v0					# Salva o descritor do arquivo (retornado em $v0) em $s0
	
	li $t2, -1					# Inicializa $t2 com -1		
	
LoopLeitura:
	
	beq $t2, $s4, FimLeitura			# Se $t2 == $s4, pula para o rótulo "FimLeitura"
		
	li $v0, 14					# Código para ler do arquivo (syscall 14)			
	move $a0, $s0					# Passa o descritor do arquivo (salvo em $s0) para $a0
	la $a1, Senha					# Carrega o endereço de "Senha" para armazenar a palavra lida
	li $a2, 5					# Número de bytes a serem lidos
	syscall						# Executa a syscall
		
	blez $v0, FimLeitura				# Se $v0 == 0, pula para o rótulo "FimLeitura"
		
	addi $t2, $t2, 1				# Incrementa o contador de níveis lidos ($t2) em 1

	j LoopLeitura					# Pula para o rótulo "LoopLeitura"
		
FimLeitura:

	li $v0, 16					# Código para fechar o arquivo (syscall 16)
	move $a0, $s0					# Passa o descritor do arquivo (salvo em $s0) para $a0
	syscall						# Executa a syscall
	
	jal AdicionarNivel				# Chama a subrotina "AdicionarNivel"
	
	li $v0, 4					# Código para imprimir uma string (syscall 4)
	la $a0, StringTituloSenha			# Carrega o endereço da string "StringTituloSenha" em $a0
	syscall						# Executa a syscall
	
	li $s5, 0					# Inicializa o contador de tentativas ($s5) com 0

LoopJogar:						# Jogar
	
    	beq $s5, 6, MensagemDerrota  			# Se ($s5) == 6, pula para o rótulo "MensagemDerrota"

Tentativas:

    	jal LerEntrada               			# Chama a subrotina "LerEntrada"
    	
    	jal VerificarExiste          			# Chama a subrotina "VerificarExiste"

    	beq $v0, 1, PalavraValida  			# Se a palavra for válida ($v0 == 1), pula para o rótulo "PalavraValida"
    	  		
    	beq $v0, 0, PalavraInvalida  			# Se a palavra for inválida ($v0 == 0), pula para o rótulo "PalavraInvalida"

    	j Tentativas     				# Pula para o rótulo "Tentativas"         		

PalavraInvalida:

    	li $v0, 4                    			# Código para imprimir uma string (syscall 4)
    	la $a0, StringTentativa05    			# Carrega o endereço da string "StringTentativa05" em $a0
    	syscall          				# Executa a syscall           

    	j Tentativas                 			# Pula para o rótulo "Tentativas"

PalavraValida:

    	addi $s5, $s5, 1             			# Incrementa o contador de tentativas válidas ($s5) em 1

    	li $t5, 0        				# Inicializa o contador de posições ($t5) com 0            
	li $t6, 5    					# Define o número máximo de posições ($t6) como 5                

    	la $t0, Senha					# Carrega o endereço da "Senha" em $t0                
    	la $s0, Buffer        				# Carrega o endereço do "Buffer" em $s0       

LoopPosicaoCorreta:

   	beq $t5, 5, FimPosicaoCorreta 			# Se todas as posições foram verificadas, pula para "FimPosicaoCorreta"

    	lb $t1, 0($t0)               			# Carrega um caractere da "Senha" em $t1
    	lb $s1, 0($s0)            			# Carrega um caractere do "Buffer" em $s1   

    	beq $t1, $s1, MarcarPosicaoCorreta 		# Se os caracteres forem iguais, pula para "MarcarPosicaoCorreta"

    	j AvancarPosicaoCorreta      			# Pula para o rótulo "AvancarPosicaoCorreta"

MarcarPosicaoCorreta:
    
    	la $t4, VerificacaoTotal     			# Carrega o endereço do vetor "VerificacaoTotal"
    	sll $t7, $t5, 2       				# Calcula o deslocamento para a posição atual       
    	add $t4, $t4, $t7 				# Adiciona o deslocamento ao endereço base           
    	li $t8, 1      					# Define o valor 1 para indicar posição correta              
    	sw $t8, 0($t4)      				# Armazena o valor no vetor "VerificacaoTotal"         

    	la $t9, VerificacaoLetrasUsadas 		# Carrega o endereço do vetor "VerificacaoLetrasUsadas"
    	sll $t7, $t5, 2       				# Calcula o deslocamento para a posição atual      
    	add $t9, $t9, $t7       			# Adiciona o deslocamento ao endereço base     
    	li $t8, 1                    			# Define o valor 1 para indicar letra usada
    	sw $t8, 0($t9)          			# Armazena o valor no vetor "VerificacaoLetrasUsadas"     

AvancarPosicaoCorreta:
    
    	addi $t0, $t0, 1    				# Avança para o próximo caractere da senha         
    	addi $s0, $s0, 1             			# Avança para o próximo caractere do buffer
    	addi $t5, $t5, 1             			# Incrementa o contador de posições ($t5) em 1

    	j LoopPosicaoCorreta        			# Pula para o rótulo "LoopPosicaoCorreta"

FimPosicaoCorreta:
    
    	li $t5, 0                    			# Reinicializa o contador de posições ($t5) com 0
    	la $t0, Senha                			# Carrega o endereço da senha em $t0
    	la $s0, Buffer               			# Carrega o endereço do buffer de entrada em $s0

LoopVerificacao:
    
    	beq $t5, 5, FimTentativaAtual 			# Se todas as posições foram verificadas, pula para "FimTentativaAtual"

    	lb $t1, 0($t0)               			# Carrega um caractere da senha em $t1
    	lb $s1, 0($s0)               			# Carrega um caractere do buffer em $s1

    	la $t4, VerificacaoTotal     			# Carrega o endereço do vetor "VerificacaoTotal"
    	sll $t7, $t5, 2              			# Calcula o deslocamento para a posição atual
    	add $t4, $t4, $t7         			# Adiciona o deslocamento ao endereço base   
    	lw $t8, 0($t4)       				# Carrega o valor da verificação total        

    	beq $t8, 1, AvancarVerificacao 			# Se a posição já foi marcada como correta, avança

    	j VerificarCaractere         			# Pula para o rótulo "VerificarCaractere"

VerificarCaractere:

    	la $t2, Senha                			# Carrega o endereço da senha em $t2
    	la $t9, VerificacaoLetrasUsadas 		# Carrega o endereço do vetor "VerificacaoLetrasUsadas"
    	li $t7, 0                			# Inicializa o contador de letras ($t7) com 0   

LoopVerificacaoInterna:

    	beq $t7, $t6, NaoPresente    			# Se todas as letras foram verificadas, pula para "NaoPresente"

    	lw $t8, 0($t9)  				# Carrega o valor da verificação de letras usadas
    	             
    	bnez $t8, ProximaLetra    			# Se a letra já foi usada, pula para "ProximaLetra"   

    	lb $t3, 0($t2)  				# Carrega um caractere da senha em $t3
    	            
    	beq $s1, $t3, Presente   			# Se os caracteres forem iguais, pula para "Presente"    

ProximaLetra:

    	addi $t2, $t2, 1        			# Avança para o próximo caractere da senha     
    	addi $t9, $t9, 4             			# Avança para o próximo valor da verificação de letras usadas
    	addi $t7, $t7, 1        			# Incrementa o contador de letras ($t7) em 1     

    	j LoopVerificacaoInterna    			# Pula para o rótulo "LoopVerificacaoInterna"

Presente:

    	li $t8, 1                    			# Define o valor 1 para indicar letra presente
    	sw $t8, 0($t9)               			# Armazena o valor no vetor "VerificacaoLetrasUsadas"

    	la $t4, VerificacaoParcial   			# Carrega o endereço do vetor "VerificacaoParcial"
    	sll $t7, $t5, 2              			# Calcula o deslocamento para a posição atual
    	add $t4, $t4, $t7      				# Adiciona o deslocamento ao endereço base      
    	li $t8, 1                			# Define o valor 1 para indicar letra presente    
    	sw $t8, 0($t4)          			# Armazena o valor no vetor "VerificacaoParcial"    

    	j AvancarVerificacao         			# Pula para o rótulo "AvancarVerificacao"

NaoPresente:

    	la $t4, VerificacaoParcial   			# Carrega o endereço do vetor "VerificacaoParcial"
   	sll $t7, $t5, 2              			# Calcula o deslocamento para a posição atual
    	add $t4, $t4, $t7       			# Adiciona o deslocamento ao endereço base     
    	li $t8, -1      				# Define o valor -1 para indicar letra não presente             
    	sw $t8, 0($t4)     				# Armazena o valor no vetor "VerificacaoParcial"          

AvancarVerificacao:

    	addi $t0, $t0, 1   				# Avança para o próximo caractere da senha          
    	addi $s0, $s0, 1             			# Avança para o próximo caractere do buffer
    	addi $t5, $t5, 1             			# Incrementa o contador de posições ($t5) em 1

    	j LoopVerificacao            			# Pula para o rótulo "LoopVerificacao"

FimTentativaAtual:

	jal ImprimirTentativa				# Chama a subrotina "ImprimirTentativa"

    	jal VerificarVitoria         			# Chama a subrotina "VerificarVitoria"
    
    	jal LimparVetores 				# Chama a subrotina "LimparVetores"
    
    	beq $v0, 1, MensagemVitoria  			# Se o jogador venceu ($v0 == 1), pula para "MensagemVitoria"

    	j LoopJogar                 			# Pula para o rótulo "LoopJogar"

MensagemVitoria: 

    	li $v0, 4                    			# Código para imprimir uma string (syscall 4)
    	la $a0, StringTituloVitoria  			# Carrega o endereço da string "StringTituloVitoria" em $a0
    	syscall                				# Executa a syscall    

	jal LerArquivoVitoria				# Chama a subrotina "LerArquivoVitoria"
	
	jal AdicionarVitoria				# Chama a subrotina "AdicionarVitoria"
                 
	lw $s4, Nivel					# Carrega o nível atual em $s4
	
	beq $s4, 366, JogoConcluido			# Se o nível for 366, o jogo foi concluído, pula para "JogoConcluido"

	j Main						# Pula para o rótulo "Main"

MensagemDerrota:
    	
    	li $v0, 4                    			# Código para imprimir uma string (syscall 4)
    	la $a0, StringTituloDerrota 			# Carrega o endereço da string "StringTituloDerrota" em $a0
    	syscall      					# Executa a syscall               

	jal LerArquivoDerrota				# Chama a subrotina "LerArquivoDerrota"
	
	jal AdicionarDerrota				# Chama a subrotina "AdicionarDerrota"
                    
Descobrir:

	li $v0, 4					# Código para imprimir uma string (syscall 4)
	la $a0, StringSenha01				# Carrega o endereço da string "StringSenha01" em $a0
	syscall						# Executa a syscall
	
	li $v0, 4					# Código para imprimir uma string (syscall 4)
	la $a0, Senha					# Carrega o endereço da senha em $a0
	syscall						# Executa a syscall
	
	li $v0, 4					# Código para imprimir uma string (syscall 4)
	la $a0, StringSenha02				# Carrega o endereço da string "StringSenha02" em $a0
	syscall						# Executa a syscall
	
	lw $s4, Nivel					# Carrega o nível atual em $s4
	
	beq $s4, 366, JogoConcluido			# Se o nível for 366, o jogo foi concluído, pula para "JogoConcluido"
	
	j Main						# Pula para o rótulo "Main"
	
# --------------------------------------------------------------------------------------------------------------------------------- # JogoConcluido

# JogoConcluido: Exibe a mensagem de conclusão do jogo

JogoConcluido:

	li $v0, 4					# Codigo para imprimir uma string (syscall 4)
	la $a0, StringJogoConcluido			# Carrega o endereço da string "StringJogoConcluido" em $a0
	syscall						# Executa a syscall
	
	j Main						# Retorna ao rótulo "Main"
 	
# --------------------------------------------------------------------------------------------------------------------------------- # LerEntrada

# LerEntrada: Subrotina para ler uma tentativa do usuario	
			
LerEntrada:

	li $v0, 4					# Codigo para imprimir uma string (syscall 4)
	la $a0, StringTentativa01			# Carrega o endereço da string "StringTentativa01" em $a0
	syscall						# Executa a syscall

	li $v0, 8					# Codigo para ler uma string (syscall 8)
	la $a0, Buffer					# Carrega o endereço do "Buffer" onde a entrada será armazenada
	li $a1, 6					# Define o tamanho máximo da entrada
	syscall						# Executa a syscall
	
	sb $zero, 5($a0)				# Armazena o caractere nulo (\0) na posição 5 do buffer
	
	jr $ra						# Retorna para o endereço de retorno
	
# --------------------------------------------------------------------------------------------------------------------------------- # VerificarExiste

# VerificarExiste: Subrotina para verificar se a palavra informada pelo usuario existe

VerificarExiste:
	
	li $v0, 13					# Codigo para abrir um arquivo (syscall 13)		
	la $a0, ArquivoDicionario			# Carrega o endereço do nome do arquivo "ArquivoDicionario" em $a0
	li $a1, 0					# Modo de abertura: 0 para leitura
	syscall						# Executa a syscall
	move $s0, $v0					# Salva o descritor do arquivo (retornado em $v0) em $s0
	
LoopVerificarExiste:
	
	li $v0, 14					# Codigo para ler um arquivo (syscall 14)	
	move $a0, $s0					# Passa o descritor do arquivo (salvo em $s0) para $a0		
	la $a1, TempPalavra				# Carrega o endereço de "TempPalavra"		
	li $a2, 5					# Define o número de bytes a serem lidos
	syscall						# Executa a syscall
	
	blez $v0, FimArquivo				# Se $v0 <= 0, pula para o rótulo "FimArquivo"
	
	sb $zero, 5($a1)				# Adiciona o caractere nulo (\0) ao final da palavra lida
	
	la $t0, TempPalavra				# Carrega o endereço de "TempPalavra" em $t0	
	la $t1, Buffer					# Carrega o endereço de "Buffer" em $t1		
	
	li $t2, 0					# Inicializa o contador de caracteres ($t2) com 0		
	
CompararStrings:

	lb $t3, 0($t0)					# Carrega um caractere de "TempPalavra" em $t3	
	lb $t4, 0($t1)					# Carrega um caractere de "Buffer" em $t4	
	
	bne $t3, $t4, ProximaPalavra			# Se $t3 != $t4, pula para o rótulo "ProximaPalavra"
	
	beqz $t3, PalavraEncontrada			# Se $t3 == 0, pula para o rótulo "PalavraEncontrada"
	
	addi $t0, $t0, 1				# Avança para o próximo caractere de "TempPalavra"		
	addi $t1, $t1, 1				# Avança para o próximo caractere de "Buffer"
	addi $t2, $t2, 1				# Incrementa o contador de caracteres ($t2)	
	
	j CompararStrings				# Pula para o róturo "CompararStrings"
	
PalavraEncontrada:

	li $v0, 16					# Codigo para fechar um arquivo (syscall 16)
	move $a0, $s0					# Passa o descritor do arquivo (salvo em $s0) para $a0	
	syscall						# Executa a syscall
	
	li $v0, 1					# Carrega 1 em $v0 (indicando que a palavra foi encontrada)	
	
	jr $ra						# Retorna para a função principal		
	
ProximaPalavra:

	la $a0, TempPalavra				# Carrega o endereço de "TempPalavra" em $a0
	
	li $t0, 5					# Define o contador de caracteres ($t0) como 5		
	
Limpar:
	
	la $t0, TempPalavra				# Reinicializa o ponteiro de "TempPalavra"
	
	la $t1, Buffer					# Reinicializa o ponteiro de "Buffer"	
	
	j LoopVerificarExiste				# Pula para o rótulo "LoopVerificarExiste"
	
FimArquivo:

	li $v0, 16					# Codigo para fechar um arquivo (syscall 16)
	move $a0, $s0					# Passa o descritor do arquivo (salvo em $s0) para $a0		
	syscall						# Executa a syscall
		
	li $v0, 0					# Carrega 0 em $v0 (indicando que a palavra não foi encontrada)
	
	jr $ra						# Retorna para a função principal			
	
# --------------------------------------------------------------------------------------------------------------------------------- # VerificarVitoria  
   
# VerificarVitoria: Subrotina para verificar se o jogador ganhou na tentativa atual    
   
VerificarVitoria:
    
     	li $s6, 0                  			# Inicializa o contador de iterações ($s6) com 0 
    
    	la $s1, VerificacaoTotal    			# Carrega o endereço inicial do vetor "VerificacaoTotal" em $s1

LoopVitoria:
    
    	beq $s6, 5, IncrementarVitoria 			# Se ($s6) == 5, pula para o rótulo "IncrementarVitoria"

    	lw $s7, 0($s1)              			# Carrega o valor atual de "VerificacaoTotal" em $s7
    
    	addi $s6, $s6, 1           			# Incrementa o contador de iterações ($s6) em 1
    
    	addi $s1, $s1, 4            			# Avança para a próxima posição de "VerificacaoTotal"

    	beq $s7, 1, LoopVitoria    			# Se ($s7) == 1, pula para o rótulo "LoopVitoria"

    	li $v0, 0     					# Se algum valor não for 1, carrega 0 em $v0 (indicando que não há vitória)              
    
    	jr $ra                      			# Retorna para o endereço de retorno

IncrementarVitoria:
    
    	li $v0, 1               			# Se todos os valores forem 1, carrega 1 em $v0 (indicando vitória)    
    
    	jr $ra                      			# Retorna para o endereço de retorno

# --------------------------------------------------------------------------------------------------------------------------------- # ImprimirTentativa

# ImprimirTentativa: Subrotina para imprimir o resultado da tentativa do usuario

ImprimirTentativa:

    	li $v0, 4					# Codigo para imprimir uma string (syscall 4)
    	la $a0, StringLinha01				# Carrega o endereço da string "StringLinha01" em $a0
   	syscall						# Executa a syscall

    	li $v0, 4                    			# Codigo para imprimir uma string (syscall 4)
    	la $a0, StringTentativa03    			# Carrega o endereço da string "StringTentativa03" em $a0
    	syscall                      			# Executa a syscall

    	li $t5, 0      					# Inicializa o contador de iterações ($t5) com 0              
    	li $t6, 5          				# Define o número de iterações (5) em $t6          
	
    	la $t0, VerificacaoTotal     			# Carrega o endereço inicial do vetor "VerificacaoTotal" em $t0
    	la $t1, VerificacaoParcial   			# Carrega o endereço inicial do vetor "VerificacaoParcial" em $t1

LoopImpressao:

    	beq $t5, $t6, FimImpressao 			# Se ($t5) == 5, pula para o rótulo "FimImpressao"

    	lw $t2, 0($t0)       				# Carrega o valor atual de "VerificacaoTotal" em $t2
    	      
    	beq $t2, 1, ImprimirMais    			# Se ($t2) == 1, pula para o rótulo "ImprimirMais"

	lw $t3, 0($t1) 					# Carrega o valor atual de "VerificacaoParcial" em $t3
	             
    	beq $t3, 1, ImprimirExclamacao 			# Se ($t3) == 1, pula para o rótulo "ImprimirExclamacao"
    	
    	beq $t3, -1, ImprimirMenos  			# Se ($t3) == -1, pula para o rótulo "ImprimirMenos"

ImprimirMais:

    	li $v0, 11                  			# Codigo para imprimir um caractere (syscall 11)
    	li $a0, '+'                 			# Carrega o caractere '+' em $a0
    	syscall                      			# Executa a syscall

    	j AvancarImpressao          			# Pula para o róturo "AvancarImpressao"

ImprimirExclamacao:

    	li $v0, 11                  			# Codigo para imprimir um caractere (syscall 11)
    	li $a0, '!'                 			# Carrega o caractere '!' em $a0
    	syscall                      			# Executa a syscall

    	j AvancarImpressao          			# Pula para o róturo "AvancarImpressao"

ImprimirMenos:

    	li $v0, 11                  			# Codigo para imprimir um caractere (syscall 11)
    	li $a0, '-'                			# Carrega o caractere '-' em $a0
    	syscall                     			# Executa a syscall

    	j AvancarImpressao          			# Pula para o róturo "AvancarImpressao"

AvancarImpressao:
   
     	beq $t5, 4, PularBarra      			# Se ($t5) == 4, pula para o rotulo "PularBarra"

    	li $v0, 4                   			# Codigo para imprimir uma string (syscall 4)
    	la $a0, StringTentativa02   			# Carrega o endereço da string "StringTentativa02" em $a0
    	syscall                      			# Executa a syscall

PularBarra:
    	
    	addi $t0, $t0, 4      				# Avança para a próxima posição de "VerificacaoTotal"      
    	addi $t1, $t1, 4           			# Avança para a próxima posição de "VerificacaoParcial" 
    	addi $t5, $t5, 1       				# Incrementa o contador de iterações ($t5) em 1     

    	j LoopImpressao   				# Pula para o rótulo "LoopImpressao"          

FimImpressao:

    	li $v0, 4                   			# Codigo para imprimir uma string (syscall 4)
    	la $a0, StringTentativa04   			# Carrega o endereço da string "StringTentativa04" em $a0
    	syscall                      			# Executa a syscall

    	li $v0, 4					# Codigo para imprimir uma string (syscall 4)
    	la $a0, StringLinha01				# Carrega o endereço da string "StringLinha01" em $a0
    	syscall						# Executa a syscall

    	jr $ra                      			# Retorna para o endereço de retorno

# --------------------------------------------------------------------------------------------------------------------------------- # LimparVetores

# LimparVetores: Subrotina para limpar os vetores 

LimparVetores:

    	li $t0, 0                 			# Inicializa o contador de iterações ($t0) com 0  
    	la $t1, VerificacaoTotal     			# Carrega o endereço inicial do vetor "VerificacaoTotal" em $t1
    	la $t2, VerificacaoParcial   			# Carrega o endereço inicial do vetor "VerificacaoParcial" em $t2
    	la $t3, VerificacaoLetrasUsadas 		# Carrega o endereço inicial do vetor "VerificacaoLetrasUsadas" em $t3
    	li $t4, 5       				# Define o número de iterações (5) em $t4 (tamanho dos vetores)             

LoopLimpeza:

    	beq $t0, $t4, FimLimpeza     			# Se ($t0) == 5, pula para o rótulo "FimLimpeza"

    	sw $zero, 0($t1)        			# Armazena o valor 0 na posição atual de "VerificacaoTotal"    
    	addi $t1, $t1, 4             			# Avança para a próxima posição de "VerificacaoTotal"
    	
    	sw $zero, 0($t2)     				# Armazena o valor 0 na posição atual de "VerificacaoParcial"        
    	addi $t2, $t2, 4           			# Avança para a próxima posição de "VerificacaoParcial"  
    
    	sw $zero, 0($t3)      				# Armazena o valor 0 na posição atual de "VerificacaoLetrasUsadas"       
    	addi $t3, $t3, 4       				# Avança para a próxima posição de "VerificacaoLetrasUsadas"      

    	addi $t0, $t0, 1             			# Incrementa o contador de iterações ($t0) em 1
    		
    	j LoopLimpeza                 			# Retorna ao rótulo "LoopLimpeza"

FimLimpeza:
    
    	jr $ra                       			# Retorna para o endereço de retorno

# --------------------------------------------------------------------------------------------------------------------------------- # LerArquivoNivel

# LerArquivoNivel: Subrotina para ler o valor armazenado no arquivo de niveis

LerArquivoNivel:

	# Abrir o arquivo
	
	li $v0, 13					# Codigo para abrir um arquivo (syscall 13)     					
	la $a0, ArquivoNivel				# Carrega o endereço do arquivo "ArquivoNivel" em $a0
	li $a1, 0					# Modo de abertura: 0 para leitura			
	li $a2, 0					# Permissões: 0 		
	syscall						# Executa a syscall
	move $s0, $v0					# Salva o descritor do arquivo (retornado em $v0) em $s0	
	
	# Ler o arquivo
	
	li $v0, 14					# Codigo para ler um arquivo (syscall 14) 
	move $a0, $s0					# Passa o descritor do arquivo (salvo em $s0) para $a0	
	la $a1, Nivel 					# Carrega o endereço da variável "Nivel" em $a1	
	li $a2, 4  					# Define o número de bytes a serem lidos			
	syscall						# Executa a syscall
	
	# Fechar o arquivo
	
	li $v0, 16 					# Codigo para fechar um arquivo (syscall 16)  
	move $a0, $s0					# Passa o descritor do arquivo (salvo em $s0) para $a0  
	syscall						# Executa a syscall
	
	jr $ra						# Retorna para o endereço de retorno

# --------------------------------------------------------------------------------------------------------------------------------- # AdicionarNivel

# AdicionarNivel: Subrotina para incrementar o contador de niveis

AdicionarNivel:

	# Atrbuir um novo valor a variavel
	
	lw $t0, Nivel					# Carrega o valor da variável "Nivel" (lida do arquivo) em $t0
	addi $t0, $t0, 1				# Adiciona 1 a contagem de "Nivel"
	sw $t0, Nivel					# Armazena o valor de volta na variável "Nivel"
	
	# Abrir o arquivo
	
	li $v0, 13     					# Codigo para abrir um arquivo (syscall 13)
	la $a0, ArquivoNivel				# Carrega o endereço do arquivo "ArquivoNivel" em $a0
	li $a1, 1					# Modo de abertura: 1 para escrita
	li $a2, 0					# Permissões: 0
	syscall						# Executa a syscall
	move $s0, $v0					# Salva o descritor do arquivo (retornado em $v0) em $s0
	
	# Escrever no arquivo
	
	li $v0, 15					# Codigo para escrever um arquivo (syscall 15)
	move $a0, $s0					# Passa o descritor do arquivo (salvo em $s0) para $a0
	la $a1, Nivel					# Carrega o endereço da variável "Nivel" (que agora contém 0) em $a1
	li $a2, 4					# Define o número de bytes a serem escritos
	syscall						# Executa a syscall
	
	# Fechar o arquivo
	
	li $v0, 16 					# Codigo para fechar um arquivo (syscall 16)
	move $a0, $s0					# Passa o descritor do arquivo (salvo em $s0) para $a0
	syscall						# Executa a syscall
	
	jr $ra						# Retorna para o endereço de retorno
	
# --------------------------------------------------------------------------------------------------------------------------------- # LerArquivoVitoria

# LerArquivoVitoria: Subrotina para ler o valor armazenado no arquivo de vitorias

LerArquivoVitoria:

	# Abrir o arquivo
	
	li $v0, 13					# Codigo para abrir um arquivo (syscall 13)     					
	la $a0, ArquivoVitorias				# Carrega o endereço do arquivo "ArquivoVitorias" em $a0
	li $a1, 0					# Modo de abertura: 0 para leitura			
	li $a2, 0					# Permissões: 0 		
	syscall						# Executa a syscall
	move $s0, $v0					# Salva o descritor do arquivo (retornado em $v0) em $s0	
	
	# Ler o arquivo
	
	li $v0, 14					# Codigo para ler um arquivo (syscall 14) 
	move $a0, $s0					# Passa o descritor do arquivo (salvo em $s0) para $a0	
	la $a1, Vitoria 				# Carrega o endereço da variável "Vitoria" em $a1	
	li $a2, 4  					# Define o número de bytes a serem lidos			
	syscall						# Executa a syscall
	
	# Fechar o arquivo
	
	li $v0, 16 					# Codigo para fechar um arquivo (syscall 16)  
	move $a0, $s0					# Passa o descritor do arquivo (salvo em $s0) para $a0  
	syscall						# Executa a syscall
	
	jr $ra						# Retorna para o endereço de retorno
	
# --------------------------------------------------------------------------------------------------------------------------------- # AdicionarDerrota

# AdicionarVitoria: Subrotina para incrementar o contador de vitorias

AdicionarVitoria:

	# Atrbuir um novo valor a variavel
	
	lw $t0, Vitoria					# Carrega o valor da variável "Vitoria" (lida do arquivo) em $t0
	addi $t0, $t0, 1				# Adiciona 1 a contagem de "Vitoria"
	sw $t0, Vitoria					# Armazena o valor de volta na variável "Vitoria"
	
	# Abrir o arquivo
	
	li $v0, 13     					# Codigo para abrir um arquivo (syscall 13)
	la $a0, ArquivoVitorias				# Carrega o endereço do arquivo "ArquivoVitorias" em $a0
	li $a1, 1					# Modo de abertura: 1 para escrita
	li $a2, 0					# Permissões: 0
	syscall						# Executa a syscall
	move $s0, $v0					# Salva o descritor do arquivo (retornado em $v0) em $s0
	
	# Escrever no arquivo
	
	li $v0, 15					# Codigo para escrever um arquivo (syscall 15)
	move $a0, $s0					# Passa o descritor do arquivo (salvo em $s0) para $a0
	la $a1, Vitoria					# Carrega o endereço da variável "Vitoria" (que agora contém 0) em $a1
	li $a2, 4					# Define o número de bytes a serem escritos
	syscall						# Executa a syscall
	
	# Fechar o arquivo
	
	li $v0, 16 					# Codigo para fechar um arquivo (syscall 16)
	move $a0, $s0					# Passa o descritor do arquivo (salvo em $s0) para $a0
	syscall						# Executa a syscall
	
	jr $ra						# Retorna para o endereço de retorno
	
# --------------------------------------------------------------------------------------------------------------------------------- # LerArquivoDerrota

# LerArquivoDerrota: Subrotina para ler o valor armazenado no arquivo de derrotas

LerArquivoDerrota:

	# Abrir o arquivo
	
	li $v0, 13					# Codigo para abrir um arquivo (syscall 13)     					
	la $a0, ArquivoDerrotas				# Carrega o endereço do arquivo "ArquivoDerrotas" em $a0
	li $a1, 0					# Modo de abertura: 0 para leitura			
	li $a2, 0					# Permissões: 0 		
	syscall						# Executa a syscall
	move $s0, $v0					# Salva o descritor do arquivo (retornado em $v0) em $s0	
	
	# Ler o arquivo
	
	li $v0, 14					# Codigo para ler um arquivo (syscall 14) 
	move $a0, $s0					# Passa o descritor do arquivo (salvo em $s0) para $a0	
	la $a1, Derrota 				# Carrega o endereço da variável "Derrota" em $a1	
	li $a2, 4  					# Define o número de bytes a serem lidos			
	syscall						# Executa a syscall
	
	# Fechar o arquivo
	
	li $v0, 16 					# Codigo para fechar um arquivo (syscall 16)  
	move $a0, $s0					# Passa o descritor do arquivo (salvo em $s0) para $a0  
	syscall						# Executa a syscall
	
	jr $ra						# Retorna para o endereço de retorno
					
# --------------------------------------------------------------------------------------------------------------------------------- # AdicionarDerrota

# AdicionarDerrota: Subrotina para incrementar o contador de derrotas

AdicionarDerrota:

	# Atrbuir um novo valor a variavel
	
	lw $t0, Derrota					# Carrega o valor da variável "Derrota" (lida do arquivo) em $t0
	addi $t0, $t0, 1				# Adiciona 1 a contagem de "Derrota"
	sw $t0, Derrota					# Armazena o valor de volta na variável "Derrota"
	
	# Abrir o arquivo
	
	li $v0, 13     					# Codigo para abrir um arquivo (syscall 13)
	la $a0, ArquivoDerrotas				# Carrega o endereço do arquivo "ArquivoDerrotas" em $a0
	li $a1, 1					# Modo de abertura: 1 para escrita
	li $a2, 0					# Permissões: 0
	syscall						# Executa a syscall
	move $s0, $v0					# Salva o descritor do arquivo (retornado em $v0) em $s0
	
	# Escrever no arquivo
	
	li $v0, 15					# Codigo para escrever um arquivo (syscall 15)
	move $a0, $s0					# Passa o descritor do arquivo (salvo em $s0) para $a0
	la $a1, Derrota					# Carrega o endereço da variável "Derrota" (que agora contém 0) em $a1
	li $a2, 4					# Define o número de bytes a serem escritos
	syscall						# Executa a syscall
	
	# Fechar o arquivo
	
	li $v0, 16 					# Codigo para fechar um arquivo (syscall 16)
	move $a0, $s0					# Passa o descritor do arquivo (salvo em $s0) para $a0
	syscall						# Executa a syscall
	
	jr $ra						# Retorna para o endereço de retorno

# --------------------------------------------------------------------------------------------------------------------------------- # ReiniciarNiveis

# ReiniciarNiveis: Subrotina para reiniciar o arquivo "ArquivoNivel"
	
	# Reinicia em 0, se "ReiniciarJogo" == 5
	# Reinicia em 365, se "ReiniciarJogo" == 6

ReiniciarNiveis:
	
	# Abrir o arquivo
					
	li $v0, 13					# Codigo para abrir um arquivo (syscall 13)     					
	la $a0, ArquivoNivel				# Carrega o endereço do arquivo "ArquivoNivel" em $a0
	li $a1, 0					# Modo de abertura: 0 para leitura			
	li $a2, 0					# Permissões: 0 		
	syscall						# Executa a syscall
	move $s0, $v0					# Salva o descritor do arquivo (retornado em $v0) em $s0	

	# Ler o arquivo
	
	li $v0, 14					# Codigo para ler um arquivo (syscall 14) 
	move $a0, $s0					# Passa o descritor do arquivo (salvo em $s0) para $a0	
	la $a1, Nivel 					# Carrega o endereço da variável "Nivel" em $a1	
	li $a2, 4  					# Define o número de bytes a serem lidos			
	syscall						# Executa a syscall
	
	# Fechar o arquivo
	
	li $v0, 16 					# Codigo para fechar um arquivo (syscall 16)  
	move $a0, $s0					# Passa o descritor do arquivo (salvo em $s0) para $a0  
	syscall						# Executa a syscall
	
	beq $s5, 6, CasoEspecial			# Se $s5 == 6, pula para o rótulo "CasoEspecial"
	
	# Atrbuir um novo valor a variavel
	
	lw $t0, Nivel					# Carrega o valor da variável "Nivel" (lida do arquivo) em $t0
	li $t0, 0					# Zera o valor de $t0
	sw $t0, Nivel					# Armazena o valor de volta na variável "Nivel"
	
	j Continue
	
CasoEspecial:
	
	# Atrbuir um novo valor a variavel
	
	lw $t0, Nivel					# Carrega o valor da variável "Nivel" (lida do arquivo) em $t0
	li $t0, 365					# Zera o valor de $t0
	sw $t0, Nivel					# Armazena o valor de volta na variável "Nivel"
	
Continue:
	
	# Abrir o arquivo
	
	li $v0, 13     					# Codigo para abrir um arquivo (syscall 13)
	la $a0, ArquivoNivel				# Carrega o endereço do arquivo "ArquivoNivel" em $a0
	li $a1, 1					# Modo de abertura: 1 para escrita
	li $a2, 0					# Permissões: 0
	syscall						# Executa a syscall
	move $s0, $v0					# Salva o descritor do arquivo (retornado em $v0) em $s0
	
	# Escrever no arquivo
	
	li $v0, 15					# Codigo para escrever um arquivo (syscall 15)
	move $a0, $s0					# Passa o descritor do arquivo (salvo em $s0) para $a0
	la $a1, Nivel					# Carrega o endereço da variável "Nivel" (que agora contém 0) em $a1
	li $a2, 4					# Define o número de bytes a serem escritos
	syscall						# Executa a syscall
	
	# Fechar o arquivo
	
	li $v0, 16 					# Codigo para fechar um arquivo (syscall 16)
	move $a0, $s0					# Passa o descritor do arquivo (salvo em $s0) para $a0
	syscall						# Executa a syscall
	
	jr $ra						# Retorna para o endereço de retorno

# --------------------------------------------------------------------------------------------------------------------------------- # ReiniciarDerrotas

# ReiniciarVitorias: Subrotina para reiniciar o arquivo "ArquivoVitorias" em 0

ReiniciarVitorias:

	# Abrir o arquivo
					
	li $v0, 13					# Codigo para abrir um arquivo (syscall 13)     					
	la $a0, ArquivoVitorias				# Carrega o endereço do arquivo "ArquivoVitorias" em $a0
	li $a1, 0					# Modo de abertura: 0 para leitura			
	li $a2, 0					# Permissões: 0 		
	syscall						# Executa a syscall
	move $s0, $v0					# Salva o descritor do arquivo (retornado em $v0) em $s0	

	# Ler o arquivo
	
	li $v0, 14					# Codigo para ler um arquivo (syscall 14) 
	move $a0, $s0					# Passa o descritor do arquivo (salvo em $s0) para $a0	
	la $a1, Vitoria 				# Carrega o endereço da variável "Vitoria" em $a1	
	li $a2, 4  					# Define o número de bytes a serem lidos			
	syscall						# Executa a syscall
	
	# Fechar o arquivo
	
	li $v0, 16 					# Codigo para fechar um arquivo (syscall 16)  
	move $a0, $s0					# Passa o descritor do arquivo (salvo em $s0) para $a0  
	syscall						# Executa a syscall
	
	# Atrbuir um novo valor a variavel
	
	lw $t0, Vitoria					# Carrega o valor da variável "Vitoria" (lida do arquivo) em $t0
	li $t0, 0					# Zera o valor de $t0
	sw $t0, Vitoria					# Armazena o valor de volta na variável "Vitoria"
	
	# Abrir o arquivo
	
	li $v0, 13     					# Codigo para abrir um arquivo (syscall 13)
	la $a0, ArquivoVitorias				# Carrega o endereço do arquivo "ArquivoVitorias" em $a0
	li $a1, 1					# Modo de abertura: 1 para escrita
	li $a2, 0					# Permissões: 0
	syscall						# Executa a syscall
	move $s0, $v0					# Salva o descritor do arquivo (retornado em $v0) em $s0
	
	# Escrever no arquivo
	
	li $v0, 15					# Codigo para escrever um arquivo (syscall 15)
	move $a0, $s0					# Passa o descritor do arquivo (salvo em $s0) para $a0
	la $a1, Vitoria					# Carrega o endereço da variável "Vitoria" (que agora contém 0) em $a1
	li $a2, 4					# Define o número de bytes a serem escritos
	syscall						# Executa a syscall
	
	# Fechar o arquivo
	
	li $v0, 16 					# Codigo para fechar um arquivo (syscall 16)
	move $a0, $s0					# Passa o descritor do arquivo (salvo em $s0) para $a0
	syscall						# Executa a syscall
	
	jr $ra						# Retorna para o endereço de retorno

# --------------------------------------------------------------------------------------------------------------------------------- # ReiniciarDerrotas

# ReiniciarDerrotas: Subrotina para reiniciar o arquivo "ArquivoDerrotas" em 0

ReiniciarDerrotas:
	
	# Abrir o arquivo
	
	li $v0, 13					# Codigo para abrir um arquivo (syscall 13)     					
	la $a0, ArquivoDerrotas				# Carrega o endereço do arquivo "ArquivoDerrotas" em $a0
	li $a1, 0					# Modo de abertura: 0 para leitura			
	li $a2, 0					# Permissões: 0 		
	syscall						# Executa a syscall
	move $s0, $v0					# Salva o descritor do arquivo (retornado em $v0) em $s0	
	
	# Ler o arquivo
	
	li $v0, 14					# Codigo para ler um arquivo (syscall 14) 
	move $a0, $s0					# Passa o descritor do arquivo (salvo em $s0) para $a0	
	la $a1, Derrota 				# Carrega o endereço da variável "Derrota" em $a1	
	li $a2, 4  					# Define o número de bytes a serem lidos			
	syscall						# Executa a syscall
	
	# Fechar o arquivo
	
	li $v0, 16 					# Codigo para fechar um arquivo (syscall 16)  
	move $a0, $s0					# Passa o descritor do arquivo (salvo em $s0) para $a0  
	syscall						# Executa a syscall
	
	# Atrbuir um novo valor a variavel
	
	lw $t0, Derrota					# Carrega o valor da variável "Derrota" (lida do arquivo) em $t0
	li $t0, 0					# Zera o valor de $t0
	sw $t0, Derrota					# Armazena o valor de volta na variável "Derrota"
	
	# Abrir o arquivo
	
	li $v0, 13     					# Codigo para abrir um arquivo (syscall 13)
	la $a0, ArquivoDerrotas				# Carrega o endereço do arquivo "ArquivoDerrotas" em $a0
	li $a1, 1					# Modo de abertura: 1 para escrita
	li $a2, 0					# Permissões: 0
	syscall						# Executa a syscall
	move $s0, $v0					# Salva o descritor do arquivo (retornado em $v0) em $s0
	
	# Escrever no arquivo
	
	li $v0, 15					# Codigo para escrever um arquivo (syscall 15)
	move $a0, $s0					# Passa o descritor do arquivo (salvo em $s0) para $a0
	la $a1, Derrota					# Carrega o endereço da variável "Derrota" (que agora contém 0) em $a1
	li $a2, 4					# Define o número de bytes a serem escritos
	syscall						# Executa a syscall
	
	# Fechar o arquivo
	
	li $v0, 16 					# Codigo para fechar um arquivo (syscall 16)
	move $a0, $s0					# Passa o descritor do arquivo (salvo em $s0) para $a0
	syscall						# Executa a syscall
	
	jr $ra						# Retorna para o endereço de retorno

