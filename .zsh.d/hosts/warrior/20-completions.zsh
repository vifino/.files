#!/usr/bin/env zsh
# project cli, big oof.
if [ -d "$HOME/.pro-cli/completions" ]; then
	if ! silent which _project; then
		zplugin creinstall ~/.pro-cli/completions
	fi
fi
