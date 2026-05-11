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
    echo " 1) Listar Arquivos"
    echo " 2) Ver Processos"
    echo " 3) Sair"
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
            1) ls; echo "Pressione Enter..."; read ;;
            2) ps; echo "Pressione Enter..."; read ;;
            3) echo "Saindo..."; exit 0 ;;
            *) echo "Opção inválida!"; sleep 1 ;;
        esac
    fi
    
    # Incrementa o offset para a cor "andar"
    ((offset++))
done
