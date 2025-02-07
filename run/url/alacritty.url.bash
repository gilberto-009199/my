#!/bin/bash

bin_directory=${bin_directory:-"$HOME/my/run/bin"};
url_directory=${url_directory:-"$HOME/my/run/url"};
depends_directory="$url_directory/depends";
download_directory=${download_directory:-"$HOME/my/run/setup"};

# Rename 
mkdir -p "$download_directory/alacritty";
tar -xf "$download_directory/alacritty.tar.gz" -C "$download_directory/alacritty";
echo "Arquivo descompactado em '$download_directory/alacritty/'";

# Verify depends 
#  + rust 
source "$depends_directory/rust.bash";
#  + Font Config 
source "$depends_directory/fontconfig.bash";

# cargo build --release
#cd "$download_directory/alacritty/alacritty-0.15.0"
cargo build --release --manifest-path "$download_directory/alacritty/alacritty-0.15.0/Cargo.toml"

chmod +x "$download_directory/alacritty/alacritty-0.15.0/alacritty-0.15.0/target/release/alacritty";
echo "Permissões atribuitas!";

# Link simbolico

mkdir -p "$bin_directory";
ln -sf "$download_directory/alacritty/alacritty-0.15.0/target/release/alacritty" "$bin_directory/alacritty";
chmod +x "$bin_directory/alacritty";
echo "Link Simbolico gerado! '$bin_directory/alacritty'";


