# Short abbreviations

# Generic
alias h=hostname

# Applications
alias t=tmux
e() { # Editor
	if [ -z "$EDITOR" ] ; then
		echo '$EDITOR not set.'
	else
		"$EDITOR" "$@"
	fi
}
p() { # Pager
	if [ -z "$PAGER" ] ; then
		echo '$PAGER not set.'
	else
		"$PAGER" "$@"
	fi
}
