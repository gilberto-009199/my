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
mkdir -p "$setup_run_directory/alacritty";
tar -xf "$setup_run_directory/alacritty.tar.gz" -C "$setup_run_directory/alacritty";
echo "Arquivo descompactado em '$setup_run_directory/alacritty/'";

# Verify depends 
#  + rust 
source "$depends_url_run_directory/rust.bash";
#  + Font Config 
source "$depends_url_run_directory/fontconfig.bash";

# cargo build --release
#cd "$download_directory/alacritty/alacritty-0.15.0"
cargo build --release --manifest-path "$setup_run_directory/alacritty/alacritty-0.15.0/Cargo.toml"

chmod +x "$setup_run_directory/alacritty/alacritty-0.15.0/alacritty-0.15.0/target/release/alacritty";
echo "Permissões atribuitas!";

# Link simbolico

mkdir -p "$bin_run_directory";
ln -sf "$setup_run_directory/alacritty/alacritty-0.15.0/target/release/alacritty" "$bin_run_directory/alacritty";
chmod +x "$bin_run_directory/alacritty";
echo "Link Simbolico gerado! '$bin_run_directory/alacritty'";


