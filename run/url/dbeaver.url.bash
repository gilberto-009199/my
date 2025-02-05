#!/bin/bash

bin_directory=${bin_directory:-"$HOME/my/run/bin"};
url_directory=${url_directory:-"$HOME/my/run/url"};
download_directory=${download_directory:-"$HOME/my/run/setup"};

# rename 
mkdir -p "$download_directory/dbeaver";
tar -xf "$download_directory/dbeaver.tar.gz" -C "$download_directory/dbeaver";
echo "Arquivo descompactado em '$download_directory/dbeaver/'";

chmod +x "$download_directory/dbeaver/dbeaver/dbeaver";
echo "Permissões atribuitas!";

# link simbolico
mkdir -p "$bin_directory";
ln -sf "$download_directory/dbeaver/dbeaver/dbeaver" "$bin_directory/dbeaver";
chmod +x "$bin_directory/dbeaver";
echo "Link Simbolico gerado! '$bin_directory/dbeaver'";
