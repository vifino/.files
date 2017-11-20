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
[ $ARCH = x86_64 ] && [ -d ~/bin/$OS/i386 ] && path=(~/bin/$OS/i386 "$path[@]")
[ -d ~/bin/$OS/$ARCH ] && path=(~/bin/$OS/$ARCH "$path[@]")

# FreeBSD linuxulator stuff
[ $OS = FreeBSD ] && [ -d ~/bin/Linux/$ARCH ] && path+=(~/bin/Linux/$ARCH)
[ $OS = FreeBSD ] && [ $ARCH = x86_64 ] && [ -d ~/bin/Linux/i386 ] && path+=(~/bin/Linux/i386)

[ -d ~/.mix/escripts ] && path+=(~/.mix/escripts)
[ -d ~/.wmutils-contrib ] && path+=(~/.wmutils-contrib)
[ -d ~/.cargo/bin ] && path+=(~/.cargo/bin)

#[ -z "$PLAN9" ] || path=("$path[@]" $PLAN9/bin)

# Go.
[ -z "$GOPATH" ] && export GOPATH=~/.gopath
path+=("$GOPATH/bin")

path+=("$ospath[@]")
