#!/bin/sh

if ! [ -d bundle ]; then
  if [`which git`]; then
    mkdir ~/.vim/bundle
    cd ~/.vim/bundle && git clone https://github.com/Shougo/neobundle.vim.git
  else
    echo 'git not installed'
  fi
else
  echo 'neobundle is already isntalled'
fi

if ! [ -L $HOME/.vimrc ]; then
  cd && ln -s .vim/.vimrc
else
  echo 'already created symbolic link to .vimrc'
fi
