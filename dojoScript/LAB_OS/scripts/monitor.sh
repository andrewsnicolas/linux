#!/bin/bash

while true; do
    clear # Limpa a tela antes de mostrar o menu
    echo -e "\033[0;34m==========================================\033[0m"
    echo " 1) Listar Arquivos"
    echo " 2) Monitorar Processos"
    echo " 3) Encerrar Processo"
    echo " 4) Jobs em segundo plano"
    echo " 5) Sair"
    echo "------------------------------------------"
    echo -n "Escolha uma opção: "
    read op

    case $op in
        1)
            echo -e "Listando os arquivos:\n"
            ls -al ..
            ;;
        2)
            echo -e "Monitorando Processos (Top 5 CPU):\n"
            ps aux --sort=-%cpu | head -n 6
            ;;
        3)
            echo "Digite o nome de um programa:"
            read programa
            pid=$(pgrep $programa)
            if [ -z "$pid" ]; then
                echo "Processo não encontrado."
            else
                kill $pid && echo "Processo $nome encerrado."
            fi
            ;;
        4)
            echo "Verificando Jobs..."
            sleep 100 &
            jobs
            ;;
        5)
            echo "Saindo..."
            break
            ;;
        *)
            echo "Opção inválida!"
            ;;
    esac

    # O SEGREDO ESTÁ AQUI:
    if [ "$op" != "5" ]; then
        echo -e "\n------------------------------------------"
        read -p "Pressione [Enter] para voltar ao menu..." 
    fi
done
