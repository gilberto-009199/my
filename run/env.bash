#!/bin/bash

# Diretório onde estão os arquivos .url
bin_directory="$HOME/my/run/bin"
url_directory="$HOME/my/run/url"
download_directory="$HOME/my/run/setup"
scripts_directory="$HOME/my/run/scripts"

# Verifica se o diretório existe
if [ ! -d "$download_directory" ]; then
    echo "Diretório não encontrado: $download_directory";
fi
if [ ! -d "$url_directory" ]; then
    echo "Diretório não encontrado: $url_directory";
fi
if [ ! -d "$scripts_directory" ]; then
    echo "Diretório não encontrado: $scripts_directory";
fi
if [ ! -d "$bin_directory" ]; then
    echo "Diretório não encontrado: $bin_directory";
fi



# cargo_home/env
source /home/administrador/my/run/setup/rust/cargo_home/env
