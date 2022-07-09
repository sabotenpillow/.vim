#!/bin/sh

VIM_AUTOLOAD_DIR=~/.vim/autoload
if ! [ -d $VIM_AUTOLOAD_DIR ]; then
  curl -fLo $VIM_AUTOLOAD_DIR/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
else
  echo 'already cloned vim-plug'
fi

if ! [ -d undo ]; then
  mkdir undo
else
  echo 'undo directory is already existed'
fi

NVIM_AUTOLOAD_DIR="${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload
if ! [ -L $NVIM_AUTOLOAD_DIR/plug.vim ]; then
  mkdir -p $NVIM_AUTOLOAD_DIR \
  && ln -s $VIM_AUTOLOAD_DIR/plug.vim $NVIM_AUTOLOAD_DIR/plug.vim \
  && echo "linked '$NVIM_AUTOLOAD_DIR/plug.vim' to '$VIM_AUTOLOAD_DIR/plug.vim' !!!!!"
else
  echo "already linked '$NVIM_AUTOLOAD_DIR/plug.vim' to '$VIM_AUTOLOAD_DIR/plug.vim'"
fi
