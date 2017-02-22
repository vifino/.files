###
## ZSH! Yay!
###

##
# PRE-ZPLUG
##

typeset -U path

# Helpers
bash_source() {
  alias shopt=':'
  alias _expand=_bash_expand
  alias _complete=_bash_comp
  emulate -L sh
  setopt kshglob noshglob braceexpand

  source "$@"
}

# Returns 0 if the specified string contains the specified substring, otherwise returns 1.
contains() {
	local string="$1"
	local substring="$2"
	[ "${string#*$substring}" != "$string" ] && return 0 # substring is in string
	return 1 # substring is not in string
}


# DOTFILES!
alias dotfiles='git --git-dir="$HOME/.dotfiles" --work-tree="$HOME"'
alias update-dotfiles='"$HOME/.dotsetup"'

# asdf!         
[[ ! -d ~/.asdf ]] && git clone https://github.com/asdf-vm/asdf.git ~/.asdf --depth=1
. ~/.asdf/asdf.sh

# PATH additions
[ -d ~/bin/generic ] && path=(~/bin/generic "$path[@]")
[ -d ~/bin/`uname`/generic ] && path=(~/bin/`uname`/generic "$path[@]")
[ -d ~/bin/`uname`/`uname -m` ] && path=(~/bin/`uname`/`uname -m` "$path[@]")

[ -d ~/.mix/escripts ] && path=("$path[@]" ~/.mix/escripts)
[ -d ~/.wmutils-contrib ] && path=("$path[@]" ~/.wmutils-contrib)

# Go.
[ -z "$GOPATH" ] && export GOPATH=~/.gopath
contains "$PATH" "$GOPATH" || path=("$path[@]" "$GOPATH/bin")

# GEF
[ ! -f ~/.gdbinit-gef.py ] && wget -q -O ~/.gdbinit-gef.py https://github.com/hugsy/gef/raw/master/gef.py


##
# ZPLUG!
##

# Check if zplug is installed
if [[ ! -d ~/.zplug ]]; then
	git clone https://github.com/zplug/zplug ~/.zplug
	source ~/.zplug/init.zsh && zplug update --self
fi

# Essential
source ~/.zplug/init.zsh

# Easier arch selection
ARCH=`uname -m`
[[ "$ARCH" == "x86_64" ]] && ARCH=amd64

##
# ZPLUG PLUGINS!
##

# zplug itself
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# Syntax highlighting and other enhancements
zplug "zsh-users/zsh-completions", defer:2
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "b4b4r07/enhancd", on:"jhawthorn/fzy"
zplug "rimraf/k"

# Specific completions
zplug "theblazehen/lxd-zsh-completion", defer:2

# load oh-my-zsh plugin(s)
zplug "plugins/git", from:oh-my-zsh

# THEME!
zplug "halfo/lambda-mod-zsh-theme", as:theme

##
# MORE ZPLUG!!
##

# Install packages that have not been installed yet
if ! zplug check --verbose; then
	printf "Install? [y/N]: "
	if read -q; then
		echo; zplug install
	else
		echo
	fi
fi

zplug load

##
# POST-ZPLUG CUSTOMIZATION
##

# Bash-esqe comments.
setopt interactivecomments

# ls aliases, mostly for k
alias ls='ls --color=auto'
alias ll='k -h'
alias la='k -ah'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
