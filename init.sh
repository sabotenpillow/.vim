#!/bin/sh

if ! [ -d autoload ]; then
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
else
  echo 'already cloned vim-plug'
fi

if ! [ -d undo ]; then
  mkdir undo
else
  echo 'undo directory is already existed'
fi

if ! [ -L $HOME/.vimrc ]; then
  cd && ln -s .vim/.vimrc
else
  echo 'already created symbolic link to .vimrc'
fi
