#!/bin/bash

work_dir="$HOME"
config_directory="$work_dir/my/config"
dev_directory="$work_dir/my/dev"
doc_directory="$work_dir/my/doc"
documents_doc_directory="$doc_directory/Documents"
music_doc_directory="$doc_directory/Music"
pictures_doc_directory="$doc_directory/Pictures"
public_doc_directory="$doc_directory/Public"
videos_doc_directory="$doc_directory/Videos"
downloads_doc_directory="$doc_directory/Downloads"
web_doc_directory="$doc_directory/Web"
raw_directory="$work_dir/my/raw"
tmp_directory="$work_dir/my/tmp"
run_directory="$work_dir/my/run"
bin_run_directory="$run_directory/bin"
url_run_directory="$run_directory/url"
setup_run_directory="$run_directory/setup"
scripts_run_directory="$run_directory/scripts"

if [[ -d "$documents_doc_directory" ]]; then
  if compgen -G "$HOME/Documents/*" > /dev/null; then
    mv -f "$HOME/Documents/"* "$documents_doc_directory"
  fi
  
  if [[ -d "$HOME/Documents" && ! -L "$HOME/Documents" ]]; then
    rm -rf "$HOME/Documents"
  fi
  
  ln -sfn "$documents_doc_directory" "$HOME/Documents"
fi

if [[ -d "$music_doc_directory" ]]; then
  if compgen -G "$HOME/Music/*" > /dev/null; then
    mv -f "$HOME/Music/"* "$music_doc_directory"
  fi
  
  if [[ -d "$HOME/Music" && ! -L "$HOME/Music" ]]; then
    rm -rf "$HOME/Music"
  fi
  
  ln -sfn "$music_doc_directory" "$HOME/Music"
fi

if [[ -d "$pictures_doc_directory" ]]; then
  if compgen -G "$HOME/Pictures/*" > /dev/null; then
    mv -f "$HOME/Pictures/"* "$pictures_doc_directory"
  fi
  
  if [[ -d "$HOME/Pictures" && ! -L "$HOME/Pictures" ]]; then
    rm -rf "$HOME/Pictures"
  fi
  
  ln -sfn "$pictures_doc_directory" "$HOME/Pictures"
fi

if [[ -d "$public_doc_directory" ]]; then
  if compgen -G "$HOME/Public/*" > /dev/null; then
    mv -f "$HOME/Public/"* "$public_doc_directory"
  fi
  
  if [[ -d "$HOME/Public" && ! -L "$HOME/Public" ]]; then
    rm -rf "$HOME/Public"
  fi
  
  ln -sfn "$public_doc_directory" "$HOME/Public"
fi

if [[ -d "$videos_doc_directory" ]]; then
  if compgen -G "$HOME/Videos/*" > /dev/null; then
    mv -f "$HOME/Videos/"* "$videos_doc_directory"
  fi

  if [[ -d "$HOME/Videos" && ! -L "$HOME/Videos" ]]; then
    rm -rf "$HOME/Videos"
  fi
  
  ln -sfn "$videos_doc_directory" "$HOME/Videos"
fi

if [[ -d "$downloads_doc_directory" ]]; then
  if compgen -G "$HOME/Downloads/*" > /dev/null; then
    mv -f "$HOME/Downloads/"* "$downloads_doc_directory"
  fi

  if [[ -d "$HOME/Downloads" && ! -L "$HOME/Downloads" ]]; then
    rm -rf "$HOME/Downloads"
  fi
  
  ln -sfn "$downloads_doc_directory" "$HOME/Downloads"
fi

if [[ -d "$web_doc_directory" ]]; then
  if compgen -G "$HOME/Web/*" > /dev/null; then
    mv -f "$HOME/Web/"* "$web_doc_directory"
  fi
  
  if [[ -d "$HOME/Web" && ! -L "$HOME/Web" ]]; then
    rm -rf "$HOME/Web"
  fi
  
  ln -sfn "$web_doc_directory" "$HOME/Web"
fi


