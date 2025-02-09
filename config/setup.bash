#!/bin/bash

work_dir="$HOME"
config_directory="$work_dir/my/config"
dev_directory="$work_dir/my/dev"
doc_directory="$work_dir/my/doc"
raw_directory="$work_dir/my/raw"
tmp_directory="$work_dir/my/tmp"
run_directory="$work_dir/my/run"
bin_run_directory="$run_directory/bin"
url_run_directory="$run_directory/url"
setup_run_directory="$run_directory/setup"
scripts_run_directory="$run_directory/scripts"

if [[ -d "$config_directory/user/.backgrounds" ]]; then
  ln -sfn "$config_directory/user/.backgrounds" "$HOME/.backgrounds";
fi

if [[ -d "$config_directory/user/.fonts" ]]; then
  ln -sfn "$config_directory/user/.fonts" "$HOME/.fonts";
fi

if [[ -d "$config_directory/user/.icons" ]]; then
  ln -sfn "$config_directory/user/.icons" "$HOME/.icons";
fi

if [[ -d "$config_directory/user/.pixmaps" ]]; then
  ln -sfn "$config_directory/user/.pixmaps" "$HOME/.pixmaps";
fi

if [[ -d "$config_directory/user/.themes" ]]; then
  ln -sfn "$config_directory/user/.themes" "$HOME/.themes";
fi

if [[ -f "$config_directory/user/.tmux.config" ]]; then
  ln -sfn "$config_directory/user/.tmux.config" "$HOME/.tmux.config";
fi

# Config:
if [[ -d "$config_directory/user/.config" ]]; then
	if [[ -d "$config_directory/user/.config/openbox" ]]; then
        ln -sfn "$config_directory/user/.config/openbox" "$HOME/.config/openbox";
	fi
	if [[ -d "$config_directory/user/.config/tint2" ]]; then
        ln -sfn "$config_directory/user/.config/tint2" "$HOME/.config/tint2";        
    fi
    if [[ -d "$config_directory/user/.config/xfce4" ]]; then
        ln -sfn "$config_directory/user/.config/xfce4" "$HOME/.config/xfce4";
    fi
fi


