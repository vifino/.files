#!/bin/sh

# Sets our path.
# Could even work.

contains() {
	case "$1" in
		*"$2"*) return 0
	esac
	return 1
}

addpath() {
	if [ -d "$1" ]; then
		if ! contains "$PATH" "$1"; then
			PATH="$1:$PATH"
		fi
	fi
}

addpath ~/bin/generic
addpath ~/bin/`uname`/generic
addpath ~/bin/`uname`/`uname -m`
