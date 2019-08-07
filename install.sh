#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset
#set -o xtrace

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

ln -sf $(pwd)/vimrc ~/.vimrc
echo "vimrc symlinked"
ln -sf $(pwd)/gitconfig ~/.gitconfig
echo "gitconfig symlinked"
ln -sf $(pwd)/tmux.conf ~/.tmux.conf
echo "tmux.conf symlinked"
ln -sf $(pwd)/latexmkrc ~/.latexmkrc
echo "latexmkrc symlinked"
ln -sf $(pwd)/gitignore ~/.gitignore
echo ".gitignore symlinked"
mkdir -p ~/.ssh
ln -sf $(pwd)/ssh_config ~/.ssh/config
echo ".ssh_config symlinked"
ln -sf $(pwd)/Xresources ~/.Xresources
echo "Xresources symlinked"
xrdb -merge ~/.Xresources
echo "Xresources merged"

[ -d ~/.ctags.d ] || mkdir ~/.ctags.d
for f in $(pwd)/ctags/*.ctags
do
	tag_file=${f##*/}
	ln -sf $f ~/.ctags.d/$tag_file
	echo "$tag_file symlinked"
done

vim +PlugInstall +qall
echo "Plugins installed!"

echo "Setting oh my zsh..."
[ -d ~/.oh-my-zsh ] || git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
[ -d ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ] || git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
[ -d ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions ] || git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
echo "oh my zsh configured!"

ln -sf $(pwd)/zshrc ~/.zshrc
echo "zshrc symlinked"

grep copythis zshrc >> ~/.bashrc
echo ".bashrc configuration created/appended"


[ -d ~/.mpd ] || mkdir ~/.mpd
ln -sf $(pwd)/mpd.conf ~/.mpd/mpd.conf
touch ~/.mpd/mpd.db
touch ~/.mpd/mpd.log
touch ~/.mpd/mpdstate
mkdir -p ~/.mpd/playlists

[ -d ~/.ncmpcpp ] || mkdir ~/.ncmpcpp
ln -sf $(pwd)/ncmpcpp ~/.ncmpcpp/config

mkdir -p ~/.vimtmp
echo ".vimtmp directory set up"
mkdir -p ~/.vimundo
echo ".vimundo directory set up"

