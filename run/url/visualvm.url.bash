#!/bin/bash

bin_directory=${bin_directory:-"$HOME/my/run/bin"};
url_directory=${url_directory:-"$HOME/my/run/url"};
download_directory=${download_directory:-"$HOME/my/run/setup"};

# rename 
mkdir -p "$download_directory/visualvm";
unzip -o "$download_directory/visualvm.zip" -d "$download_directory/visualvm";
echo "Arquivo descompactado em '$download_directory/visualvm/'";

chmod +x "$download_directory/visualvm/visualvm_218/bin/visualvm";
echo "Permissões atribuitas!";

# Link simbolico

mkdir -p "$bin_directory";
ln -sf "$download_directory/visualvm/visualvm_218/bin/visualvm" "$bin_directory/visualvm";
chmod +x "$bin_directory/visualvm";
echo "Link Simbolico gerado! '$bin_directory/visualvm'";
