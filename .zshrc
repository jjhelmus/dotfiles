eval "$(starship init zsh)"

export EDITOR="vim"
export VISUAL="vim"
export PATH="${HOME}/bin:$PATH"

[ -f .aliases ] && source .aliases
[ -f .zshrc_keys ] && source .zshrc_keys
[ -f .zshrc_local ] && source .zshrc_local
