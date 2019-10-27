#!/bin/sh

for file in ~/.profile.d/*.*
do
	[ ! -r "$file" -o -d "$file" ] && continue

	case "${file##*.}" in
		bash)
			[ -n "$BASH" ] || continue
			;;
	esac

	. "$file"
done
