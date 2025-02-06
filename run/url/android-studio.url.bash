#!/bin/bash

bin_directory=${bin_directory:-"$HOME/my/run/bin"};
url_directory=${url_directory:-"$HOME/my/run/url"};
download_directory=${download_directory:-"$HOME/my/run/setup"};

mkdir -p "$download_directory/android-studio";
tar -xf "$download_directory/android-studio.tar.gz" -C "$download_directory/android-studio";
echo "Arquivo descompactado em '$download_directory/android-studio/'";

chmod +x "$download_directory/android-studio/android-studio/bin/studio.sh";
echo "Permissões atribuitas!";

# link simbolico

mkdir -p "$bin_directory";
ln -sf "$download_directory/android-studio/android-studio/bin/studio.sh" "$bin_directory/android-studio";
chmod +x "$bin_directory/android-studio";
echo "Link Simbolico gerado! '$bin_directory/android-studio'";

