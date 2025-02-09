#!/bin/bash

# Diretório onde estão os arquivos .url
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

source "$run_directory/bin.bash" || echo "Aviso: erro ao pegar $run_directory/bin.bash";


