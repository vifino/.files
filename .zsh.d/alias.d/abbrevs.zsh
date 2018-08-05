##
# Short abbreviations and helpers
##

# Generic
alias h=hostname
alias wh=which
alias j=jobs

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

# gstreamer
silent wh gst-launch-1.0 && alias gst=gst-launch-1.0 ||
[ $? != 0 ] && silent wh gst-launch-0.1 && alias gst=gst-launch-0.1

# X11/WM stuff
silent wh herbstclient && alias hc=herbstclient

# Music
alias np=song
