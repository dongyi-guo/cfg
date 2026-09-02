# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
export PATH=$HOME/development/flutter/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load.
ZSH_THEME="ys" # set by `omz`

# Which plugins would you like to load?
# "extract" replaces the custom extract() function that used to live
# in .bashrc, it covers more archive formats and is upstream-maintained.
plugins=(git z vscode xcode sudo node npm git-commit macos gh git-flow git-lfs github git-prompt gitignore git-auto-fetch git-extras extract)

source $ZSH/oh-my-zsh.sh

# --- Shared config (aliases, nvim exports, up(), extract() fallback) ---
# Sourced after Oh My Zsh so the "extract" plugin's version wins if loaded.
[ -f ~/.shell_common ] && source ~/.shell_common

# --- History (zsh equivalents of bash's HISTCONTROL/HISTSIZE/HISTFILESIZE) ---
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_DUPS       # No consecutive duplicate entries
setopt HIST_IGNORE_ALL_DUPS   # Remove older duplicate when a new one is added
setopt HIST_IGNORE_SPACE      # Ignore lines starting with a space
setopt HIST_FIND_NO_DUPS      # Don't show duplicates when searching history
setopt APPEND_HISTORY         # Append rather than overwrite the history file
setopt INC_APPEND_HISTORY     # Write to history file as commands run, not just on exit
setopt SHARE_HISTORY          # Share history across concurrent sessions

# --- User configuration ---
export PATH="$PATH":"$HOME/.pub-cache/bin"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export PATH="$HOME/.local/bin:$PATH"
