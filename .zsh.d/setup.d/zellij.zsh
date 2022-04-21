#!/usr/bin/env zsh

hasbin zellij && _zellij() {
	eval "$(zellij setup --generate-completion zsh)"
} && compdef _zellij zellij
