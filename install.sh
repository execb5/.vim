#!/bin/sh

if [ "$(ls -A $(pwd)/bundle/Vundle.vim/)" ]; then
        echo "Vundle already installed!"
else
        rm -rf $(pwd)/bundle/Vundle.vim/
        git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

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

vim +PluginInstall +PluginClean +qall
echo "Plugins installed!"

[ -d ~/.vimperator/plugins ] || git clone https://github.com/ervandew/vimperator-plugins.git plugins
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

echo "Do you want to use the custom Xdefaults? (y/n)"
read XDEF

if [ "$XDEF" = "y" ]
then
        ln -sf $(pwd)/Xresources ~/.Xresources
        echo ".Xdefaults symlinked"
fi

echo "Compiling vimproc..."
cd ~/.vim/bundle/vimproc.vim
make
echo "vimproc compiled!"

