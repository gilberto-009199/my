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


# Rename 
mkdir -p "$setup_run_directory/notepadqq";
tar -xf "$setup_run_directory/notepadqq.tar.gz" -C "$setup_run_directory/notepadqq";
echo "Arquivo descompactado em '$setup_run_directory/notepadqq/'";

# Verify depends 
# + Qt 
source "$depends_url_run_directory/libqt.bash";
# + chardet
source "$depends_url_run_directory/libuchardet.bash";
# + pkg_config
source "$depends_url_run_directory/pkg_config.bash";

# Build
PWD=$(pwd)
mkdir -p "$setup_run_directory/notepadqq/build";
cd "$setup_run_directory/notepadqq/notepadqq-beta/"

./configure --prefix "$setup_run_directory/notepadqq/build";
make
make install
cd "$PWD"

# Link simbolico
mkdir -p "$bin_run_directory";
ln -sf "$setup_run_directory/notepadqq/build/bin/notepadqq" "$bin_run_directory/notepadqq";
chmod +x "$bin_run_directory/notepadqq";
echo "Link Simbolico gerado! '$bin_run_directory/notepadqq'";

