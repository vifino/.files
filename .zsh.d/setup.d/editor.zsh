#!/usr/bin/env zsh
# set EDITOR variable appropriately

for editor in emacs vim micro nano vi; do
	silent which $editor && export EDITOR=$editor && return
done