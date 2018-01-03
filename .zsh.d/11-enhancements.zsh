# Syntax highlighting and other enhancements

zplugin light zsh-users/zsh-history-substring-search
zplugin light zdharma/fast-syntax-highlighting
zplugin light "rimraf/k"
zplugin light "$HOME/.zshplugs/fzy"

silent which dircolors && {
	zplugin ice atclone"dircolors -b LS_COLORS > c.zsh" atpull'%atclone' pick"c.zsh"
	zplugin light trapd00r/LS_COLORS
}
