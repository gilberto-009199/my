#!/bin/bash

setup_directory="$HOME/my/run/setup"
profiles_directory="$HOME/my/doc/reintegrar"

chmod +x $setup_directory/librewolf
alias browser="$setup_directory/librewolf"

# python profile
alias browser_estagio_python="$setup_directory/librewolf  --profile $profiles_directory/estagio/estagio_programacao_python/browser"
alias browser_python="$setup_directory/librewolf  --profile $profiles_directory/software/python/browser"
alias git_python_ssh="eval \"$(ssh-agent -s)\" && ssh-add \"$profiles_directory/estagio/estagio_programacao_python/id_ed25519\""
alias git_python="git config --global user.name \"gil-pyt\" && git config --global user.email \"gil1999sp@gmail.com\" && git_python_ssh"
alias workspace_python="git_python && bash | browser_estagio_python"

# gil
alias git_gil_ssh="eval \"$(ssh-agent -s)\" && ssh-add \"$HOME/.ssh/id_rsa\""
alias git_gil="git config --global user.name \"gilberto-009199\" && git config --global user.email \"gilberto.tec@vivaldi.net\" && git_gil_ssh"
alias workspace_gil="git_gil"

