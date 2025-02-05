#!/bin/bash

bin_directory=${bin_directory:-"$HOME/my/run/bin"};
url_directory=${url_directory:-"$HOME/my/run/url"};
download_directory=${download_directory:-"$HOME/my/run/setup"};

# rename 
file_exec="$download_directory/pcloud";

chmod +x "$file_exec";
echo "Permissões atribuitas!";

# Link simbolico

mkdir -p "$bin_directory";
ln -sf "$file_exec" "$bin_directory/pcloud";

chmod +x "$bin_directory/pcloud";
echo "Link Simbolico gerado! '$bin_directory/pcloud'";
