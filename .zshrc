export LC_ALL=en_US.UTF-8  
export LANG=en_US.UTF-8

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="imajes"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp 
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

DEFAULT_USER=nicklasnygren
export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin"
source /opt/boxen/env.sh
# export MANPATH="/usr/local/man:$MANPATH"

# # Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# MacPorts
#export PATH=/opt/local/bin:/opt/local/sbin:$PATH

# Postgres
export PATH=/Applications/Postgres93.app/Contents/MacOS/bin:$PATH

export EDITOR='vim'
#alias nw="/Applications/node-webkit.app/Contents/MacOS/node-webkit"
alias gr='grep -Rni --color'
alias vi='vim'
eval "$(rbenv init -)"
eval "$(nodenv init -)"

#Boxen

#export POWERLINE_CONFIG_COMMAND=~/2.7/bin/powerline-config
#export PATH="/Users/nicklasnygren/.powerline/bin:$PATH"
source ~/.bin/tmuxinator.zsh
export POWERLINE_CONFIG_PATH=~/.config/powerline
. ~/.powerline/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh

bindkey '^R' history-incremental-search-backward

bindkey -v

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
setopt extended_glob

export JAVA_HOME=$(/usr/libexec/java_home)
export NVM_DIR=~/.nvm

export KEYTIMEOUT=1
