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
	[ "$1" = "$(printf '%s\n%s' "$1" "$2" | sort -rV | head -n1)" ]
}

# save mode, ownership (canonical, numeric), mtime
save_attributes() {
       find "$@" -printf '%04m\0%u\0%g\0%U\0%G\0%TFT%TT\0%p\0'
}

restore_attributes() {
       xargs -0 -n7 sh -c '[ -L "$5" ] || chmod $0 "$6";chown -h $3:$4 "$6";touch -md $5 "$6"'
}


# save mode, ownership (canonical, numeric), mtime
save_attributes() {
	find "$@" -printf '%04m\0%u\0%g\0%U\0%G\0%TFT%TT\0%p\0'
}

restore_attributes() {
	xargs -0 -n7 sh -c '[ -L "$5" ] || chmod $0 "$6";chown -h $3:$4 "$6";touch -md $5 "$6"'
}



# aliases ####################################################################

alias ll='ls -lAvh --color=auto'
alias ..='cd ..'
alias ...='cd ../..'





# variables ##################################################################

PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin"
[ -e "${HOME}/.local/bin" ] && PATH="${HOME}/.local/bin:${PATH}"
export PATH

export CLICOLOR=true

export LESS='-c -i -M -R'
export LESSHISTFILE='-'

export LS_OPTIONS='-F -b -T 0 --color=auto'
isin 'di=0;36' "$LS_COLORS" ||
export LS_COLORS="${LS_COLORS}:di=0;36"
export PS1='$ '
export VISUAL='vim' EDITOR='vim'

[ -f "${HOME}/.config/pythonrc.py" ] &&
export PYTHONSTARTUP="${HOME}/.config/pythonrc.py"

export TZ="/usr/share/zoneinfo/Europe/Paris"

unset -v MAILCHECK






##############################################################################

command -v keychain >&- 2>&- &&
eval $(keychain --eval --quick --quiet --ignore-missing id_ecdsa id_ed25519 id_rsa)
