# Some vals to set

[ -z "$LANG" ] && export LANG="en_US.UTF-8" # might break things, but could fix things, too.
[ -z "$TMPDIR" ] && export TMPDIR=/tmp

export CLICOLOR=true

# Fixup for tiling WMs
_JAVA_AWT_WM_NONREPARENTING=1
GTK_CSD=0
