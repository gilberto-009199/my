#!/bin/bash

bin_directory=${bin_directory:-"$HOME/my/run/bin"};
url_directory=${url_directory:-"$HOME/my/run/url"};
download_directory=${download_directory:-"$HOME/my/run/setup"};

# rename 
mkdir -p "$download_directory/firefox";
tar -xf "$download_directory/firefox.tar.xz" -C "$download_directory/firefox";
echo "Arquivo descompactado em '$download_directory/firefox/'";

chmod +x "$download_directory/firefox/firefox/firefox";
echo "Permissões atribuitas!";

# link simbolico
mkdir -p "$bin_directory";
ln -sf "$download_directory//firefox/firefox/firefox" "$bin_directory/firefox";
chmod +x "$bin_directory/firefox";
echo "Link Simbolico gerado! '$bin_directory/firefox'";

