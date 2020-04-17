#
# ~/.bashrc
#

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Set default editor to vim
export EDITOR=vim

# include path
export PATH=/usr/include:"$PATH"
# sbin path
export PATH=/usr/sbin:"$PATH"
# Path for user scripts
export PATH=~/bin:"$PATH"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

# Do not show current working directory in temrinal
# and show background color
export PS1='\[\033[0;32m\]<\[\033[1;33m\]\s-\V \[\033[0;32m\]\d-\t>\[\033[1;35m\]<\u@\h \[\033[1;34m\]\w\[\033[1;35m\]>\$\n\[\033[1;36m\]>\[\033[0m\] '
export PS2='\[\033[0;36m\]> '

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
