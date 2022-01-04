# Syntax highlighting and other enhancements

zinit ice silent wait'0' blockf
zinit light zsh-users/zsh-history-substring-search

zinit ice silent wait'0' blockf
zinit light zdharma-continuum/fast-syntax-highlighting

#zinit ice silent wait'0' blockf
#zinit light "rimraf/k"

zinit ice silent wait'0' blockf
zinit light "$HOME/.zshplugs/fzy"

silent which dircolors && {
	zinit ice atclone"dircolors -b LS_COLORS > clrs.zsh" \
		atpull'%atclone' pick"clrs.zsh" nocompile'!' \
		atload'zstyle ":completion:*" list-colors “${(s.:.)LS_COLORS}”'
	zinit light trapd00r/LS_COLORS
}
