# Load extra plugins.

#zinit "plugins/git", from:oh-my-zsh

if hasbin go; then
	zinit ice silent wait'0' blockf as"program" make'!' atclone'./direnv hook zsh > zhook.zsh' atpull'%atclone' src"zhook.zsh"
	zinit light direnv/direnv
fi
