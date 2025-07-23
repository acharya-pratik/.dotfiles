# ============================
#         ZSH CONFIG
# ============================

# Plugin paths
ZSH_AUTOSUGGESTIONS="$HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh"
ZSH_SYNTAX_HIGHLIGHTING="$HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
ZSH_GIT_PROMPT="$HOME/.zsh-git-prompt/gitprompt.zsh"

# Load plugins if available
[[ -f "$ZSH_AUTOSUGGESTIONS" ]] && source "$ZSH_AUTOSUGGESTIONS"
[[ -f "$ZSH_SYNTAX_HIGHLIGHTING" ]] && source "$ZSH_SYNTAX_HIGHLIGHTING"
[[ -f "$ZSH_GIT_PROMPT" ]] && source "$ZSH_GIT_PROMPT"

# Init tools
command -v atuin &>/dev/null && eval "$(atuin init zsh)"
command -v zoxide &>/dev/null && eval "$(zoxide init zsh)"

# ============================
#     HELPER FUNCTIONS
# ============================

# Show virtual environment name
venv_info() {
  [[ -n "$VIRTUAL_ENV" ]] && echo "%F{green}󰌠 $(basename "$VIRTUAL_ENV")%f "
}

# Show current dir as parent/child
dir_info() {
  local cur="${PWD##*/}"
  local parent="${PWD%/*}"
  parent="${parent##*/}"
  echo "%F{blue} ${parent}/%F{cyan}${cur}%f"
}

# Battery icon + color based on % and state
battery_info() {
  local path="/sys/class/power_supply/BAT0"
  [[ ! -d "$path" ]] && return
  local cap=$(<"$path/capacity") state=$(<"$path/status")
  local icon="" color="%F{green}"
  (( cap < 20 )) && icon="" && color="%F{red}"
  (( cap >= 20 && cap < 50 )) && icon="" && color="%F{yellow}"
  echo "${color}${icon} ${cap}%% (${state})%f"
}

# Show Git branch/status info
git_info() {
  local branch dirty
  if command git rev-parse --is-inside-work-tree &>/dev/null; then
    branch=$(git symbolic-ref --short HEAD 2>/dev/null)
    dirty=$(git status --porcelain 2>/dev/null)
    [[ -n "$dirty" ]] && echo "%F{red} ${branch} *%f" || echo "%F{green} ${branch}%f"
  fi
}

# ============================
#         PROMPT
# ============================

setopt PROMPT_SUBST
PROMPT='$(venv_info)$(dir_info) $(git_info)
%F{magenta}❯ %f'
RPROMPT='$(battery_info)  %F{cyan}%*%f'

# ============================
#         ALIASES
# ============================

alias update='sudo pacman -Syu && yay -Syu'
alias cleanup='sudo pacman -Rns $(pacman -Qdtq)'
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ..='cd ..'
alias ...='cd ../..'

# ============================
#     SHELL OPTIONS
# ============================

autoload -Uz compinit && compinit
setopt HIST_IGNORE_ALL_DUPS SHARE_HISTORY INC_APPEND_HISTORY EXTENDED_HISTORY
setopt AUTO_CD CORRECT NO_BEEP
zstyle ':completion:*' menu select
zstyle ':completion:*' select-prompt '%SScrolling: current is %p%s'

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
bindkey '^R' history-incremental-search-backward

# ============================
#     ENV + OTHER TOOLS
# ============================

export EDITOR='nvim'
export VISUAL='nvim'
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# FZF
[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh

