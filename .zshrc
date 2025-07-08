eval "$(starship init zsh)"

setopt appendhistory
setopt share_history
setopt hist_ignore_dups
setopt hist_ignore_space
setopt interactive_comments
export HISTSIZE=100000
export HISTSIZE=10000000
export SAVEHIST=10000000
export HISTFILESIZE=200000

export EDITOR="vim"
export VISUAL="vim"
export PATH="${HOME}/bin:$PATH"

[ -f ${HOME}/.aliases ] && source ${HOME}/.aliases
[ -f ${HOME}/.zshrc_keys ] && source ${HOME}/.zshrc_keys
[ -f ${HOME}/.zshrc_local ] && source ${HOME}/.zshrc_local
