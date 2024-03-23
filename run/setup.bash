#!/bin/bash

# Diretório onde estão os arquivos .url
url_directory="$HOME/my/run/url"
download_directory="$HOME/my/run/setup"

# @todo criar um que hook post download para rodar um comando dentro dos .url

# Verifica se o diretório existe
if [ ! -d "$url_directory" ]; then
    echo "Diretório não encontrado: $url_directory"
    exit 1
fi

# Navega até o diretório com os arquivos .url
cd "$url_directory" || exit

# Loop pelos arquivos .url no diretório
for url_file in *.url; do
    # Verifica se o arquivo .url é válido
    if [ -f "$url_file" ]; then
        # Extrai o URL do arquivo .url e baixa o arquivo usando wget
        url=$(grep -oP 'URL=\K[^ ]+' "$url_file")
        name=$(grep -oP 'Name=\K[^.]+' "$url_file")
        comment=$(grep -oP 'Comment=\K[^.]+' "$url_file")
        if [ -n "$url" ]; then
            echo "+ $name: $comment"
            echo "Baixando $url ..."
            # Executa wget e verifica se houve problemas
            cd "$download_directory"
            wget -P "$download_directory" "$url"
            if [ $? -ne 0 ]; then
                echo "Erro ao baixar $url"
            fi
        else
            echo "Erro: Não foi possível encontrar o URL em $url_file"
        fi
	cd "$url_directory"
    fi
done

echo "Download concluído."
