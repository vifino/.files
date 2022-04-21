#!/usr/bin/env zsh
if hasbin whois; then
	alias riswhois="whois -h riswhois.ripe.net"
	alias cwhois="whois -h bgp.tools"
	get-isp() {
		[ -z "$1" ] && echo "Usage: get-isp [addr]" && return 1
		whois "$1" | sed -En 's/^org-name: *(.*)$/\1/p'
	}
fi
