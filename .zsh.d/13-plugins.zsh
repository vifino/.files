# Load extra plugins.

#zinit "plugins/git", from:oh-my-zsh

if hasbin direnv; then
	eval "$(direnv hook zsh)"
elif hasbin go; then
	zinit ice silent wait'0' blockf as"program" make'! clean all' atclone'./direnv hook zsh > zhook.zsh' atpull'%atclone' src"zhook.zsh"
	zinit light direnv/direnv
fi
