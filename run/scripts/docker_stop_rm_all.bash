#!/bin/bash

commands_scripts_directory="$HOME/my/run/scripts/commands"
chmod +x $commands_scripts_directory/docker_stop_rm_all.bash
alias dockerclean="$commands_scripts_directory/docker_stop_rm_all.bash"

