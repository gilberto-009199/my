#!/bin/bash

bin_directory=${bin_directory:-"$HOME/my/run/bin"};
url_directory=${url_directory:-"$HOME/my/run/url"};
download_directory=${download_directory:-"$HOME/my/run/setup"};

mkdir -p "$download_directory/ngrok";
tar -xzf "$download_directory/ngrok.tgz" -C "$download_directory/ngrok";
echo "Arquivo descompactado em '$download_directory/ngrok/'";

chmod +x "$download_directory/ngrok/ngrok";
echo "Permissões atribuitas!";

# link simbolico

mkdir -p "$bin_directory";
ln -sf "$download_directory/ngrok/ngrok" "$bin_directory/ngrok";
chmod +x "$bin_directory/ngrok";
echo "Link Simbolico gerado! '$bin_directory/ngrok'";

