.data
    input: .space 100          # Reserva espa�o para 100 caracteres
    prompt: .asciiz "Digite uma mensagem: "
    newline: .asciiz "\n"       # Nova linha para formatar a sa�da

.text
    main:
        # Imprimir o prompt
        li $v0, 4               # C�digo de servi�o para imprimir string
        la $a0, prompt          # Carregar o endere�o da string prompt
        syscall                 # Chamada do sistema

        # Ler a entrada do usu�rio
        li $v0, 8               # C�digo de servi�o para ler string
        la $a0, input          # Carregar o endere�o do buffer
        li $a1, 100             # Tamanho m�ximo da entrada
        syscall                 # Chamada do sistema

        # Imprimir nova linha
        li $v0, 4               # C�digo de servi�o para imprimir string
        la $a0, newline         # Carregar nova linha
        syscall                 # Chamada do sistema

        # Imprimir a mensagem digitada
        li $v0, 4               # C�digo de servi�o para imprimir string
        la $a0, input          # Carregar o endere�o do buffer
        syscall                 # Chamada do sistema

        # Terminar o programa
        li $v0, 10              # C�digo de servi�o para terminar o programa
        syscall                 # Chamada do sistema
