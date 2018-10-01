#!/usr/bin/env zsh
# Keybinds for animated effects.

if hasbin cc scrwipe; then
	scrwipe_widget() {
		scrwipe && zle clear-screen
	}
	zle -N scrwipe_widget
	bindkey "^L" scrwipe_widget
fi
