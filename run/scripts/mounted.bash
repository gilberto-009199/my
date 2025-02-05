#!/bin/bash
# Diretórios
commands_scripts_directory="$HOME/my/run/scripts/commands"
config_directory="$HOME/my/run/scripts/configs"

# Função "montar"
montar() {

    # verifica a existencia do /dev/sda3
    dispositivo="/dev/sdb3"
    if [ ! -b "$dispositivo" ]; then
        echo "Erro: Dispositivo $dispositivo não encontrado!"
        return 1
    fi

    # verificar se o dispositivo ja esta montado
    ponto_montagem="/media/administrador/sda3"
    if [ -f "$ponto_montagem" ]; then
        echo "Erro: Dispositivo $dispositivo não esta montado em $ponto_montagem!"
        return 1
    fi

    for device in /dev/mapper/*_crypt; do
        sudo cryptsetup close "$(basename "$device")"
    done

    # Tenta abrir o dispositivo criptografado
    sudo cryptsetup open "$dispositivo" sda3_crypt
    if [ $? -ne 0 ]; then  # Verifica se o comando anterior falhou
        echo "Erro: Não foi possível decriptar o dispositivo $dispositivo!"
        return 1
    fi

    sudo mkdir -p /media/administrador/sda3
    sudo mount /dev/mapper/sda3_crypt /media/administrador/sda3   
    echo "Montado em: $ponto_montagem"
}

# Exporta a função para torná-la disponível no shell
export -f montar

# Função "desmontar"
desmontar() {
    
    # verifica a existencia do /dev/sda3
    dispositivo="/dev/sda3"
    if [ ! -b "$dispositivo" ]; then
        echo "Erro: Dispositivo $dispositivo não encontrado!"
        return 1
    fi

    # verificar se o dispositivo esta montado
    ponto_montagem="/media/administrador/sda3"
    if ! mountpoint -q "$ponto_montagem"; then
        echo "Erro: Dispositivo $dispositivo não está montado em $ponto_montagem!"
        return 1
    fi
    
    # Desmonta o dispositivo
    sudo umount "$ponto_montagem"
    if [ $? -ne 0 ]; then
        echo "Erro: Falha ao desmontar o dispositivo $dispositivo em $ponto_montagem."
        return 1
    fi

    # Fecha o dispositivo criptografado
    sudo cryptsetup close sda3_crypt
    if [ $? -ne 0 ]; then
        echo "Erro: Falha ao fechar o dispositivo criptografado sda3_crypt."
        return 1
    fi

    sudo rm -rf "$ponto_montagem"
    echo "Dispositivo desmontado e ponto de montagem removido com sucesso."
}

# Exporta a função para torná-la disponível no shell
export -f desmontar