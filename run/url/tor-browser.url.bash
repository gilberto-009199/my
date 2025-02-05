#!/bin/bash

bin_directory=${bin_directory:-"$HOME/my/run/bin"};
url_directory=${url_directory:-"$HOME/my/run/url"};
download_directory=${download_directory:-"$HOME/my/run/setup"};

# rename 
mkdir -p "$download_directory/tor-browser";
tar -xf "$download_directory/tor-browser.tar.xz" -C "$download_directory/tor-browser";
echo "Arquivo descompactado em '$download_directory/tor-browser/'";

file_exec="$download_directory/tor-browser/tor-browser/Browser/start-tor-browser";

chmod +x "$file_exec";
echo "Permissões atribuitas!";

# Link simbolico

mkdir -p "$bin_directory";
ln -sf "$file_exec" "$bin_directory/tor-browser";

chmod +x "$bin_directory/tor-browser";
echo "Link Simbolico gerado! '$bin_directory/tor-browser'";
