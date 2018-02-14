#!/bin/sh
# Login script, historically used by `sh(1p)`.

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
