#!/bin/bash

bin_directory=${bin_directory:-"$HOME/my/run/bin"};
url_directory=${url_directory:-"$HOME/my/run/url"};
download_directory=${download_directory:-"$HOME/my/run/setup"};

# rename 

chmod +x "$download_directory/insomnia";
echo "Permissões atribuitas!";

# link simbolico
mkdir -p "$bin_directory";
ln -sf "$download_directory/insomnia" "$bin_directory/insomnia";
chmod +x "$bin_directory/insomnia";
echo "Link Simbolico gerado! '$bin_directory/insomnia'";

