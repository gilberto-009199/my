#!/bin/bash

bin_directory=${bin_directory:-"$HOME/my/run/bin"};
url_directory=${url_directory:-"$HOME/my/run/url"};
download_directory=${download_directory:-"$HOME/my/run/setup"};

# rename 
mkdir -p "$download_directory/tlauncher";
unzip -o "$download_directory/tlauncher.zip" -d "$download_directory/tlauncher";
echo "Arquivo descompactado em '$download_directory/tlauncher/'";

chmod +x "$download_directory/tlauncher/TLauncher-2.899.jar";
echo "Permissões atribuitas!";

# Link simbolico

mkdir -p "$bin_directory";
ln -sf "$download_directory/tlauncher/TLauncher-2.899.jar" "$bin_directory/tlauncher.jar";
chmod +x "$bin_directory/tlauncher.jar";
echo "Link Simbolico gerado! '$bin_directory/tlauncher.jar'";
echo "#!/bin/bash java -jar $bin_directory/tlauncher.jar" > "$bin_directory/tlauncher";
chmod +x "$bin_directory/tlauncher";
