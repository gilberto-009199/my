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

if ! command -v fc-list &>/dev/null; then
    echo "Font Config não instalado! Instalando..."
    if [ -f /etc/os-release ]; then
		. /etc/os-release
		case "$ID" in
		    debian | ubuntu)
		        sudo apt update && sudo apt install -y libfontconfig1-dev
		        ;;
		    arch)
		        sudo pacman -S --noconfirm fontconfig
		        ;;
		    fedora)
		        sudo dnf install -y fontconfig-devel
		        ;;
		    *)
		        echo "Distribuição não reconhecida. Instale manualmente."
		        exit 1
		        ;;
		esac
	elif [ "$(uname -s)" = "OpenBSD" ]; then
		doas pkg_add fontconfig
	else
    	echo "Sistema não reconhecido. Instale manualmente."
    	exit 1
	fi
else
    echo "Font Config já está instalado: $(cargo --version)"
fi

