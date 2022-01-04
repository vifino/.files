##
# PATH
##

OS=`uname`
ARCH=`uname -m`
[ $ARCH = amd64 ] && ARCH=x86_64

export OS ARCH

# Nix stuff.
[ -f "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh" ] && . "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"

if [ ! -z "$NIX_PROFILES" ]; then
	for profile in ${(z)NIX_PROFILES}; do
		fpath+=($profile/share/zsh/site-functions $profile/share/zsh/$ZSH_VERSION/functions $profile/share/zsh/vendor-completions)
	done
fi

# we use the path variable, because it prevents duplication.
typeset -U ospath
ospath=("$path[@]")
path=()
#typeset -U path

[ -d ~/bin/generic ] && path=(~/bin/generic "$path[@]")
[ -d ~/bin/$OS/generic ] && path=(~/bin/$OS/generic "$path[@]")
[ -d ~/bin/$OS/$ARCH ] && path=(~/bin/$OS/$ARCH "$path[@]")
[ $ARCH = x86_64 ] && [ -d ~/bin/$OS/i386 ] && path+=(~/bin/$OS/i386)

# FreeBSD linuxulator stuff
[ $OS = FreeBSD ] && [ -d ~/bin/Linux/$ARCH ] && path+=(~/bin/Linux/$ARCH)
[ $OS = FreeBSD ] && [ $ARCH = x86_64 ] && [ -d ~/bin/Linux/i386 ] && path+=(~/bin/Linux/i386)


[ -d ~/.mix/escripts ] && path+=(~/.mix/escripts)
[ -d ~/.wmutils-contrib ] && path+=(~/.wmutils-contrib)
[ -d ~/.cargo/bin ] && path+=(~/.cargo/bin)

# Go.
[ -z "$GOPATH" ] && export GOPATH=~/.gopath
path+=("$GOPATH/bin")

# Generic local bins
[ -d /usr/local/sbin ] && path+=(/usr/local/sbin)
[ -d /usr/local/bin ] && path+=(/usr/local/bin)
[ -d ~/.local/bin ] && path=(~/.local/bin "$path[@]")
##
# Additions after system path
##
path+=("$ospath[@]")
