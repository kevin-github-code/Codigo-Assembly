.data                           # Segmento de dados
input1: .asciiz "Insira o primeiro numero: "  # Mensagem para pedir o 1� n�mero
input2: .asciiz "Insira o segundo numero: "  # Mensagem para pedir o 2� n�mero
resultado: .asciiz "A soma e: "                 # Mensagem para exibir o resultado
nova_linha: .asciiz "\n" 			#Codigo para nova linha
mensagem_fim:    .asciiz "Programa concluido!\n"      # Mensagem de fim

.text                           # Segmento de c�digo
.globl main                     # Tornar o r�tulo "main" global
	main:   
        # Solicitar o primeiro n�mero ao utilizador
        li $v0, 4                       # System call para imprimir string
        la $a0, input1              # Carregar o endere�o da mensagem
        syscall                         # Executar a chamada do sistema

        li $v0, 5                       # System call para ler inteiro
        syscall                         # Executar a chamada do sistema
        move $t0, $v0                   # Armazenar o primeiro n�mero em $t0

        # Solicitar o segundo n�mero ao utilizador
        li $v0, 4                       # System call para imprimir string
        la $a0, input2              # Carregar o endere�o da mensagem
        syscall                         # Executar a chamada do sistema

        li $v0, 5                       # System call para ler inteiro
        syscall                         # Executar a chamada do sistema
        move $t1, $v0                   # Armazenar o segundo n�mero em $t1

        # Realizar a soma
        add $t2, $t0, $t1               # $t2 = $t0 + $t1

        # Exibir o resultado
        li $v0, 4                       # System call para imprimir string
        la $a0, resultado              # Carregar o endere�o da mensagem
        syscall                         # Executar a chamada do sistema

        li $v0, 1                       # System call para imprimir inteiro
        move $a0, $t2                   # Carregar o valor da soma em $a0
        syscall                         # Executar a chamada do sistema
        
        li $v0, 4             		# System call para imprimir string
        la $a0, nova_linha   		# Carrega o endere�o do caractere de nova linha
        syscall               		# Executa a impress�o


        # Exibir a mensagem de conclus�o
        li $v0, 4                       # System call para imprimir string
        la $a0, mensagem_fim            # Carregar o endere�o da mensagem
        syscall                         # Executar a chamada do sistema

        # Encerrar o programa
        li $v0, 10                      # System call para encerrar o programa
        syscall                         # Executar a chamada do sistema
