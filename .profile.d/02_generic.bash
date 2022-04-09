#!/bin/bash
#
# Bash only

if [ -n "$BASH" ]
then

shopt -s histappend

export LESS_TERMCAP_mb=$'\e[1;31m'        # blink
export LESS_TERMCAP_md=$'\e[01;38;5;74m'  # bold
export LESS_TERMCAP_se=$'\e[0m'           # end
export LESS_TERMCAP_so=$'\e[7m'           # stand-out
export LESS_TERMCAP_us=$'\e[04;38;5;146m' # underline
export LESS_TERMCAP_me="$LESS_TERMCAP_se" LESS_TERMCAP_ue="$LESS_TERMCAP_se"

fi
