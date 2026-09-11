### _Projeto Final - Miple_

***

<img align="right" src="https://i.pinimg.com/736x/56/4b/02/564b02744b734c33bf946c042ca9e6f6.jpg" alt="Imagem 1" style="border-radius: 10px; margin: 5px;" width="70">
<img align="right" src="https://i.pinimg.com/236x/9f/b1/e8/9fb1e8e85ab08839c49ad5143cf70114.jpg" alt="Imagem 2" style="border-radius: 10px; margin: 5px;" height="70">
<img align="right" src="https://i.pinimg.com/736x/42/57/75/425775f47010855e31797f8f40efb694.jpg" alt="Imagem 3" style="border-radius: 10px; margin: 5px;" width="70">

> _Componentes: DLedebuhr e henriquevalezad_ 
 
> _Disciplina: Arquitetura e Organização de Computadores_

***

### _Descrição do Trabalho Proposto_

***

O trabalho consiste na implementação de um jogo de adivinhação de palavras. O jogo desafia o jogador a adivinhar uma palavra de 5 letras em até 6 tentativas. A cada tentativa, o jogo fornece feedback sobre a precisão da palavra inserida, indicando quais letras estão corretas e na posição correta, quais estão presentes na palavra, mas em posições incorretas, e quais letras não fazem parte da palavra.

O jogo possui 365 níveis, cada um com uma palavra única a ser descoberta. O progresso do jogador é armazenado em arquivos binários, que registram o nível atual, o número de vitórias e derrotas. Além disso, o jogo valida se as palavras inseridas pelo jogador são válidas, consultando um arquivo de dicionário que contém uma lista de palavras da língua portuguesa.

### _Descrição da implementação_

***

### 1. Menu Interativo:

_O jogo começa com um menu que permite ao jogador escolher entre:_

* _Jogar_

* _Status_

* _Tutorial_ 

* _Reiniciar o jogo_

* _Sair_

***

### 2. Arquivos:

_O jogo utiliza arquivos para armazenar:_

* _O nível atual do jogador (`ArquivoNivel.bin`)._

* _O número de vitórias (`ArquivoVitorias.bin`)._

* _O número de derrotas (`ArquivoDerrotas.bin`)._

* _Uma lista de 365 palavras (senhas) para os níveis (`ArquivoSenhas.txt`)._

* _Um dicionário de palavras válidas (`ArquivoDicionario.txt`), usado para validar as tentativas do jogador._

***

### 3. Lógica do Jogo:

_O jogador insere uma palavra de 5 letras e o sistema verifica se a palavra é válida (está no dicionário). Caso seja uma palavra valida, o jogo compara a palavra inserida com a senha do nível atual e fornece feedback visual:_

* _+ : Letra correta na posição correta._

* _!  : Letra presente na palavra, mas na posição errada._

* _- : Letra não presente na palavra._

_O jogador tem 6 tentativas para adivinhar a palavra._

***

### 4. Uso de Strings e Vetores:

* ___Strings:__ O jogo faz uso de strings para armazenar e manipular palavras, como a senha do nível atual, a tentativa do jogador e as mensagens exibidas no menu e durante o jogo._

* ___Vetores:__ Três vetores são utilizados para armazenar o estado das verificações:_

   * _VerificacaoTotal: Armazena se cada letra da tentativa está correta e na posição certa._

   * _VerificacaoParcial: Armazena se cada letra da tentativa está presente na palavra, mas em posição errada._

   * _VerificacaoLetrasUsadas: Armazena se cada letra já foi usada em tentativas anteriores._

***

### 5. Laços de Execução:

_O jogo faz uso de laços de execução para controlar o fluxo do programa._

***

### 6. Subrotinas:

_O jogo é modularizado em várias subrotinas, incluindo:_

* _LerEntrada: Lê a tentativa do jogador._

* _VerificarExiste: Verifica se a palavra existe no dicionário._

* _VerificarVitoria: Verifica se o jogador acertou a palavra._

* _ImprimirTentativa: Exibe o resultado da tentativa._

* _LimparVetores: Reinicia os vetores de verificação para a próxima tentativa._

* _LerArquivoNivel, AdicionarNivel, LerArquivoVitoria, AdicionarVitoria, LerArquivoDerrota, AdicionarDerrota: Gerenciam a leitura e escrita nos arquivos de progresso._

***

### _Observações_

_Todos os arquivos devem estar na mesma pasta, e o caminho para eles no arquivo principal deve ser atualizado de acordo com o novo local._
