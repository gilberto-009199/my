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

# Verificando se a lista de pacotes do Qt5 não está instalada
if ! dpkg -l | grep -q "qtbase5-dev"; then
    echo "Pacotes do Qt5 não instalados! Instalando..."
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        case "$ID" in
            debian | ubuntu)
                sudo apt install -y \
                    qtbase5-dev \
                    qttools5-dev-tools \
                    qtwebengine5-dev \
                    libqt5webkit5 \
                    libqt5websockets5-dev \
                    libqt5svg5 \
                    libqt5svg5-dev 
                ;;
            arch)
                sudo pacman -S --noconfirm qt5-base qt5-tools qt5-webengine qt5-websockets qt5-svg
                ;;
            fedora)
                sudo dnf install -y qt5-qtbase qt5-qttools qt5-qtwebengine qt5-qtwebsockets qt5-qtsvg
                ;;
            *)
                echo "Distribuição não reconhecida. Instale manualmente o Qt."
                exit 1
                ;;
        esac
    elif [ "$(uname -s)" = "OpenBSD" ]; then
        doas pkg_add qt5
    else
        echo "Sistema não reconhecido. Instale manualmente."
        exit 1
    fi
else
    echo "Pacotes do Qt5 já instalados."
fi

