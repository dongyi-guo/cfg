# Dongyi's ~/.bashrc

# Set Prompt
PS1='[\u \t \W] \$ '
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export XMODIFIERS=’@im=fcitx5’
export XMODIFIER=’@im=fcitx5’
export GTK_IM_MODULE=fcitx5
export QT_IM_MODULE=fcitx5
export DefaultIMModule=fcitx5
export EDITOR="/usr/bin/nvim"
export SUDO_EDITOR="/usr/bin/nvim"
export VISUAL="/usr/bin/nvim"
export PATH="$PATH:$HOME/.config/composer/vendor/bin"

# History
# No Duplicates
HISTCONTROL=ignoreboth
# Append Entries
shopt -s histappend

# Alias
# Set the dot files sync
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# ls settings
alias ls='ls --color=auto'    # Make ls more visual friendly
alias la='ls -a'
alias ll='ls -l'
alias lh='ls -h'
alias lah='ls -lah'
alias lx='ls -lXB'            #  Sort by extension.
alias lk='ls -lSr'            #  Sort by size, biggest last.
alias lt='ls -ltr'            #  Sort by date, most recent last.
alias lc='ls -ltcr'           #  Sort by/show change time,most recent last.
alias lu='ls -ltur'           #  Sort by/show access time,most recent last.
# Do not use vim or vi
alias vim='nvim'
alias vi='nvim'

# Uni
alias ictteach='ssh ictteach'

# Functions
# Quick Unzip
extract () {
  if [ -f "$1" ] ; then
    case "$1" in
        *.tar.bz2)    tar xvjf $1    ;;
         *.tar.gz)    tar xvzf $1    ;;
         *.bz2)       bunzip2 $1     ;;
         *.rar)       unrar x $1     ;;
         *.gz)        gunzip $1      ;;
         *.tar)       tar xvf $1     ;;
         *.tbz2)      tar xvjf $1    ;;
         *.tgz)       tar xvzf $1    ;;
         *.zip)       unzip $1       ;;
         *.Z)         uncompress $1  ;;
         *.7z)        7z x $1        ;;
         *)           echo "don't know how to extract '$1'..." ;;
     esac
 else
     echo "No such file: '$1'"
 fi
}

# Quick Up Directories
up(){
  local d=""
  limit=$1
  for ((i=1 ; i <= limit ; i++))
    do
      d=$d/..
    done
  d=$(echo $d | sed 's/^\///')
  if [ -z "$d" ]; then
    d=..
  fi
  cd $d
}
