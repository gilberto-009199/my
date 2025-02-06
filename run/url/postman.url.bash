#!/bin/bash

bin_directory=${bin_directory:-"$HOME/my/run/bin"};
url_directory=${url_directory:-"$HOME/my/run/url"};
download_directory=${download_directory:-"$HOME/my/run/setup"};

mkdir -p "$download_directory/postman";
tar -xf "$download_directory/postman.tar.gz" -C "$download_directory/postman";
echo "Arquivo descompactado em '$download_directory/postman/'";

chmod +x "$download_directory/postman/Postman/app/postman";
echo "Permissões atribuitas!";

# link simbolico

mkdir -p "$bin_directory";
ln -sf "$download_directory/postman/Postman/app/postman" "$bin_directory/postman";
chmod +x "$bin_directory/postman";
echo "Link Simbolico gerado! '$bin_directory/postman'";

