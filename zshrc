# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

#ZSH_THEME="robbyrussell"
ZSH_THEME="half-life"
#ZSH_THEME="fox"
#ZSH_THEME="fino"
#ZSH_THEME="mylambdatheme"


plugins=(git zsh-syntax-highlighting)

# set color to use in vim
#if [ -n "$DISPLAY" -a "$TERM" == "xterm" ]; then
#    export TERM=xterm-256color
#fi

export PATH="/home/matthias/.rvm/gems/ruby-2.1.2/bin:/home/matthias/.rvm/gems/ruby-2.1.2@global/bin:/home/matthias/.rvm/rubies/ruby-2.1.2/bin:/home/matthias/bin:/usr/local/texlive/2013/bin/x86_64-linux:/home/matthias/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/matthias/.rvm/bin"

alias lsd='ls -d */'
alias vi='TERM=xterm-256color vi'
alias vim='TERM=xterm-256color vim'
alias javajml='java -jar ~/Programs/openjml.jar -rac -noPurityCheck'
export EDITOR="/usr/bin/vi"
export MANPATH=/usr/local/texlive/2013/texmf/doc/man:$MANPATH
export INFOPATH=/usr/local/texlive/2013/texmf/doc/info:$INFOPATH
source ~/.rvm/scripts/rvm

source $ZSH/oh-my-zsh.sh

#Vi mode
bindkey -v

