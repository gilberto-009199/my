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

if ! command -v go &>/dev/null; then
    echo "Go não instalado! Instalando...";
    wget https://go.dev/dl/go1.23.6.linux-amd64.tar.gz -O "$setup_run_directory/go.tar.gz";
    mkdir "$setup_run_directory/go";
    tar -xf "$setup_run_directory/go.tar.gz" -C "$setup_run_directory/go";
    chmod +x "$setup_run_directory/go/go/bin/go";
	chmod +x "$setup_run_directory/go/go/bin/gofmt";

	mkdir -p "$bin_run_directory";
	ln -sf "$setup_run_directory/go/go/bin/go" "$bin_run_directory/go";
	ln -sf "$setup_run_directory/go/go/bin/gofmt" "$bin_run_directory/gofmt";
	chmod +x "$bin_run_directory/go";
	chmod +x "$bin_run_directory/gofmt";
	echo "Go lang instalado em '$bin_run_directory/go'!";
	export PATH="$PATH:$bin_run_directory/";
else
    echo "Go já está instalado: $(cargo --version)";
fi
