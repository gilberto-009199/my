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
mkdir -p "$setup_run_directory/tor-browser";
tar -xf "$setup_run_directory/tor-browser.tar.xz" -C "$setup_run_directory/tor-browser";
echo "Arquivo descompactado em '$setup_run_directory/tor-browser/'";

file_exec="$setup_run_directory/tor-browser/tor-browser/Browser/start-tor-browser";

chmod +x "$file_exec";
echo "Permissões atribuitas!";

# Link simbolico

mkdir -p "$bin_run_directory";
ln -sf "$file_exec" "$bin_run_directory/tor-browser";

chmod +x "$bin_run_directory/tor-browser";
echo "Link Simbolico gerado! '$bin_run_directory/tor-browser'";
