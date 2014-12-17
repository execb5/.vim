#!/bin/sh

rm -rf $(pwd)/bundle/Vundle.vim/
#Works like an if
#[ -d ~/.vim/bundle/Vundle.vim ] || git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
[ -d ~/.oh-my-zsh ] || git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
[ -d ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ] || git clone git://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
ln -sf $(pwd)/vimrc ~/.vimrc
ln -sf $(pwd)/Xdefaults ~/.Xdefaults
ln -sf $(pwd)/zshrc ~/.zshrc
vim +PluginInstall +PluginClean +qall
cd ~/.vim/bundle/vimproc.vim
make
