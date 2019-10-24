#!/usr/bin/env zsh
# Various settings. Mainly keybinds.

# History.
HISTSIZE=1024
setopt hist_ignore_all_dups
setopt hist_ignore_space

# Report things taking longer than 10 seconds.
REPORTTIME=10

# setup zkbd
autoload -U zkbd
KBDFILE=~/.zkbd/$TERM-${${DISPLAY:t}:-$VENDOR-$OSTYPE}
[ ! -f "$KBDFILE" ] && KBDFILE=~/.zkbd/$TERM
[ -f $KBDFILE ] && source $KBDFILE

# setup keys accordingly
[[ -n "${key[Home]}"     ]]  && bindkey "${key[Home]}"     beginning-of-line
[[ -n "${key[End]}"      ]]  && bindkey "${key[End]}"      end-of-line
[[ -n "${key[Insert]}"   ]]  && bindkey "${key[Insert]}"   overwrite-mode
[[ -n "${key[Delete]}"   ]]  && bindkey "${key[Delete]}"   delete-char
[[ -n "${key[Up]}"       ]]  && bindkey "${key[Up]}"       up-line-or-history
[[ -n "${key[Down]}"     ]]  && bindkey "${key[Down]}"     down-line-or-history
[[ -n "${key[Left]}"     ]]  && bindkey "${key[Left]}"     backward-char
[[ -n "${key[Right]}"    ]]  && bindkey "${key[Right]}"    forward-char
[[ -n "${key[PageUp]}"   ]]  && bindkey "${key[PageUp]}"   beginning-of-buffer-or-history
[[ -n "${key[PageDown]}" ]]  && bindkey "${key[PageDown]}" end-of-buffer-or-history

bindkey "^[[1;5C" emacs-forward-word
bindkey "^[[1;5D" backward-word
