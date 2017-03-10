# Bourne-shell compatible init file.

# Helpers
source_all() {
	for file in $1/*.sh; do
		. "$file"
	done
}

INTERACTIVE=yes

source_all ~/.shrc.d
