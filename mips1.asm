.data
    input: .space 100          # Reserva espaço para 100 caracteres
    prompt: .asciiz "Digite uma mensagem: "
    newline: .asciiz "\n"       # Nova linha para formatar a saída

.text
    main:
        # Imprimir o prompt
        li $v0, 4               # Código de serviço para imprimir string
        la $a0, prompt          # Carregar o endereço da string prompt
        syscall                 # Chamada do sistema

        # Ler a entrada do usuário
        li $v0, 8               # Código de serviço para ler string
        la $a0, input          # Carregar o endereço do buffer
        li $a1, 100             # Tamanho máximo da entrada
        syscall                 # Chamada do sistema

        # Imprimir nova linha
        li $v0, 4               # Código de serviço para imprimir string
        la $a0, newline         # Carregar nova linha
        syscall                 # Chamada do sistema

        # Imprimir a mensagem digitada
        li $v0, 4               # Código de serviço para imprimir string
        la $a0, input          # Carregar o endereço do buffer
        syscall                 # Chamada do sistema

        # Terminar o programa
        li $v0, 10              # Código de serviço para terminar o programa
        syscall                 # Chamada do sistema
