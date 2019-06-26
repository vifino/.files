#!/usr/bin/env zsh
if [ -z "$GPG_AGENT_INFO" ] && hasbin gpg-agent; then
	export GPG_AGENT_INFO=~/.gnupg/S.gpg-agent

	if test -S "$GPG_AGENT_INFO" && running gpg-agent; then
		GPG_TTY=$(tty)
		export GPG_TTY
	else
		echo "[starting gpg agent]"
		eval $(gpg-agent --daemon)
	fi
fi

