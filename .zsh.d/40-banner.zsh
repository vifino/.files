#!/usr/bin/env zsh

# Execute a banner script if the host has one,
# otherwise print the generic one.

HF=~/.zsh.d/hosts/$HOST/banner

if [ -f "$HF" ] ; then
	# Check if it is executable, then run it.
	if [ -x "$HF" ] ; then
		"$HF"
	else
		cat "$HF" # not much to do here...
	fi
else
	# Really generic thing.
	echo "$HOST, $OS $ARCH: $(date)"
fi
