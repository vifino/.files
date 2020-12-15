# ls aliases, mostly for k

alias ll='k -h'
alias la='k -ah'

# Figure out if our ls supports colors
ls --color=auto ~ >/dev/null 2>&1
[ $? = 0 ] && alias ls='ls --color=auto'
