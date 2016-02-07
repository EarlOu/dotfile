#!/bin/bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

CONFIG_FILE=(
  "bashrc"
  "bash_aliases"
  "gitconfig"
  "gitignore"
  "tmux.conf"
  "vimrc"
  "vim")

OSX_CONFIG_FILE=(
  "bash_profile"
)

for config_file in "${CONFIG_FILE[@]}";
do
  ln -sf "${DIR}/${config_file}" "${HOME}/.${config_file}"
done

if [ "$(uname)" == "Darwin" ]; then
  for config_file in "${OSX_CONFIG_FILE[@]}";
  do
    ln -sf "${DIR}/osx/${config_file}" "${HOME}/.${config_file}"
  done
fi
