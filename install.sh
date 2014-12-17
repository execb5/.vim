#!/bin/sh

[ -d ~/.vim/bundle/Vundle.vim ] || git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
ln -sf $(pwd)/vimrc ~/.vimrc
vim +PluginInstall +PluginClean +qall
cd ~/.vim/vimproc.vim
make
