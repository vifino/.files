# THEME!

# Dumb terms need not have any fancy prompts, they don't work anyways.
[[ $TERM == "dumb" ]] && unsetopt zle && PS1='$ ' && return

# GEOMETRY
PROMPT_GEOMETRY_COLORIZE_SYMBOL=true
PROMPT_GEOMETRY_EXEC_TIME=true
zplugin ice src"geometry.zsh" silent
zplugin light "geometry-zsh/geometry"