# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="custom"
#ZSH_THEME="rkj-repos"

#ZSH_TMUX_AUTOSTART=true
#ZSH_TMUX_AUTOCONNECT=false
plugins=(git zsh-syntax-highlighting archlinux bundle tmux zsh-wakatime nyan rails elixir)

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


pair () {
    COMPUTER_IP=$(dscacheutil -q host -a name $1.local | grep -Eo '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}') 
        open vnc://$COMPUTER_IP
}

alias rw="networksetup -setairportpower en0 off && networksetup -setairportpower en0 on"


alias lsd='ls -d */' #copythis
alias vi='vim' #copythis
alias weather="curl -4 'http://wttr.in/Porto+Alegre'"
alias moon="curl -4 'http://wttr.in/Moon'"

export EDITOR="/usr/bin/vim" #copythis

source $ZSH/oh-my-zsh.sh

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"

. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

source ~/.bin/tmuxinator.zsh
