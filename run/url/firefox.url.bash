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

# rename 
mkdir -p "$setup_run_directory/firefox";
tar -xf "$setup_run_directory/firefox.tar.xz" -C "$setup_run_directory/firefox";
echo "Arquivo descompactado em '$setup_run_directory/firefox/'";

chmod +x "$setup_run_directory/firefox/firefox/firefox";
echo "Permissões atribuitas!";

# link simbolico
mkdir -p "$bin_run_directory";
ln -sf "$setup_run_directory//firefox/firefox/firefox" "$bin_run_directory/firefox";
chmod +x "$bin_run_directory/firefox";
echo "Link Simbolico gerado! '$bin_run_directory/firefox'";

