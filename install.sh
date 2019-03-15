#!/bin/sh

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

ln -sf $(pwd)/vimrc ~/.vimrc
echo "vimrc symlinked"
ln -sf $(pwd)/gitconfig ~/.gitconfig
echo "gitconfig symlinked"
ln -sf $(pwd)/tmux.conf ~/.tmux.conf
echo "tmux.conf symlinked"
ln -sf $(pwd)/gitignore ~/.gitignore
echo ".gitignore symlinked"

vim +PlugInstall +qall
echo "Plugins installed!"

echo "Setting oh my zsh..."
[ -d ~/.oh-my-zsh ] || git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
[ -d ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ] || git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
echo "oh my zsh configured!"

ln -sf $(pwd)/zshrc ~/.zshrc
echo "zshrc symlinked"
ln -sf $(pwd)/custom.zsh-theme ~/.oh-my-zsh/themes/custom.zsh-theme
echo "zsh-theme symlinked"

grep copythis zshrc >> ~/.bashrc
echo ".bashrc configuration created/appended"


[ -d ~/.mpd ] || mkdir ~/.mpd
ln -sf $(pwd)/mpd.conf ~/.mpd/mpd.conf
touch ~/.mpd/mpd.db
touch ~/.mpd/mpd.log
touch ~/.mpd/mpdstate
[ -d ~/.mpd/playlists ] || mkdir ~/.mpd/playlists

[ -d ~/.ncmpcpp ] || mkdir ~/.ncmpcpp
ln -sf $(pwd)/ncmpcpp ~/.ncmpcpp/config

[ -d ~/.vimtmp ] || mkdir ~/.vimtmp
[ -d ~/.vimundo ] || mkdir ~/.vimundo
echo ".vimtmp directory created"

