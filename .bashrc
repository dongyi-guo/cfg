#
# Dongyi's ~/.bashrc
#

# Set prompt
PS1='[\$]\u \t \W > '
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# History
# No duplicate history entries
HISTCONTROL=ignoreboth
# Append History
shopt -s histappend

# Alias
# Set the dot files sync
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias ls='ls --color=auto -h' # Make ls more visual friendly
# ls settings
alias lx='ls -lXB'            #  Sort by extension.
alias lk='ls -lSr'            #  Sort by size, biggest last.
alias lt='ls -ltr'            #  Sort by date, most recent last.
alias lc='ls -ltcr'           #  Sort by/show change time,most recent last.
alias lu='ls -ltur'           #  Sort by/show access time,most recent last.
# Do not use vim or vi
alias vim='nvim'
alias vi='nvim'
