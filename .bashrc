#
# Dongyi's ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# History
## No duplicates
HISTCONTROL=ignoreboth
## Append History
shopt -s histappend

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias ls='ls --color=auto'
alias vim='nvim'
alias vi='vim'
PS1='[\u@\h \W]\$ '
