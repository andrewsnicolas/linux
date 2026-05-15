#!/bin/bash

# Configurações do texto
texto="***** 😊 MENU INTERATIVO GRADIENTE 😊 *****"
comprimento=${#texto}
offset=0

# Função para desenhar o menu com gradiente
desenhar_menu() {
    clear
    echo -e "\033[0;34m==========================================\033[0m"
    
    # Loop que gera o gradiente baseado no offset atual
    for (( i=0; i<comprimento; i++ )); do
        # O cálculo 128 + ... percorre cores vibrantes do modo 256 cores
        cor=$(( 16 + ( (i + offset) % 200 ) )) 
        char="${texto:$i:1}"
        echo -ne "\033[38;5;${cor}m${char}"
    done
    
    echo -e "\033[0m"
    echo -e "\n\033[0;34m==========================================\033[0m"
    echo " 1) Criar pastas"
    echo " 2) Criar um alias para um comando"
    echo " 3) Listar processos"
    echo " 4) Listar processos com maior consumo"
    echo " 5) Listar e guardar em log os processos do usuário"
    echo " 6) Encerrar um processo"
    echo " 0) Sair"
    echo "------------------------------------------"
    echo -n "Escolha uma opção: "
}

# Loop Principal
while true; do
    desenhar_menu
    
    # O segredo: read com timeout de 0.1 segundos
    # Se você não apertar nada, ele sai do read e atualiza o offset
    read -rsn1 -t 0.1 op
    
    if [ ! -z "$op" ]; then
        case $op in
            1) 
		echo "Quantas pastas você quer criar?"
		read numeroPastas;
		for((cont = 0; cont<numeroPastas;cont++));
			do
				echo "Escolha o nome de uma pasta";
				read pasta;
				mkdir $pasta;
			done
            echo "Pastas criadas com sucesso!"; 
	    read ;;
            2) 
            echo "Qual comando você quer criar um alas?"; 
            read comando;
	    alias apelido = comando;
	    echo "Alias criado com sucesso!";
	   read ;;
            3) ps aux;
            echo "Processos listados com sucesso!"; 
            read ;;
            4)
	    ps aux --sort=-%mem | head -n 11;
            echo "Procesoss mais pesados listados"; 
            read ;;
            5)
	    ps -u $USER > log.txt;
            echo "Arquivo criado com sucesso!"; 
            read ;;
            6)
            echo "Digite o PID do processo";
	    read npid;
	    kill -9 npid;
	    echo "Processo matado com sucesso!";
            read ;;
            0) echo "Saindo..."; 
            exit 0;
            ;;
            *) echo "Opção inválida!"; 
            sleep 1; 
            ;;
        esac
    fi
    
    # Incrementa o offset para a cor "andar"
    ((offset++))
done
