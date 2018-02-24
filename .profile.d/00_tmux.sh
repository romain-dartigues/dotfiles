#!/bin/sh

_init_tmux() {
	if ! command -v tmux >&- || [ -n "$TMUX" ]
	then
		return
	fi

	ID="$(tmux ls 2>&- | sed -rn '/attached/!{s/:.*//p;q}')"
	if [ -z "$ID" ]; then
		if [ -z "$TMUX" -a ! -z "$WINDOWID" ]; then
			exec tmux -2
		fi
	else
		exec tmux -2 attach-session -t "$ID"
	fi
	unset ID
}



case "$(tty)" in
	/dev/tty1)
		# inspiration from CDM
		[ -z "$DISPLAY$SSH_TTY$(pgrep xinit)" ] && exec startx
		;;
	/dev/tty*)
		# not automatically running tmux in a /dev/tty*
		# otherwise we won't be able to "startx"
		break
		;;
	*)
		_init_tmux
		;;
esac
