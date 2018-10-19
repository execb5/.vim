# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

plugins=(zsh-syntax-highlighting elixir kubectl zsh-autosuggestions)

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

function macfeh() {
	open -b "drabweb.macfeh" "$@"
}

function jiracard() {
	echo "[$@](https://campgladiator.atlassian.net/browse/$@)"
}

pair () {open vnc://$1}

alias rw="networksetup -setairportpower en0 off && networksetup -setairportpower en0 on"

alias lsd='ls -d */' #copythis
alias vi='vim' #copythis
alias weather="curl -4 'http://wttr.in/Porto+Alegre'"
alias moon="curl -4 'http://wttr.in/Moon'"
alias lenny_face='echo "( ͡° ͜ʖ ͡°)"'
alias lenny_wall='echo "┬┴┬┴┤ ͜ʖ ͡°)"'
alias httpserver='ruby -r webrick -e "s = WEBrick::HTTPServer.new(:Port => 8000, :DocumentRoot => Dir.pwd); trap('"'"'INT'"'"') { s.shutdown }; s.start"'
alias tmux="TERM=screen-256color tmux"
alias dri='docker rmi -f `docker images -aq`'
alias drc='docker rm -fv `docker ps -qa`'
alias cat='bat'
alias gay='pair fernando'
alias macho='pair eduardo'
alias lindo='pair marcus'
alias medconf="$EDITOR ~/.mednafen/mednafen-09x.cfg"
alias neofetch="neofetch --ascii_distro windows"

export EDITOR="/usr/local/bin/vim" #copythis

source $ZSH/oh-my-zsh.sh

export PATH="$HOME/.bin:$PATH"
export PATH="$HOME/.vim/aux_scripts:$PATH"

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export PATH=$PATH:/Users/matthias/.cache/rebar3/bin
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

source ~/.bin/tmuxinator.zsh

export ANDROID_HOME=~/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:"/Users/matthias/.local/bin"
export PATH=$PATH:"/usr/local/bin"
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:$HOME/.local/bin

export GOPATH=$HOME/repos/go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

#ssh-add -K ~/.ssh/id_rsa

autoload -U promptinit; promptinit
PURE_PROMPT_SYMBOL=λ
prompt pure

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/matthias/Downloads/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/matthias/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/matthias/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/matthias/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

autoload -Uz compinit
compinit
# Completion for kitty
kitty + complete setup zsh | source /dev/stdin
