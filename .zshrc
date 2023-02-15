eval "$(starship init zsh)"

export EDITOR="vim"
export VISUAL="vim"
export PATH="${HOME}/bin:$PATH"

[ -f ${HOME}/.aliases ] && source ${HOME}/.aliases
[ -f ${HOME}/.zshrc_keys ] && source ${HOME}/.zshrc_keys
[ -f ${HOME}/.zshrc_local ] && source ${HOME}/.zshrc_local
