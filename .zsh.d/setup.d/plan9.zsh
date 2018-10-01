#!/usr/bin/env zsh
[ -z "$PLAN9" -a -d "/usr/lib/plan9" ] && export PLAN9=/usr/lib/plan9
if [ -d "$PLAN9" ]; then
	path+=("$PLAN9/bin")
	9() {
		if [ $# -eq 0 ]; then
			echo "Usage: 9 [cmd] [args..]"
		else
			PATH="$PLAN9/bin:$PATH" "$@"
		fi
	}
fi
