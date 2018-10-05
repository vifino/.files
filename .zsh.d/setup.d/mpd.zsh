#!/usr/bin/env zsh
[ -S "$HOME/.mpd/socket" ] && export MPD_HOST="$HOME/.mpd/socket"
