#!/bin/sh
# Setup colorscheme for Linux FB term.
# But only if it's actually the FB term.

[ "$TERM" = "linux" ] || return 0

# Setup cursor
#printf '\033[?17;255c' # set black/white block cursor
#printf '\033[%sm\033[8]' '1;37' # set foreground to brightwhite

lxsetcolor() {
	printf '\033]P%X%s' "$1" "$2"
}

# Set colors
lxsetcolor 0  101010 # Black
lxsetcolor 8  6F6F6F # Bright black

lxsetcolor 1  FF6878 # Red
lxsetcolor 9  FF778B # Bright red

lxsetcolor 2  B4FB73 # Green
lxsetcolor 10 D0FFA0 # Bright green

lxsetcolor 3  FFF090 # Yellow
lxsetcolor 11 FFFEB0 # Bright yellow

lxsetcolor 4  6095FF # Blue
lxsetcolor 12 80C0FF # Bright blue

lxsetcolor 5  FF90FE # Magenta
lxsetcolor 13 F0A9FF # Bright magenta

lxsetcolor 6  45E1F0 # Cyan
lxsetcolor 14 90E9FF # Bright cyan

lxsetcolor 7  F1F1F1 # White
lxsetcolor 15 FFFFFF # Bright white
