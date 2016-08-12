#!/bin/sh

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

ln -sf $(pwd)/vimrc ~/.vimrc
echo "vimrc symlinked"
ln -sf $(pwd)/gitconfig ~/.gitconfig
echo "gitconfig symlinked"
ln -sf $(pwd)/tmux.conf ~/.tmux.conf
echo "tmux.conf symlinked"
ln -sf $(pwd)/vimperatorrc ~/.vimperatorrc
echo "vimperatorrc symlinked"
ln -sf $(pwd)/xinitrc ~/.xinitrc
echo "xinitrc symlinked"
ln -sf $(pwd)/Xresources ~/.Xresources
echo ".Xdefaults symlinked"

if [ "$(ls -A $(pwd)/execb5.github.io/)" ]; then
        echo "Home page already installed!"
else
	git clone http://github.com/execb5/execb5.github.io.git
	echo "Home page cloned and ready to be set in a browser"
fi


vim +PlugInstall +qall
echo "Plugins installed!"

[ -d ~/.vimperator/plugins ] || git clone https://github.com/ervandew/vimperator-plugins.git ~/.vimperator/plugins
[ -d ~/.vimperator/colors ] || git clone https://github.com/vimpr/vimperator-colors.git ~/.vimperator/colors

if [ $( echo $SHELL | tail -c 4 ) = "zsh" ]
then
        echo "Setting oh my zsh..."
        [ -d ~/.oh-my-zsh ] || git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
        [ -d ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ] || git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
        echo "oh my zsh configured!"

        ln -sf $(pwd)/zshrc ~/.zshrc
        echo "zshrc symlinked"
        ln -sf $(pwd)/custom.zsh-theme ~/.oh-my-zsh/themes/custom.zsh-theme
        echo "zsh-theme symlinked"
else
        echo "You're not a winner, try using zsh"
        grep copythis zshrc >> ~/.bashrc
        echo ".bashrc configuration created/appended"
fi


echo "Do you want to use the custom dwmstart?  (y/n)"
read DWM

if [ "$DWM" = "y" ]
then
        ln -sf $(pwd)/dwmstart /usr/share/xsessions/dwmstart
        echo "dwmstart symlinked"
        echo "Don't forget to add dwmstart to execute"
fi

echo "Configure mpd? (y/n)"
read MPD

if [ "$MPD" = "y" ]
then
	[ -d ~/.mpd ] || mkdir ~/.mpd
	ln -sf $(pwd)/mpd.conf ~/.mpd/mpd.conf
	touch ~/.mpd/mpd.db
	touch ~/.mpd/mpd.log
	touch ~/.mpd/mpdstate
	mkdir ~/.mpd/playlists
fi

echo "Configure ncmpcpp? (y/n)"
read NCMPCPP

if [ "$NCMPCPP" = "y" ]
then
	[ -d ~/.ncmpcpp ] || mkdir ~/.ncmpcpp
	ln -sf $(pwd)/ncmpcpp ~/.ncmpcpp/config
fi

echo "Do you want to use the custom Xresources? (y/n)"
read XDEF

mkdir ~/.vimtmp
echo ".vimtmp directory created"

