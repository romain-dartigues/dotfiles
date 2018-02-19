#!/bin/sh

# functions ##################################################################

protect() { gzip -9 | base64 -w0;echo; }
unprotect() { base64 -d | gzip -d; }

mcd() { mkdir -p "$*" ; cd "$*" ; }

# true if $1 is in $2
isin() {
	[ ! -z "$2" -a -z "${2##*${1}*}" ]
}

# return true if $1 is greater or equal to $2
gte() {
	[ "$1" = "$(printf "%s\n%s" "$1" "$2" | sort -rV | head -n1)" ]
}





# aliases ####################################################################

alias ll='ls -lAvh --color=auto'
alias ..='cd ..'
alias ...='cd ../..'





# variables ##################################################################

PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin"
[ -e "${HOME}/.local/bin" ] && PATH="${HOME}/.local/bin:${PATH}"
export PATH

export HISTCONTROL=ignoredups:erasedups
export HISTSIZE=1000
export HISTFILESIZE=
export HISTTIMEFORMAT='%FT%T '

isin "history -a" "$PROMPT_COMMAND" ||
	export PROMPT_COMMAND="history -a;$PROMPT_COMMAND"

export CLICOLOR=true

export LESS='-c -i -M -R'
export LESSHISTFILE='-'

export LS_OPTIONS='-F -b -T 0 --color=auto'
export PS1='\u@\h:\W\$ '
export TREE_CHARSET=utf8
export VISUAL=vim EDITOR=vim

[ -f "${HOME}/.config/pythonrc.py" ] &&
	export PYTHONSTARTUP="${HOME}/.config/pythonrc.py"

unset -v MAILCHECK





##############################################################################

command -v keychain >&- 2>&- &&
	eval $(keychain --eval --quick --quiet --ignore-missing id_ecdsa id_ed25519 id_rsa)
