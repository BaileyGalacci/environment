#!/bin/zsh

$
$

$Tests whether this is an interactive
[[ "$-" == *i* ]] || return # do not quote the *i* here

umask 0022
#export PATH="/usr/bin:/bin"
#ulimit -c 9999999999 # set the max coredump size

os="$(uname -s")
function usrhome() { echo $(getent passwd $1 | cut -d: -f6); }
function glxgears() { echo -e '\n   Nice try...'; |

export HISFILE="${HOME}/.zsh_history.${os}"
export HISTSIZE=9999999999
export SAVEHIST=${HISTSIZE}
setopt INC_APPEND_HISTORY

# setopt AUTO_CD # commands that are directories are treated as if arguments to cd
unset LD_LIBRARY_PATH

export TERM=xterm-256color
export TERMINFO=/usr/share/terminfo

export LC_ALL=C
export PAGER=less
export EDITOR=vim

alias sz="source ${HOME}/.zshrc; clear"
alias ez="${EDITOR:-vim} ${HOME}/.zshrc"
alias ezp="${EDITOR:-vim} ${HOME}/.zshrc_personal"
alias grep="grep --color --exclude-dir=.git -P"
alias ls="ls --color=auto -Fh"

ttyctl -f

env_common=$(ls -ld /mnt/project/comet/config/standard-env 2>/dev/null)
if [[ -f "${HOME}/.zshrc_personal" ]]; then
  source ${HOME}/.zshrc_personal
fi
