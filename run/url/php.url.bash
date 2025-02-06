#!/bin/bash

bin_directory=${bin_directory:-"$HOME/my/run/bin"};
url_directory=${url_directory:-"$HOME/my/run/url"};
download_directory=${download_directory:-"$HOME/my/run/setup"};

mkdir -p "$download_directory/php";
tar -xf "$download_directory/php.tar.gz" -C "$download_directory/php";
echo "Arquivo descompactado em '$download_directory/php/'";

