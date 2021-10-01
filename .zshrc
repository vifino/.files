##
## ZSH! Yay!
###

# Preflight
[ -f "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh" ] && . "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"

# Load our things!
source_all() {
	for file in $1/*.zsh; do
		. "$file"
	done
}

source_all ~/.zsh.d
