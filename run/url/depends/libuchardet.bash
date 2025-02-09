#!/bin/bash

work_dir="$HOME"
config_directory="$work_dir/my/config"
dev_directory="$work_dir/my/dev"
doc_directory="$work_dir/my/doc"
raw_directory="$work_dir/my/raw"
tmp_directory="$work_dir/my/tmp"
run_directory="$work_dir/my/run"
bin_run_directory="$run_directory/bin"
setup_run_directory="$run_directory/setup"
scripts_run_directory="$run_directory/scripts"
url_run_directory="$run_directory/url"
depends_url_run_directory="$run_directory/url/depends"

# Verificando e instalando libuchardet-dev
if ! dpkg -l | grep -q "libuchardet-dev"; then
    echo "Pacote libuchardet-dev não instalado! Instalando..."
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        case "$ID" in
            debian | ubuntu)
                sudo apt install -y libuchardet-dev
                ;;
            arch)
                sudo pacman -S --noconfirm uchardet
                ;;
            fedora)
                sudo dnf install -y uchardet-devel
                ;;
            *)
                echo "Distribuição não reconhecida. Instale manualmente."
                exit 1
                ;;
        esac
    elif [ "$(uname -s)" = "OpenBSD" ]; then
        doas pkg_add uchardet
    else
        echo "Sistema não reconhecido. Instale manualmente."
        exit 1
    fi
else
    echo "Pacote libuchardet-dev já está instalado."
fi
