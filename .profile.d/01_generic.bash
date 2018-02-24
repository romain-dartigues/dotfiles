#!/bin/bash
#
# Bash only

if [ -n "$BASH" ]
then

# options ####################################################################

shopt -s histappend



# functions ##################################################################



# variables ##################################################################

export HISTCONTROL='ignoredups:erasedups'
export HISTSIZE=1000
export HISTFILESIZE=
export HISTTIMEFORMAT='%FT%T '

command -v isin >&- 2>&- && ! isin 'history -a' "$PROMPT_COMMAND" &&
export PROMPT_COMMAND="history -a;${PROMPT_COMMAND}"



## colours ###################################################################
# escape sequences supported by the terminal: infocmp(1)

export LESS_TERMCAP_mb=$'\e[1;31m'        # blink
export LESS_TERMCAP_md=$'\e[01;38;5;74m'  # bold
export LESS_TERMCAP_se=$'\e[0m'           # end
export LESS_TERMCAP_so=$'\e[7m'           # stand-out
export LESS_TERMCAP_us=$'\e[04;38;5;146m' # underline
export LESS_TERMCAP_me="$LESS_TERMCAP_se" LESS_TERMCAP_ue="$LESS_TERMCAP_se"

export PS1="${PS1/\\u/\$([ \$(id -u) = 0 ]&&printf "\[\033[01;31m\]\u\[\033[0m\]"||printf \u)}"

fi
