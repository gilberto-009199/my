#!/bin/bash

bin_directory=${bin_directory:-"$HOME/my/run/bin"};
url_directory=${url_directory:-"$HOME/my/run/url"};
download_directory=${download_directory:-"$HOME/my/run/setup"};



chmod +x "$download_directory/browsh";
echo "Permissões atribuitas!";

# link simbolico

mkdir -p "$bin_directory";
ln -sf "$download_directory/browsh" "$bin_directory/browsh";
chmod +x "$bin_directory/browsh";
echo "Link Simbolico gerado! '$bin_directory/browsh'";

