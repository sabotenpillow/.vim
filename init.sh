#!/bin/sh

VIM_DIR=~/.vim
if ! [ -d $VIM_DIR/autoload ]; then
  curl -fLo $VIM_DIR/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
else
  echo 'already cloned vim-plug'
fi

if ! [ -d undo ]; then
  mkdir undo
else
  echo 'undo directory is already existed'
fi

## nvim's data dir
NVIM_DATA_DIR="${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site
if ! [ -L $NVIM_DATA_DIR ]; then
  mkdir -p `dirname $NVIM_DATA_DIR` \
  && ln -s $VIM_DIR/nvim/data $NVIM_DATA_DIR \
  && echo "linked '$NVIM_DATA_DIR' to '$VIM_DIR/nvim/data' !!!!!"
else
  echo "already linked '$NVIM_DATA_DIR' to '$VIM_DIR/nvim/data'."
fi
