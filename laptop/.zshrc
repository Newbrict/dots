# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/plant/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

#zsh prompts
PROMPT="%{%F{white}%}[%{%F{orange}%}%n%{%F{white}%}: %{%F{blue}%}%1~%{%F{white}%}]$%F{orange} "
RPROMPT='%(?,%F{blue}:%),%F{yellow}%? %F{red}:()%f'
PATH="$PATH:/home/plant/.gem/ruby/2.1.0/bin:/home/plant/.npm"
export CHROME_BIN="/usr/bin/chromium"

source ~/.privaterc
alias notes='vim $(date -I).txt'
alias todo='vim ~/.todo.txt'
alias defrag='/home/plant/ioquake3/iodfengine.x86_64'
alias brb='sleep .5 && xset dpms force off && time slock'
alias ls='ls --color=auto'
alias grep="grep --color=auto"
alias btc='/home/plant/code/git/bitcoin-prices/btcp_disp.sh'
alias caps="xmodmap ~/.Xmodmap"
alias booty="systemd-analyze"
alias rekt="/home/plant/code/git/Security-Toolkit/rekt.sh"
alias view_xbm="python /home/plant/code/git/xbm-view/view_xbm.py"

class() {
  if [[ "$1" == "cfin" ]]; then
    cd /home/plant/Documents/RPI/3/fall/computational_finance
  elif [[ "$1" == "plan" ]]; then
    cd /home/plant/Documents/RPI/3/fall/programming_languages
  elif [[ "$1" == "opsys" ]]; then
    cd /home/plant/Documents/RPI/3/fall/operating_systems
  elif [[ "$1" == "acg" ]]; then
    cd /home/plant/Documents/RPI/4/spring/advanced_computer_graphics
  elif [[ "$1" == "ml" ]]; then
    cd /home/plant/Documents/RPI/4/fall/machine_learning
  elif [[ "$1" == "cv" ]]; then
    cd /home/plant/Documents/RPI/5/spring/computer_vision
  elif [[ "$1" == "mbe" ]]; then
    cd /home/plant/Documents/RPI/5/spring/modern_binary_exploitation
  fi
}

PRINT() {
	if [[ "$#" != "2" ]]; then
		echo "No args"
		return
	fi

	FILE=$1
	PRINTER=$2
	pdf2ps $FILE /tmp/toprint.ps
	echo "Transfering File To RPI Server..."
	scp /tmp/toprint.ps dimitd@rcs-linux.rpi.edu:~/
	echo "Printing File..."
	ssh dimitd@rcs-linux.rpi.edu "lpr -P$PRINTER  toprint.ps"
	#Union = ru3120xcl
}

# Go Code
export GOPATH=~/code/go
PATH=$PATH:$GOPATH/bin

# NodeJS Code
export NODE_PATH="'$(npm root)'"

# ENV
export BROWSER="chromium"
export EDITOR="vim"

# Ruby
PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"
