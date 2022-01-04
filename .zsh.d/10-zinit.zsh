##
# ZPLUGIN!
##

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Check if zinit is installed
if ! test -d "$ZINIT_HOME"; then
	mkdir -p "$(dirname $ZINIT_HOME)"
	git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

#MPB="$MANPATH"
source "${ZINIT_HOME}/zinit.zsh"
