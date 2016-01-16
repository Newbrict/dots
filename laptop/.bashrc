# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias notes='vim $(date -I).txt'
alias todo='vim ~/.todo.txt'
alias defrag='/home/plant/ioquake3/iodfengine.x86_64'
alias brb='sleep .5 && xset dpms force off && time slock'
alias ls='ls --color=auto'
alias btc='/home/plant/Documents/github/bitcoin-prices/btcp_disp.sh'
alias caps="xmodmap ~/.Xmodmap"

# smile PS1
PS1="[\u@\h \W] \$(if [[ \$? == 0 ]]; then echo \"\[\033[0;34m\]:)\"; else echo \"\[\033[0;31m\]:(\"; fi)\[\033[00m\] "

function class(){
  if [ "$1" == "cfin" ]; then
    cd /home/plant/Documents/RPI/3/fall/computational_finance
  elif [ "$1" == "plan" ]; then
    cd /home/plant/Documents/RPI/3/fall/programming_languages
  elif [ "$1" == "opsys" ]; then
    cd /home/plant/Documents/RPI/3/fall/operating_systems
  elif [ "$1" == "acg" ]; then
    cd /home/plant/Documents/RPI/4/spring/advanced_computer_graphics
  fi
}
