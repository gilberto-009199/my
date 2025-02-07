#!/bin/bash

bin_directory=${bin_directory:-"$HOME/my/run/bin"};
url_directory=${url_directory:-"$HOME/my/run/url"};
depends_directory="$url_directory/depends";
download_directory=${download_directory:-"$HOME/my/run/setup"};

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

