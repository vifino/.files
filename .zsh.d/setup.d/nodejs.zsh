#!/usr/bin/env zsh
# Blech.
npm_prefix="$HOME/.local/share/npm"
export NODE_PATH="$npm_prefix/lib/node_modules"
if [ -d "$npm_prefix" ]; then
	path+=("$npm_prefix/bin")
fi
