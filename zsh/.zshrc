# Enable zsh-autosuggestions
source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

alias kalivm='qemu-system-x86_64 -enable-kvm -m 2560 -smp 4 -cpu host -drive file=~/VMs/kali/kali.qcow2,format=qcow2 -net nic -net user,hostfwd=tcp::2222-:22 -nographic'
# Enable zsh-syntax-highlighting
source $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Simple prompt example
PROMPT='%F{green}%n@%m:%~%f %# '

# Starship prompt
eval "$(starship init zsh)"

# Atuin history
eval "$(atuin init zsh)"

# Zoxide
eval "$(zoxide init zsh)"

# Aliases
alias update='sudo pacman -Syu && yay -Syu'
alias cleanup='sudo pacman -Rns $(pacman -Qdtq)'
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
eval "$(starship init zsh)"
source ~/venv/bin/activate

eval "$(atuin init zsh)"
eval "$(atuin init zsh)"
