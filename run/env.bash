#!/bin/bash

work_dir="$HOME"
config_directory="$work_dir/my/config"
dev_directory="$work_dir/my/dev"
doc_directory="$work_dir/my/doc"
raw_directory="$work_dir/my/raw"
tmp_directory="$work_dir/my/tmp"
run_directory="$work_dir/my/run"
bin_run_directory="$run_directory/bin"
url_run_directory="$run_directory/url"
setup_run_directory="$run_directory/setup"
scripts_run_directory="$run_directory/scripts"

# Verifica se o diretório existe
if [ ! -d "$bin_run_directory" ]; then
    echo "Diretório não encontrado: $bin_run_directory";
fi
if [ ! -d "$url_run_directory" ]; then
    echo "Diretório não encontrado: $url_run_directory";
fi
if [ ! -d "$setup_run_directory" ]; then
    echo "Diretório não encontrado: $setup_run_directory";
fi
if [ ! -d "$scripts_run_directory" ]; then
    echo "Diretório não encontrado: $scripts_run_directory";
fi


# cargo_home/env
if [ -f "/home/administrador/my/run/setup/rust/cargo_home/env" ]; then
	source /home/administrador/my/run/setup/rust/cargo_home/env;
fi

# Asdf Shims
if [ -d "/home/administrador/.asdf/shims" ]; then
	export PATH="/home/administrador/.asdf/shims:$PATH";
fi

# Asdf JAVA PLUGINS
if [ -f "/home/administrador/.asdf/plugins/java/set-java-home.bash" ]; then
	. ~/.asdf/plugins/java/set-java-home.bash
fi


