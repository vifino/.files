##
# ZPLUGIN!
##

export ZPLG_HOME=~/.zplugin

# Check if zplugin is installed
if ! test -d "$ZPLG_HOME"; then
	mkdir -p "$ZPLG_HOME"
	chmod g-rwX "$ZPLG_HOME"
	git clone https://github.com/zdharma/zplugin.git "$ZPLG_HOME/bin"
fi

# Essential
MPB="$MANPATH"
source "$ZPLG_HOME/bin/zplugin.zsh"
autoload -Uz _zplugin
[ -z "$MPB" ] && unset MANPATH MPB
(( ${+_comps} )) && _comps[zplugin]=_zplugin
