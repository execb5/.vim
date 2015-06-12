# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

#ZSH_THEME="robbyrussell"
ZSH_THEME="half-life"
#ZSH_THEME="fox"
#ZSH_THEME="fino"
#ZSH_THEME="mylambdatheme"


plugins=(git zsh-syntax-highlighting archlinux)

# set color to use in vim
#if [ -n "$DISPLAY" -a "$TERM" == "xterm" ]; then
#    export TERM=xterm-256color
#fi

#export PATH="/home/matthias/.rvm/gems/ruby-2.1.2/bin:/home/matthias/.rvm/gems/ruby-2.1.2@global/bin:/home/matthias/.rvm/rubies/ruby-2.1.2/bin:/home/matthias/bin:/usr/local/texlive/2013/bin/x86_64-linux:/home/matthias/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/matthias/.rvm/bin"

alias ppsspp='primusrun ppsspp'
alias lsd='ls -d */' #copythis
alias vi='vim' #copythis
if [ "$TERM" = "xterm" ] #copythis
then #copythis
        alias vim='TERM=xterm-256color vim' #copythis
else #when i'm in dwm using urxvt #copythis
        alias vim='TERM=rxvt-unicode-256color vim' #copythis
fi #copythis
export EDITOR="/usr/bin/vi" #copythis
export MANPATH=/usr/local/texlive/2013/texmf/doc/man:$MANPATH
export INFOPATH=/usr/local/texlive/2013/texmf/doc/info:$INFOPATH
#source ~/.rvm/scripts/rvm

export PATH="/usr/local/texlive/2014/bin/x86_64-linux:$PATH"
export INFOPATH=/usr/local/texlive/2014/texmf-dist/doc/info:$INFOPATH
export MANPATH=/usr/local/texlive/2014/texmf-dist/doc/man:$MANPATH

source $ZSH/oh-my-zsh.sh

#PATH=$HOME/.cabal/bin:$PATH

#Vi mode
#bindkey -v

#export PATH="/home/matthias/.cabal/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/matthias/.gem/ruby/2.2.0/bin"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
