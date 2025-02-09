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

if ! command -v cargo &>/dev/null; then
    echo "Rust não instalado! Instalando..."
    
    mkdir -p "$setup_run_directory/rust" 
    mkdir -p "$setup_run_directory/rust/cargo_home" "$setup_run_directory/rust/rust_home"
    export CARGO_HOME="$setup_run_directory/rust/cargo_home"
    export RUSTUP_HOME="$setup_run_directory/rust/rust_home"
    
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    
    source "$setup_run_directory/rust/cargo_home/env"
    
    env_file="$run_directory/env.bash";
    
    echo "# cargo_home/env" >> "$env_file";
    echo "source $setup_run_directory/rust/cargo_home/env" >> "$env_file";
    ln -sf "$setup_run_directory/rust/cargo_home/bin/"* "$bin_run_directory"
	
else
    echo "Rust já está instalado: $(cargo --version)"
fi
