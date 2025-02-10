#!/bin/bash

work_dir="$HOME"
config_directory="$work_dir/my/config"
dev_directory="$work_dir/my/dev"
doc_directory="$work_dir/my/doc"
raw_directory="$work_dir/my/raw"
tmp_directory="$work_dir/my/tmp"
run_directory="$work_dir/my/run"
bin_run_directory="$run_directory/bin"
setup_run_directory="$run_directory/setup"
scripts_run_directory="$run_directory/scripts"
url_run_directory="$run_directory/url"
depends_url_run_directory="$run_directory/url/depends"


# Rename 
mkdir -p "$setup_run_directory/asdf";
tar -xf "$setup_run_directory/asdf.tar.gz" -C "$setup_run_directory/asdf";
echo "Arquivo descompactado em '$setup_run_directory/asdf/'";

# Verify depends 
#  + Go lang
source "$depends_url_run_directory/golang.bash";
PWD=$(pwd)
cd "$setup_run_directory/asdf/asdf-0.16.2"
make
cd "$PWD"

chmod +x "$setup_run_directory/asdf/asdf-0.16.2/asdf"
echo "Permissões atribuitas!";

# Link simbolico
mkdir -p "$bin_run_directory";
ln -sf "$setup_run_directory/asdf/asdf-0.16.2/asdf" "$bin_run_directory/asdf";
chmod +x "$bin_run_directory/asdf";
echo "Link Simbolico gerado! '$bin_run_directory/asdf'";


# Add Env
if [[ -d "${ASDF_DATA_DIR:-$HOME/.asdf}/shims" ]]; then

   export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH";
cat <<EOF >> "$run_directory/env.bash"
# Asdf Shims
if [ -f "${ASDF_DATA_DIR:-$HOME/.asdf}/shims" ]; then
	export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:\$PATH"
fi
EOF

fi




