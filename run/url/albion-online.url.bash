#!/bin/bash

bin_directory=${bin_directory:-"$HOME/my/run/bin"};
url_directory=${url_directory:-"$HOME/my/run/url"};
download_directory=${download_directory:-"$HOME/my/run/setup"};

chmod +x "$download_directory/albion-online-setup";
echo "Permissões atribuitas!";

# link simbolico

mkdir -p "$bin_directory";
ln -sf "$download_directory/albion-online-setup" "$bin_directory/albion-online-setup";
chmod +x "$bin_directory/albion-online-setup";
echo "Link Simbolico gerado! '$bin_directory/albion-online-setup'";

