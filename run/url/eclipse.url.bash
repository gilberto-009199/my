#!/bin/bash

bin_directory=${bin_directory:-"$HOME/my/run/bin"};
url_directory=${url_directory:-"$HOME/my/run/url"};
download_directory=${download_directory:-"$HOME/my/run/setup"};

# rename 
mkdir -p "$download_directory/eclipse";
tar -xf "$download_directory/eclipse.tar.gz" -C "$download_directory/eclipse";
echo "Arquivo descompactado em '$download_directory/eclipse/'";

chmod +x "$download_directory/eclipse/eclipse/eclipse";
echo "Permissões atribuitas!";

# link simbolico

mkdir -p "$bin_directory";
ln -sf "$download_directory/eclipse/eclipse/eclipse" "$bin_directory/eclipse";
chmod +x "$bin_directory/eclipse";
echo "Link Simbolico gerado! '$bin_directory/eclipse'";

