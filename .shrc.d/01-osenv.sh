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

addpath() {
	if [ -d "$1" ]; then
		if ! contains "$PATH" "$1"; then
			PATH="$1:$PATH"
		fi
	fi
}

if [ "$OS" = "Minix" ]; then # MINIX3, hopefully.
	CC="clang"
	CXX="clang++"
	LDFLAGS="-Wl,-R/usr/pkg/lib -L/usr/pkg/lib"
	CPPFLAGS="-I/usr/pkg/include"
	MAKE=gmake
	export CC CXX LDFLAGS CPPFLAGS MAKE
fi