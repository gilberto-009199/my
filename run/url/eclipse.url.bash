#!/bin/bash

bin_directory=${bin_directory:-"$HOME/my/run/bin"};
url_directory=${url_directory:-"$HOME/my/run/url"};
download_directory=${download_directory:-"$HOME/my/run/setup"};

# rename 
mkdir -p "$download_directory/eclipse";
tar -xf "$download_directory/eclipse.tar.gz" -C "$download_directory/eclipse";
echo "Arquivo descompactado em '$download_directory/eclipse/'";

#chmod +x "$download_directory/eclipse/Discord/Discord";
#echo "Permissões atribuitas!";

# link simbolico

#mkdir -p "$bin_directory";
#ln -sf "$download_directory/discord/Discord/Discord" "$bin_directory/discord";
#chmod +x "$bin_directory/discord";
#echo "Link Simbolico gerado! '$bin_directory/discord'";
