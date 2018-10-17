#!/usr/bin/env zsh
# .local setup.
# Note: This does not modify path, but rather everything else.

L="$HOME/.local"

! [ -d "$L" ] && mkdir "$L"
[ -d "$L/include" ] && export CPPFLAGS="-I$L/include $CPPFLAGS"
[ -d "$L/lib" ] && export LDFLAGS="-L/$L/lib $LDFLAGS"
[ -d "$L/lib/pkgconfig" ] && export PKG_CONFIG_PATH="$L/lib/pkgconfig:$PKG_CONFIG_PATH"

# If one does not set a preferred destination,
# do it in the home directory.
[ -z "$DESTDIR" ] && export DESTDIR="$L"
