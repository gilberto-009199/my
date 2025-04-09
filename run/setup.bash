#!/bin/bash

# Diretório onde estão os arquivos .url
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

# Verifica se o diretório existe
[[ ! -d "$url_run_directory" ]] && {
    echo "Diretório não encontrado: $url_run_directory";
    exit 1;
}

# Navega até o diretório com os arquivos .url
cd "$url_run_directory" || {
	echo "Aviso: erro ao entrar em  $url_run_directory"; 
	exit 1;
}

res_auto_install="n"
read -p "Deseja instalar todos os pacotes automaticamente? (s/n) > " res_auto_install;


# Loop pelos arquivos .url no diretório
for url_file in *.url; do
    # Verifica se o arquivo .url é válido

    [ -f "$url_file" ] || { 
    	echo "Arquivo $url_file inválido";
    	continue;
    }
    
    # Extrai o URL do arquivo .url e baixa o arquivo usando wget
    url=$(grep -oP 'URL=\K.*' "$url_file");
    name=$(grep -oP 'Name=\K.*' "$url_file");
    icon=$(grep -oP 'Icon=\K.*' "$url_file");
    exec=$(grep -oP 'Exec=\K.*' "$url_file");
    comment=$(grep -oP 'Comment=\K.*' "$url_file");
	url_output=$(grep -oP 'URL_Output=\K.*' "$url_file");
    

    [ -n "$url" ] || { 
    	echo "URL $url Invalida!";
    	continue;
   	}
    echo "###########################";
    echo "   + $name";
	echo "     Exec: $exec";
    echo "     Desc: $comment";
    echo "     Url: $url";
    
    # Instalar automaticamente sem perguntar
    res_install_package="s";
    [[ "$res_auto_install" =~ ^[SsYy]$ ]] || {
    	read -p "Deseja baixar e instalar '$name'? (s/n) }> " res_install_package;
    }

	[[ ! "$res_install_package" =~ ^[SsYy]$ ]] && continue;

	echo "Baixando $url ...";
	
    # Executa wget e verifica se houve problemas
    #cd "$download_directory";
    wget -q --show-progress "$url" -O "$setup_run_directory/$url_output";
    [ $? -ne 0 ]  && {
	echo "$?";
	echo "Erro ao baixar '$url'";
    	continue;
    }
    
    # Exec
    [[ ! -n "$exec" ]] && {
    	echo "Sem scripts '$exec'";
    	continue;
    }
    
	# Instalar automaticamente sem perguntar
	res_exec="s"
	[[ ! "$res_auto_install" =~ ^[SsYy]$ ]] && {
		read -p "Deseja executar o '$exec' (s/n) }> " res_exec;
	}

	[[ "$res_exec" =~ ^[SsYy]$ ]] && {
		echo "Executando: $exec";
		source "$url_run_directory/$exec" || echo "Aviso: erro ao executar $exec";
	}

    echo "Setup de $name, concluido!";
    echo "###########################";
	cd "$url_run_directory";
done

echo "Setup concluído."
