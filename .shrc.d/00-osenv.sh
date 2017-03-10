#!/bin/sh

# Some OSes need specific magic to work with my setup.
# So, here are some hacky fixes.

OS=`uname`

# Helpers
contains() {
	case "$1" in
		*"$2"*) return 0
	esac
	return 1
}

addpath_tail() {
	if [ -d "$1" ]; then
		if ! contains "$PATH" "$1"; then
			PATH="$PATH:$1"
		fi
	fi
}

# This should only run once.
[ "$PATCHEDENV" = yes ] && return
if [ "$OS" = "Minix" ]; then # MINIX3, hopefully...
	CC="clang"
	CXX="clang++"
	LDFLAGS="-Wl,-R/usr/pkg/lib -L/usr/pkg/lib"
	CPPFLAGS="-I/usr/pkg/include"
	MAKE=gmake
	export CC CXX LDFLAGS CPPFLAGS MAKE

	PATH="/bin:/sbin:/usr/bin:/usr/sbin"
	addpath_tail /usr/pkg/bin
	addpath_tail /usr/pkg/sbin
	addpath_tail /usr/X11*/bin
	addpath_tail /usr/local/bin
	addpath_tail /usr/local/sbin
	export PATH

	ENV=$HOME/.shrc
	export ENV
fi

PATCHEDENV=yes
export PATCHEDENV
