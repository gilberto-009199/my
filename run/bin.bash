#!/bin/bash

# Diretório onde estão os arquivos .url
url_directory="$HOME/my/run/url"
download_directory="$HOME/my/run/setup"

# Verifica se o diretório existe
if [ ! -d "$download_directory" ]; then
    echo "Diretório não encontrado: $download_directory"
    exit 1
fi

