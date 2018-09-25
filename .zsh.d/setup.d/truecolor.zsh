#!/usr/bin/env
# ST is truecolor-capable, so we set it here.
[ "$TERM" = "st-256color" -o "$TERM" = "st-meta-256color" ] && export COLORTERM=truecolor

if [ "$COLORTERM" = "truecolor" ]; then
	export EMACS_TRUE_COLOR_SEPARATOR=";"
fi
