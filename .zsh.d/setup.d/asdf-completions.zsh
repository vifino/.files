# asdf completions, only load those if bash-style complete exists.
autoload -U +X bashcompinit && bashcompinit
type complete >/dev/null && . ~/.asdf/completions/asdf.bash
