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

# rename 
mkdir -p "$setup_run_directory/tlauncher";
unzip -o "$setup_run_directory/tlauncher.zip" -d "$setup_run_directory/tlauncher";
echo "Arquivo descompactado em '$setup_run_directory/tlauncher/'";

chmod +x "$setup_run_directory/tlauncher/TLauncher-2.899.jar";
echo "Permissões atribuitas!";

# Link simbolico

mkdir -p "$bin_run_directory";
ln -sf "$setup_run_directory/tlauncher/TLauncher-2.899.jar" "$bin_run_directory/tlauncher.jar";
chmod +x "$bin_run_directory/tlauncher.jar";
echo "Link Simbolico gerado! '$bin_run_directory/tlauncher.jar'";
echo "#!/bin/bash java -jar $bin_run_directory/tlauncher.jar" > "$bin_run_directory/tlauncher";
chmod +x "$bin_run_directory/tlauncher";
