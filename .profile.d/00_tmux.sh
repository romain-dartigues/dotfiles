#!/bin/sh

if command -v tmux >&- && [ -z "$TMUX" ]
then
	ID="$(tmux ls 2>&- | sed -rn '/attached/!{s/:.*//p;q}')"
	if [ -z "$ID" ]; then
		if [ -z "$TMUX" -a ! -z "$WINDOWID" ]; then
			exec tmux -2
		fi
	else
		exec tmux -2 attach-session -t "$ID"
	fi
	unset ID
fi

