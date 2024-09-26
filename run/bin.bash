#!/bin/bash

# Diretório onde estão os arquivos .url
url_directory="$HOME/my/run/url"
download_directory="$HOME/my/run/setup"
scripts_directory="$HOME/my/run/scripts"

# Verifica se o diretório existe
if [ ! -d "$download_directory" ]; then
    echo "Diretório não encontrado: $download_directory"
fi

if [ -d "$scripts_directory" ]; then
    for file in $scripts_directory/*.bash; do
        chmod +x $file
        source "$file"
    done
fi

