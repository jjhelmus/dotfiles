# ~/.bashrc: executed by bash(1) for non-login shells.

# shortcut if not running interactively
[ -z "$PS1" ] && return

# Bash history
HISTCONTROL=ignoreboth  # ignore duplicate and lines starting with space
shopt -s histappend     # append to history file, don't overwrite
HISTSIZE=10000
HISTFILESIZE=20000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# color terminal and dircolors
TERM='xterm-256color'
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

# Add ~/bin to the path
export PATH="$HOME/bin:$PATH"

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# Additional alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Prompt
if [ -f ~/.bash_prompt ]; then
    . ~/.bash_prompt
fi

# Extra machine specific settings
if [ -f ~/.bash_extra ]; then
    . ~/.bash_extra
fi
