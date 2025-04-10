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

# rename & move
mkdir -p "$setup_run_directory/cursor";
cp "$setup_run_directory/cursor.AppImage" -C "$setup_run_directory/cursor/cursor.AppImage";
echo "Arquivo em '$setup_run_directory/cursor/cursor.AppImage'";

file_exec="$setup_run_directory/cursor/cursor.AppImage";

chmod +x "$file_exec";
echo "Permissões atribuitas!";

# Link simbolico

mkdir -p "$bin_run_directory";
ln -sf "$file_exec" "$bin_run_directory/cursor";
chmod +x "$bin_run_directory/cursor";
echo "Link Simbolico gerado! '$bin_run_directory/cursor'";


