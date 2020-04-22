# USE:
# Most use should be intuitive and just work
#
# ddg <text> - search the web for text
# wd add <alias> - wd <alias> jumps straight to this directory
# cd **<tab> does magic

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

autoload -Uz history-search-end

zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

bindkey -M vicmd '^[[A' history-beginning-search-backward-end \
		 '^[OA' history-beginning-search-backward-end \
		 '^[[B' history-beginning-search-forward-end \
		 '^[OB' history-beginning-search-forward-end
bindkey -M viins '^[[A' history-beginning-search-backward-end \
		 '^[OA' history-beginning-search-backward-end \
		 '^[[B' history-beginning-search-forward-end \
		 '^[OB' history-beginning-search-forward-end


# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$HOME/.oh-my-zsh:$PATH
export ZSH=$HOME/.oh-my-zsh
export TERM="xterm-256color"

fpath=(/usr/local/share/zsh-completions $fpath)

# For a full list of active aliases, run `alias`.
alias l="ls -G"
alias p='python3'
alias z="vim ~/.zshrc"
alias v="vim ~/.vimrc"
alias so="source ~/.oh-my-zsh/oh-my-zsh.sh"
alias sz="source ~/.zshrc"
alias sv="source ~/.vimrc"
alias c="clear"

mdless () {
  pandoc $1 | lynx -stdin
}

pess () {
  pandoc $1 -o pdf | open -stdin
}

ZSH_THEME="agnoster"
#POWERLEVEL9K_MODE='awesome-fontconfig'
#POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_BATTERY_CHARGING='yellow'
POWERLEVEL9K_BATTERY_CHARGED='green'
POWERLEVEL9K_BATTERY_DISCONNECTED='$DEFAULT_COLOR'
POWERLEVEL9K_BATTERY_LOW_THRESHOLD='10'
POWERLEVEL9K_BATTERY_LOW_COLOR='red'
#POWERLEVEL9K_BATTERY_ICON='\uf1e6 '
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=''
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX=''
POWERLEVEL9K_VI_INSERT_MODE_STRING='I'
POWERLEVEL9K_VI_COMMAND_MODE_STRING='CMD'

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(battery context dir vcs vi_mode)
#POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon status battery context dir vcs vi_mode)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(time ram virtualenv)

#POWERLEVEL9K_CUSTOM_TIME_FORMAT="%D{\uf017 %H:%M:%S}"
#POWERLEVEL9K_TIME_FORMAT="%D{\uf017 %H:%M \uf073 %d.%m.%y}"
#POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_PROMPT_ON_NEWLINE=false

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to change how often to auto-update (in days).
#export UPDATE_ZSH_DAYS=3

# Uncomment the following line to enable command auto-correction.
#ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#00FF00"
#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#00FF00,bg=cyan,bold,underline"
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

#source /usr/local/etc/profile.d/autojump.sh
# Load Zsh tools for syntax highlighting and autosuggestions
#source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Oh my Zsh with plugins https://github.com/robbyrussell/oh-my-zsh/wiki/Plugins#autojump
# Add wisely, as too many plugins slow down shell startup.

# tmux
# vundle
# droplr
# truffle
# web-search
# zsh-syntax-highlighting
# javascript
# common-aliases
# history
# brew
# npm
# dotenv
# git
# sudo
# battery 

plugins=(
 vi-mode 
 web-search
 zsh-autosuggestions 
 fzf 
 zsh-navigation-tools 
 dircycle 
 dirhistory 
 wd 
 osx 
 )

autoload -U compinit && compinit

source $ZSH/oh-my-zsh.sh

# keybindings to move by word
bindkey "^[f" forward-word  # forward word esc f
bindkey '^[b' backward-word # backward word esc b

# ctrl e opens file in vim
bindkey -s '^e' 'vim $(fzf)\n'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
