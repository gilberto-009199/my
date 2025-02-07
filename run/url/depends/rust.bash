#!/bin/bash

bin_directory=${bin_directory:-"$HOME/my/run/bin"};
url_directory=${url_directory:-"$HOME/my/run/url"};
depends_directory="$url_directory/depends";
download_directory=${download_directory:-"$HOME/my/run/setup"};

if ! command -v cargo &>/dev/null; then
    echo "Rust não instalado! Instalando..."
    
    mkdir -p "$download_directory/rust" 
    mkdir -p "$download_directory/rust/cargo_home" "$download_directory/rust/rust_home"
    export CARGO_HOME="$download_directory/rust/cargo_home"
    export RUSTUP_HOME="$download_directory/rust/rust_home"
    
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    
    source "$download_directory/rust/cargo_home/env"
    
    env_file="$HOME/my/run/env.bash";
    echo "# cargo_home/env" >> "$env_file";
    echo "source $download_directory/rust/cargo_home/env" >> "$env_file";

	ln -sf "$download_directory/rust/cargo_home/bin/"* "$bin_directory"
	
else
    echo "Rust já está instalado: $(cargo --version)"
fi
