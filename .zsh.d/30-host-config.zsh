# Host specific configs

DIR="$HOME/.zsh.d/hosts/`hostname`"
[ -d "$DIR" ] && source_all "$DIR"