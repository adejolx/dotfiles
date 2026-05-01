# Add to ~/.zshrc

# -------------------------
# CORE SHELL BEHAVIOR
# -------------------------

export ZSH="$HOME/.zsh"
export EDITOR="nvim"
export VISUAL="$EDITOR"

# CDPATH lets you cd into subdirectories of listed paths from anywhere, e.g. `cd myproject` works without full path
export CDPATH=".:$HOME/Projects"


# Better history behavior
HISTSIZE=100000
SAVEHIST=100000
HISTFILE=$HOME/.zsh_history

setopt append_history
setopt share_history
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt inc_append_history

# safer globbing
setopt extended_glob

# no beep
setopt no_beep


# -------------------------
# VI MODE
# -------------------------

bindkey -v
bindkey -M viins 'jk' vi-cmd-mode

# -------------------------
# COMPLETION (modern defaults)
# -------------------------

autoload -Uz compinit
compinit

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu select

setopt auto_menu
setopt complete_in_word


# -------------------------
# KEY BINDINGS (quality of life)
# -------------------------

# Ctrl+R fuzzy history search (basic)
bindkey '^R' history-incremental-search-backward


# -------------------------
# PROMPT (simple + fast)
# -------------------------

autoload -Uz colors && colors


# -------------------------
# OPTIONAL PERFORMANCE HELPERS
# -------------------------

# faster cd
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups


# -------------------------
# ALIASES (minimal but useful)
# -------------------------

alias vi="nvim"
alias ll='ls -lah'
alias gs='git status'
alias gd='git diff'
alias ..='cd ..'
alias ...='cd ../..'
alias clip="xclip -selection clipboard -i"
alias paste="xclip -selection clipboard -o"

# fnm
FNM_PATH="$HOME/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "$(fnm env --shell zsh)"
fi

# path for user-installed binaries (e.g., cargo, npm global packages)
export PATH="$HOME/.local/bin:$HOME/.cargo/bin:$PATH"

# starship prompt
eval "$(starship init zsh)"
