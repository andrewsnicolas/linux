#!/bin/bash

# 1. Validação de Entrada
echo "Digite o nome para a pasta/arquivo:"
read nome

# Verificação de Permissão (Item 2 da foto)
if [[ -f "$nome" ]]; then
    if [[ -w "$nome" ]]; then
        echo "Arquivo liberado para edição."
        
        # 3. Editor de Texto (Item 3 da foto)
        echo "Abrindo para a edição..."
        sleep 1s
        nano "$nome"
        
        echo "Arquivo salvo com sucesso. Listando criação:"
        ls -l "$nome"
    else
        # Mensagem obrigatória conforme a foto
        echo "Você não pode editar este arquivo."
    fi
else
    # Se não existe, o item 1 diz para criar uma PASTA
    # (Embora o item 3 peça para salvar texto, seguiremos o item 1)
    mkdir "$nome"
    echo "Pasta '$nome' criada com sucesso."
fi

# 4. Sair do script (Item 4)
exit
