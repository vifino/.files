#!/usr/bin/env zsh

# Enable color in programs that support it, but don't activate it automatically (by default).
hasbin ip && alias ip="ip --color=auto"
hasbin bridge && alias bridge="bridge --color=auto"
