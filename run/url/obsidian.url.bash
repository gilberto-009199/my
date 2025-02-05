#!/bin/bash

bin_directory=${bin_directory:-"$HOME/my/run/bin"};
url_directory=${url_directory:-"$HOME/my/run/url"}
download_directory=${download_directory:-"$HOME/my/run/setup"}

# rename 
chmod +x "$download_directory/obsidian"
echo "Permissões atribuitas!"

# link simbolico
mkdir -p "$bin_directory";
ln -sf "$download_directory/obsidian" "$bin_directory/obsidian";
chmod +x "$bin_directory/obsidian";
echo "Link Simbolico gerado! '$bin_directory/obsidian'";
