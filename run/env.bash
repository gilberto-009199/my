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
source /home/administrador/my/run/setup/rust/cargo_home/env
    # Asdf Shims
	export PATH="/home/administrador/.asdf/shims:/home/administrador/.asdf/shims:/home/administrador/my/run/setup/rust/cargo_home/bin:/home/administrador/.cargo/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/home/administrador/my/run/bin/:/home/administrador/my/run/bin/"
