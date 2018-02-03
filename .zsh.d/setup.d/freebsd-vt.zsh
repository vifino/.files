# Load miniwi font if we're on a vt(4) terminal.
[ "$OS" = "FreeBSD" ] || return 0
[ "`sysctl -n kern.vty`" = vt ] || return 0

FONT=~/.bmfonts/miniwi-8.fnt

echo "$TTY" | grep -q '/dev/ttyv[0-9]' || return 0
[ -f "$FONT" ] && vidcontrol -f "$FONT" && clear
