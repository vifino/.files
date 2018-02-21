##
# PATH
##

OS=`uname`
ARCH=`uname -m`
[ $ARCH = amd64 ] && ARCH=x86_64

export OS ARCH

# we use the path variable, because it prevents duplication.
#typeset -U path
ospath=("$path[@]")
path=()

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

##
# Additions after system path
##
path+=("$ospath[@]")

# Plan9
[ -z "$PLAN9" ] || path+=("$PLAN9/bin")
