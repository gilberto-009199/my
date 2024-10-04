#!/bin/bash

# Diretórios
commands_scripts_directory="$HOME/my/run/scripts/commands"
config_directory="$HOME/my/run/scripts/configs"

# Função "dragao"
dragao() {
    # Verifica se um executável foi passado como argumento
    if [ -z "$1" ]; then
        echo "Uso: dragao <executavel>"
        return 1
    fi

    # Verifica se o perfil do Firejail existe
    profile="$config_directory/firejail_dragao.profile"
    if [ ! -f "$profile" ]; then
        echo "Erro: Perfil $profile não encontrado!"
        return 1
    fi

    # Executa o comando com o Firejail e o perfil
    firejail --profile="$profile" "$@"
}

# Exporta a função para torná-la disponível no shell
export -f dragao

# Função "leao"
leao() {
    # Verifica se um executável foi passado como argumento
    if [ -z "$1" ]; then
        echo "Uso: leao <executavel>"
        return 1
    fi

    # Verifica se o perfil do Firejail existe
    profile="$config_directory/firejail_leao.profile"
    if [ ! -f "$profile" ]; then
        echo "Erro: Perfil $profile não encontrado!"
        return 1
    fi

    # Executa o comando com o Firejail e o perfil
    firejail --profile="$profile" "$@"
}

# Exporta a função para torná-la disponível no shell
export -f leao


# Função "leao"
jaguatirica() {
    # Verifica se um executável foi passado como argumento
    if [ -z "$1" ]; then
        echo "Uso: leao <executavel>"
        return 1
    fi

    # Verifica se o perfil do Firejail existe
    profile="$config_directory/firejail_jaguatirica.profile"
    if [ ! -f "$profile" ]; then
        echo "Erro: Perfil $profile não encontrado!"
        return 1
    fi

    # Executa o comando com o Firejail e o perfil
    firejail --profile="$profile" "$@"
}

# Exporta a função para torná-la disponível no shell
export -f jaguatirica