# Syntax highlighting and other enhancements

zplugin ice silent wait'0' blockf
zplugin light zsh-users/zsh-history-substring-search

zplugin ice silent wait'0' blockf
zplugin light zdharma/fast-syntax-highlighting

zplugin ice silent wait'0' blockf
zplugin light "rimraf/k"

zplugin ice silent wait'0' blockf
zplugin light "$HOME/.zshplugs/fzy"

silent which dircolors && {
	zplugin ice atclone"dircolors -b LS_COLORS > c.zsh" atpull'%atclone' pick"c.zsh"
	zplugin light trapd00r/LS_COLORS
}
