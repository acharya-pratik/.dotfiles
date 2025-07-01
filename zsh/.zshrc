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

# Init optional tools
command -v atuin &>/dev/null && eval "$(atuin init zsh)"
command -v zoxide &>/dev/null && eval "$(zoxide init zsh)"

# ============================
#     HELPER FUNCTIONS
# ============================

venv_info() {
  [[ -n "$VIRTUAL_ENV" ]] && echo "%F{green}($(basename "$VIRTUAL_ENV"))%f "
}

dir_info() {
  local cur="${PWD##*/}"
  local parent="${PWD%/*}"
  parent="${parent##*/}"
  echo "%F{blue}${parent}→${cur}%f"
}

battery_info() {
  local path="/sys/class/power_supply/BAT0"
  [[ ! -d "$path" ]] && return
  local cap=$(<"$path/capacity") state=$(<"$path/status")
  local color="%F{green}"
  (( cap < 30 )) && color="%F{red}"
  (( cap >= 30 && cap < 70 )) && color="%F{yellow}"
  echo "${color}⚡${cap}% (${state})%f"
}

git_info() {
  type build_prompt &>/dev/null && build_prompt
}

# ============================
#         PROMPT
# ============================

setopt PROMPT_SUBST
PROMPT='$(venv_info)$(dir_info) $(git_info)
%F{yellow}➜ %f '
RPROMPT='$(battery_info)%F{cyan}%*%f'

# ============================
#         ALIASES
# ============================

alias update='sudo pacman -Syu && yay -Syu'
alias cleanup='sudo pacman -Rns $(pacman -Qdtq)'
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

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

# Coreutils color support
if command -v dircolors &>/dev/null; then
  eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  alias grep='grep --color=auto'
fi

# Editor
export EDITOR='nvim'
export VISUAL='nvim'
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# FZF (optional)
[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh

