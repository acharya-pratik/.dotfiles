# # ~/.bashrc
# source ~/venv/bin/activate
#
# # Only run in interactive shell
# [[ $- != *i* ]] && return
#
#
#
#  alias kalivm='qemu-system-x86_64   -enable-kvm   -m 2560   -smp 5  -cpu host   -drive file=~/VMs/kali/kali.qcow2,format=qcow2   -netdev user,id=net0,hostfwd=tcp::2222-:22   -device virtio-net-pci,netdev=net0   -vga std'
#
#
#
# # Load bash-autocomplete for autosuggestions
# if [ -f ~/.bash-autocomplete/bash-autocomplete.sh ]; then
#   source ~/.bash-autocomplete/bash-autocomplete.sh
# fi
#
# # Load bash-preexec for preexec and precmd hooks (needed by bash-autocomplete)
# if [ -f ~/.bash-preexec/bash-preexec.sh ]; then
#   source ~/.bash-preexec/bash-preexec.sh
# fi
#
# # Enable bash completion if installed
# if [ -f /usr/share/bash-completion/bash_completion ]; then
#   source /usr/share/bash-completion/bash_completion
# fi
#
# # FZF fuzzy finder key bindings and completion
# if [ -f /usr/share/fzf/key-bindings.bash ]; then
#   source /usr/share/fzf/key-bindings.bash
# fi
# if [ -f /usr/share/fzf/completion.bash ]; then
#   source /usr/share/fzf/completion.bash
# fi
#
# # Use bat as cat replacement for syntax highlighting if available
# if command -v bat &>/dev/null; then
#   alias cat='bat --style=plain --pager=never'
# fi
#
# # Function to get current git branch for prompt
# parse_git_branch() {
#   git branch 2>/dev/null | grep '^\*' | sed 's/^\* //'
# }
#
# # Set a nice colorful PS1 prompt with username, cwd, git branch
# export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\[\033[01;31m\]$(parse_git_branch)\[\033[00m\]\$ '
#
# # LS colors
# eval "$(dircolors -b)"
#
# # Optional: enable history search with arrow keys (up/down)
# bind '"\e[A": history-search-backward'
# bind '"\e[B": history-search-forward'
#
#
#
# # # Optional: auto-activate global python venv (remove if undesired)
# # if [ -f ~/venv/bin/activate ]; then
#     source ~/venv/bin/activate
# # fi

