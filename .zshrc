##
## ZSH! Yay!
###

# Load our things!
source_all() {
	for file in $1/*.zsh; do
		. "$file"
	done
}

source_all ~/.zsh.d