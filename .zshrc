# If you want the super nice Nord colorscheme for gnome terminal:
# https://github.com/arcticicestudio/nord-gnome-terminal
#
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# USE:
# Most use should be intuitive and just work
# ddg <text> - search the web for text
# j dirname

# typeset -i updated_at=$(date +'%j' -r ~/.zcompdump 2>/dev/null || stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)
#
autoload -Uz compinit
compinit
_comp_options+=(globdots)

# if [ $(date +'%j') != $updated_at ]; then
#   compinit -i
# else
#   compinit -C -i
# fi

# zmodload -i zsh/complist

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$HOME/.local/bin:$HOME/.oh-my-zsh:/opt/homebrew/bin:$PATH
export ZSH=$HOME/.oh-my-zsh
export TERM="xterm-256color"
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN
export FZF_DEFAULT_OPTS='--height=40% --preview="cat {}" --preview-window=right:60%:wrap'

#setopt auto_list     # automatically list choices on ambiguous completion
#setopt auto_menu     # automatically use menu completion
#setopt always_to_end # move cursor to end if word had one match
#zstyle ':completion:*' menu select                                          # select completions with arrow keys
#zstyle ':completion:*' group-name ''                                        # group results by category
#zstyle ':completion:::::' completer _expand _complete _ignored _approximate # enable approximate matches for completion

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export VISUAL="vim -v"
export EDITOR="$VISUAL"
export ZVM_VI_EDITOR="vim -v"
ZVM_CURSOR_STYLE_ENABLED=false

# fpath=(/usr/local/share/zsh-completions $fpath)

# For a full list of active aliases, run `alias`.
alias v="vim"
alias n="vim -v -c 'NV!'"
alias l="ls -G"
# alias p='python3'
alias zv="vim -v ~/.zshrc"
alias vv="vim -v ~/.vimrc"
alias so="source ~/.oh-my-zsh/oh-my-zsh.sh"
alias sz="source ~/.zshrc"
alias sv="source ~/.vimrc"
alias c="clear"
alias de="tmux detach"
alias a="tmux attach"
alias pip='pip3'

mdless () {
  pandoc $1 | lynx -stdin
}

pess () {
  pandoc $1 -o pdf | open -stdin
}

ZSH_THEME="powerlevel10k/powerlevel10k"

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#00FF00"
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

plugins=(
	# vundle
	# truffle
	# zsh-syntax-highlighting
	# javascript
	# common-aliases
	# history
	brew
	# npm
	# dotenv
	# git
	# sudo
	# battery 
	zsh-autosuggestions
	# droplr
	# fzf-tab
	fzf
 	git
	# tmux
	vi-mode
	autojump
 	web-search
	# zsh-navigation-tools 
        dircycle 
 	dirhistory 
 	wd 
	macos
        zsh-history-substring-search	
 )

source $ZSH/oh-my-zsh.sh

# must go below source oh-my...
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Append a command directly
#zvm_after_init_commands+=('[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh')
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh

export PATH="/usr/local/sbin:$PATH"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/bernino/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/bernino/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/Users/bernino/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/bernino/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
