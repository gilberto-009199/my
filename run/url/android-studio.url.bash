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

mkdir -p "$setup_run_directory/android-studio";
tar -xf "$setup_run_directory/android-studio.tar.gz" -C "$setup_run_directory/android-studio";
echo "Arquivo descompactado em '$setup_run_directory/android-studio/'";

chmod +x "$setup_run_directory/android-studio/android-studio/bin/studio.sh";
echo "Permissões atribuitas!";

# link simbolico

mkdir -p "$bin_run_directory";
ln -sf "$setup_run_directory/android-studio/android-studio/bin/studio.sh" "$bin_run_directory/android-studio";
chmod +x "$bin_run_directory/android-studio";
echo "Link Simbolico gerado! '$bin_run_directory/android-studio'";

