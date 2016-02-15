#!/bin/bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

CONFIG_FILE=(
  "bashrc"
  "bash_aliases"
  "gitconfig"
  "gitignore"
  "tmux.conf"
  "tmux.conf-1.x"
  "tmux.conf-2.1"
  "vimrc")

OSX_CONFIG_FILE=(
  "bash_profile"
)

for config_file in "${CONFIG_FILE[@]}";
do
  ln -sf "${DIR}/${config_file}" "${HOME}/.${config_file}"
done

# Set up vim file.
if [ -e "${HOME}/.vim" ]; then
  read -p "Found ~/.vim, detele it (y)?" ans
  if [ "${ans}" == "y" ]; then
    mv "${HOME}/.vim" "${HOME}/vim_old"
    rm -rf "${HOME}/.vim"

    ln -s "${DIR}/vim" "${HOME}/.vim"

  fi
fi

# install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Set up gitignore file.
mv "${HOME}/.gitignore" "${HOME}/.gitignore_global"

if [ "$(uname)" == "Darwin" ]; then
  for config_file in "${OSX_CONFIG_FILE[@]}";
  do
    ln -sf "${DIR}/osx/${config_file}" "${HOME}/.${config_file}"
  done
fi
