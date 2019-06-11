# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

plugins=(zsh-syntax-highlighting zsh-autosuggestions)

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

function wow() { #copythis
	echo "                Y.                      _             " #copythis
	echo "                YiL                   .\`\`\`.           " #copythis
	echo "  much files    Yii;                .; .;;\`.          " #copythis
	echo "                YY;ii._           .;\`.;;;; :          " #copythis
	echo " such shell     iiYYYYYYiiiii;;;;i\` ;;::;;;;          " #copythis
	echo "            _.;YYYYYYiiiiiiYYYii  .;;.   ;;;          " #copythis
	echo "wow      .YYYYYYYYYYiiYYYYYYYYYYYYii;\`  ;;;;          " #copythis
	echo "       .YYYYYYY\$\$YYiiYY\$\$\$\$iiiYYYYYY;.ii;\`..          " #copythis
	echo "      :YYY\$!.  TYiiYY\$\$\$\$\$YYYYYYYiiYYYYiYYii.         " #copythis
	echo "      Y\$MM\$:   :YYYYYY\$! \`\` 4YYYYYiiiYYYYiiYY.        " #copythis
	echo "   \`. :MM\$\$b.,dYY\$\$Yii  :\'   :YYYYllYiiYYYiYY         " #copythis
	echo "_.._ :\`4MM\$!YYYYYYYYYii,.__.diii\$\$YYYYYYYYYYY         " #copythis
	echo ".,._ \$b\`P\`      4\$\$\$\$\$iiiiiiii\$\$\$\$YY\$\$\$\$\$\$YiY;        " #copythis
	echo "   \`,.\`\$:       :\$\$\$\$\$\$\$\$\$YYYYY\$\$\$\$\$\$\$\$\$YYiiYYL       " #copythis
	echo "     \`;\$\$.    .;PPb\$\`.,.\`\`T\$\$YY\$\$\$\$YYYYYYiiiYYU:      " #copythis
	echo "    ;\$P\$;;: ;;;;i\$y\$ !Y\$\$\$b;\$\$\$Y\$YY\$\$YYYiiiYYiYY      " #copythis
	echo "    \$Fi\$\$ .. \`\`:iii.\`- :YYYYY\$\$YY\$\$\$\$\$YYYiiYiYYY      " #copythis
	echo "    :Y\$\$rb \`\`\`\`  \`_..;;i;YYY\$YY\$\$\$\$\$\$\$YYYYYYYiYY:     " #copythis
	echo "     :\$\$\$\$\$i;;iiiiidYYYYYYYYYY\$\$\$\$\$\$YYYYYYYiiYYYY.    " #copythis
	echo "      \`\$\$\$\$\$\$\$YYYYYYYYYYYYY\$\$\$\$\$\$YYYYYYYYiiiYYYYYY    " #copythis
	echo "      .i!\$\$\$\$\$\$YYYYYYYYY\$\$\$\$\$\$YYY\$\$YYiiiiiiYYYYYYY    " #copythis
	echo "     :YYiii\$\$\$\$\$\$\$YYYYYYY\$\$\$\$YY\$\$\$\$YYiiiiiYYYYYYi\'    " #copythis
} #copythis

function kubectl_unset() {
	kubectl config unset clusters.$@
	kubectl config unset users.$@
	kubectl config unset contexts.staging-realm.k8s.local
}

function jiracard() {
	echo "[$@](https://campgladiator.atlassian.net/browse/$@)"
}

pair () {open vnc://$1}

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
alias medconf="$EDITOR ~/.mednafen/mednafen-09x.cfg"

export EDITOR="/usr/bin/vim" #copythis

source $ZSH/oh-my-zsh.sh

export PATH="$HOME/.bin:$PATH"
export PATH="$HOME/.vim/aux_scripts:$PATH"

. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash
. $HOME/.asdf/plugins/java/asdf-java-wrapper.zsh

export PATH="$(yarn global bin):$PATH"

fpath=( "$HOME/.zfunctions" $fpath )

autoload -U promptinit; promptinit
PURE_PROMPT_SYMBOL=λ
prompt pure



