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


# Setup Doc link simbolic
read -p "Deseja executar o setup do /doc?(s/n) }> " setup_doc;
[[ "$setup_doc" =~ ^[SsYy]$ ]] && {
    source "$doc_directory/setup.bash" || echo "Aviso: erro ao pegar $doc_directory/setup.bash";
}

# Setup Config User /config/user
read -p "Deseja executar o setup do /config?(s/n) }> " setup_config;
[[ "$setup_config" =~ ^[SsYy]$ ]] && {
    source "$config_directory/setup.bash" || echo "Aviso: erro ao pegar $config_directory/setup.bash";
}


# Setup Run dir
read -p "Deseja executar o setup do /run?(s/n) }> " setup_run;
[[ "$setup_run" =~ ^[SsYy]$ ]] && {
    source "$run_directory/setup.bash" || echo "Aviso: erro ao pegar $run_directory/setup.bash";
}

# Setup Env
read -p "Deseja adicionar o env.bash ao .bashrc?(s/n) }> " setup_env;
[[ "$setup_env" =~ ^[SsYy]$ ]] && {
    cat <<EOF >> "$HOME/.bashrc"
# env for my dir
[[ -f "$work_dir/my/env.bash" ]] && source $work_dir/my/env.bash
EOF
}

# Setup Bin
read -p "Deseja adicionar o bin.bash ao .bashrc?(s/n) }> " setup_bin;
[[ "$setup_bin" =~ ^[SsYy]$ ]] && {
    cat <<EOF >> "$HOME/.bashrc"
# bin for my dir
[[ -f "$work_dir/my/bin.bash" ]] && source $work_dir/my/bin.bash
EOF
}


