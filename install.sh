#!/bin/sh

rm -rf $(pwd)/bundle/Vundle.vim/
#Works like an if
#[ -d ~/.vim/bundle/Vundle.vim ] || git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
ln -sf $(pwd)/vimrc ~/.vimrc
vim +PluginInstall +PluginClean +qall
cd ~/.vim/bundle/vimproc.vim
make
