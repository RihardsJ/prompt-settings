#!/bin/zsh

# XDG
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$XDG_CONFIG_HOME/local/share"
export XDG_CACHE_HOME="$XDG_CONFIG_HOME/cache"

# editor
export EDITOR="nvim"
export VISUAL="nvim"

# zsh  
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export HISTFILE="$ZDOTDIR/.zhistory"
export HISTSIZE=10000
export SAVEHIST=10000

# other software
export TMUXP_CONFIGDIR="$XDG_CONFIG_HOME/tmuxp"
export COMPOSER_HOME="$XDG_CONFIG_HOME/composer"
export I3_CONFIG="$XDG_CONFIG_HOME/i3"
export VIMCONFIG="$XDG_CONFIG_HOME/nvim"

# NPM   
export NVM_DIR="$XDG_DATA_HOME/nvm"
export NPM_PATH="$XDG_CONFIG_HOME/node_modules"
export NPM_BIN="$XDG_CONFIG_HOME/node_modules/bin"
export NPM_CONFIG_PREFIX="$XDG_CONFIG_HOME/node_modules"
