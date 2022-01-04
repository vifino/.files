# THEME!

# Dumb terms need not have any fancy prompts, they don't work anyways.
[[ $TERM == "dumb" ]] && unsetopt zle && PS1='$ ' && return

[ -z "$ZTHEME" ] && ZTHEME=geometry
if [ "$ZTHEME" = "geometry" ]; then
	PROMPT_GEOMETRY_COLORIZE_SYMBOL=true
	PROMPT_GEOMETRY_EXEC_TIME=true
	zinit ice src"geometry.zsh" silent
	zinit light "geometry-zsh/geometry"
elif [ "$ZTHEME" = "blocks" ]; then
	export PS1="%F{90}░▓█%f "
fi
