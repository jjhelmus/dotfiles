
# aliases
alias st='set_title.py'
alias ack=ack-grep

# ARM utilities
alias mount_dmf='sshfs copper:/ /home/jhelmus/dmf'
alias mount_bds1='sshfs bds1:/ /home/jhelmus/bds1'
alias umount_dmf='fusermount -u /home/jhelmus/dmf'
alias umount_dbs1='fusermount -u /home/jhelmus/bds1'

#alias apu='python -m arm_archive'

# directory bookmarks
alias b1='bookmark ~/1 ; echo "bookmark 1 set"'
alias b2='bookmark ~/2 ; echo "bookmark 2 set"'
alias b3='bookmark ~/3 ; echo "bookmark 3 set"'
alias b4='bookmark ~/4 ; echo "bookmark 4 set"'
alias b5='bookmark ~/5 ; echo "bookmark 5 set"'
alias b6='bookmark ~/6 ; echo "bookmark 6 set"'
alias b7='bookmark ~/7 ; echo "bookmark 7 set"'
alias b8='bookmark ~/8 ; echo "bookmark 8 set"'
alias b9='bookmark ~/9 ; echo "bookmark 9 set"'

alias g1='echo "following bookmark 1"; cd ~/1; cd `pwd -P`'
alias g2='echo "following bookmark 2"; cd ~/2; cd `pwd -P`'
alias g3='echo "following bookmark 3"; cd ~/3; cd `pwd -P`'
alias g4='echo "following bookmark 4"; cd ~/4; cd `pwd -P`'
alias g5='echo "following bookmark 5"; cd ~/5; cd `pwd -P`'
alias g6='echo "following bookmark 6"; cd ~/6; cd `pwd -P`'
alias g7='echo "following bookmark 7"; cd ~/7; cd `pwd -P`'
alias g8='echo "following bookmark 8"; cd ~/8; cd `pwd -P`'
alias g9='echo "following bookmark 9"; cd ~/9; cd `pwd -P`'

PROMPT_DIRTRIM=2

# git status bash prompt modified from 
# http://www.opinionatedprogrammer.com/2011/01/colorful-bash-prompt-reflecting-git-status/
function _git_prompt() {
    local git_status="`git status -unormal 2>&1`"
    if ! [[ "$git_status" =~ Not\ a\ git\ repo ]]; then
        if [[ "$git_status" =~ nothing\ to\ commit ]]; then
            local ansi=42
        elif [[ "$git_status" =~ nothing\ added\ to\ commit\ but\ untracked\ files\ present ]]; then
            local ansi=43
        else
            local ansi=45
        fi
        if [[ "$git_status" =~ On\ branch\ ([^[:space:]]+) ]]; then
            branch=${BASH_REMATCH[1]}
            test "$branch" != master || branch=' '
        else
            # Detached HEAD.  (branch=HEAD is a faster alternative.)
            branch="(`git describe --all --contains --abbrev=4 HEAD 2> /dev/null ||
                echo HEAD`)"
        fi
        echo -n '\[\e[0;37;'"$ansi"';1m\]'"$branch"'\[\e[0m\] '
    fi
}
function _prompt_command() {
    PS1="`_git_prompt`"'\[\033[01;34m\]\w\[\033[00m\]\$ '
}
PROMPT_COMMAND=_prompt_command
