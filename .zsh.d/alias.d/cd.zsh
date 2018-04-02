#!/usr/bin/env zsh

# cd hook.
# shows .notes if it exists.
cd() {
	builtin cd "$1" && (
		[ -f .notes ] && cat .notes || true
	)
}
