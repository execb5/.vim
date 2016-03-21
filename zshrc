# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

#ZSH_THEME="custom"
ZSH_THEME="rkj-repos"

#ZSH_TMUX_AUTOSTART=true
#ZSH_TMUX_AUTOCONNECT=false
plugins=(git zsh-syntax-highlighting archlinux rails bundle rake tmux)

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

function extract() #copythis
{ #copythis
	if [ -f $1 ] ; then #copythis
		case $1 in #copythis
			*.tar.bz2)   tar xvjf $1     ;; #copythis
			*.tar.gz)    tar xvzf $1     ;; #copythis
			*.bz2)       bunzip2 $1      ;; #copythis
			*.rar)       unrar x $1      ;; #copythis
			*.gz)        gunzip $1       ;; #copythis
			*.tar)       tar xvf $1      ;; #copythis
			*.tbz2)      tar xvjf $1     ;; #copythis
			*.tgz)       tar xvzf $1     ;; #copythis
			*.zip)       unzip $1        ;; #copythis
			*.Z)         uncompress $1   ;; #copythis
			*.7z)        7z x $1         ;; #copythis
			*)           echo "'$1' cannot be extracted via >extract<" ;; #copythis
		esac #copythis
	else #copythis
		echo "'$1' is not a valid file!" #copythis
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
alias astah='java -jar ~/programs/astah_professional/astah-pro.jar'
alias fuck='eval $(thefuck --alias)'
alias torrentstart='transmission-daemon'
alias torrent='transmission-remote-cli'
alias torrentexit='transmission-remote --exit'
alias cava="/home/matthias/.local/bin/cava -i fifo -p /tmp/mpd.fifo"

#if [ "$TERM" = "xterm" ] #copythis
#then #copythis
	#alias vim='TERM=xterm-256color vim' #copythis
	#alias vimdiff='TERM=xterm-256color vimdiff' #copythis
#else #when i'm in dwm using urxvt #copythis
	#alias vim='TERM=rxvt-unicode-256color vim' #copythis
	#alias vimdiff='TERM=rxvt-unicode-256color vimdiff' #copythis
#fi #copythis

if which ruby > /dev/null && which gem >/dev/null; then
	PATH="$(ruby -rubygems -e 'puts Gem.user_dir')/bin:$PATH"
fi

export EDITOR="/usr/bin/vim" #copythis
export PATH="/usr/local/texlive/2015/bin/x86_64-linux:$PATH"
export INFOPATH=/usr/local/texlive/2015/texmf-dist/doc/info:$INFOPATH
export MANPATH=/usr/local/texlive/2015/texmf-dist/doc/man:$MANPATH

export ANDROID_HOME=/home/matthias/programs/android/sdk
export PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

export _JAVA_AWT_WM_NONREPARENTING=1

export XDG_CONFIG_HOME="$HOME/.config"
export PATH=$PATH:/home/matthias/.config/bspwm/scripts

export SDL_VIDEO_FULLSCREEN_DISPLAY=1
export SDL_VIDEO_FULLSCREEN_HEAD=1

source $ZSH/oh-my-zsh.sh

#PATH=$HOME/.cabal/bin:$PATH

# RVM STUFF
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
[[ -r "$HOME/.rvm/scripts/completion" ]] && source "$HOME/.rvm/scripts/completion"
