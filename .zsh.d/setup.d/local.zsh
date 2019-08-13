#!/usr/bin/env zsh
# .local setup.
# Note: This does not modify path, but rather everything else.

L="$HOME/.local"

! [ -d "$L" ] && mkdir "$L"
[ -d "$L/include" ] && ! contains "$CPPFLAGS" "-I$L/include" && export CPPFLAGS="-I$L/include $CPPFLAGS"
if [ -d "$L/lib" ]; then
	contains "$LDFLAGS" "-L$L/lib" || export LDFLAGS="-L$L/lib $LDFLAGS"
	contains "$LD_LIBRARY_PATH" "$L/lib" || export LD_LIBRARY_PATH="$L/lib:$LD_LIBRARY_PATH"
fi
[ -d "$L/lib/pkgconfig" ] && ! contains "$PKG_CONFIG_PATH" "$L/lib/pkgconfig" && export PKG_CONFIG_PATH="$L/lib/pkgconfig:$PKG_CONFIG_PATH"

[ -d "$L/share/man" ] && ! contains "$MANPATH" "$L/share/man" && export MANPATH="$L/share/man:$PKG_CONFIG_PATH"


# If one does not set a preferred destination,
# do it in the home directory.
[ -z "$PREFIX" ] && export PREFIX="$L"
