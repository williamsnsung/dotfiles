export PATH="/usr/local/opt/python/libexec/bin:$PATH"

eval "$(starship init zsh)"
source <(fzf --zsh)
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias vim='nvim'
alias f5='exec $SHELL'
