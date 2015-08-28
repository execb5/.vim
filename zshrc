# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

#ZSH_THEME="robbyrussell"
#ZSH_THEME="half-life"
#ZSH_THEME="fox"
#ZSH_THEME="fino"
#ZSH_THEME="smt"
ZSH_THEME="custom"
#ZSH_THEME="mylambdatheme"

plugins=(git zsh-syntax-highlighting archlinux)

explain () { #copythis
	if [ "$#" -eq 0 ]; then #copythis
		while read  -p "Command: " cmd; do #copythis
			curl -Gs "https://www.mankier.com/api/explain/?cols="$(tput cols) --data-urlencode "q=$cmd" #copythis
		done #copythis
		echo "Bye!" #copythis
	elif [ "$#" -eq 1 ]; then #copythis
		curl -Gs "https://www.mankier.com/api/explain/?cols="$(tput cols) --data-urlencode "q=$1" #copythis
	else #copythis
		echo "Usage" #copythis
		echo "explain                  interactive mode." #copythis
		echo "explain 'cmd -o | ...'   one quoted command to explain it." #copythis
	fi #copythis
} #copythis

alias oct='octave --no-gui' #copythis
alias ppsspp='primusrun ppsspp' #copythis
alias roc='CACA_DRIVER=ncurses mplayer -vo caca -msglevel all=0' #copythis
alias lsd='ls -d */' #copythis
alias vi='vim' #copythis
alias xmerge='xrdb -merge ~/.Xresources' #copythis
alias xresup='xrdb ~/.Xresources' #copythis
alias texmk='latexmk -pvc -pdf -f -silent' #copythis

if [ "$TERM" = "xterm" ] #copythis
then #copythis
	alias vim='TERM=xterm-256color vim' #copythis
	alias vimdiff='TERM=xterm-256color vimdiff' #copythis
else #when i'm in dwm using urxvt #copythis
	alias vim='TERM=rxvt-unicode-256color vim' #copythis
	alias vimdiff='TERM=rxvt-unicode-256color vimdiff' #copythis
fi #copythis

if which ruby >/dev/null && which gem >/dev/null; then
	PATH="$(ruby -rubygems -e 'puts Gem.user_dir')/bin:$PATH"
fi

export EDITOR="/usr/bin/vim" #copythis
#export MANPATH=/usr/local/texlive/2013/texmf/doc/man:$MANPATH
#export INFOPATH=/usr/local/texlive/2013/texmf/doc/info:$INFOPATH
#source ~/.rvm/scripts/rvm

#export PATH="/usr/local/texlive/2014/bin/x86_64-linux:$PATH"
#export PATH=$HOME/cmus/bin:$PATH
#export INFOPATH=/usr/local/texlive/2014/texmf-dist/doc/info:$INFOPATH
#export MANPATH=/usr/local/texlive/2014/texmf-dist/doc/man:$MANPATH
#
source $ZSH/oh-my-zsh.sh

#PATH=$HOME/.cabal/bin:$PATH

#export PATH="$HOME/.rbenv/bin:$PATH"
#export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
