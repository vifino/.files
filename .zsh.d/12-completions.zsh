# Completions

zstyle ':completion:*' completer _extensions _complete _approximate
zstyle ':completion:*' menu select=long
zstyle ':completion:*:*:*:*:descriptions' format '%F{green}-- %d --%f'
zstyle ':completion:*:*:*:*:corrections' format '%F{yellow}!- %d (errors: %e) -!%f'
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*' group-name ''

zstyle ':completion:*' squeeze-slashes true

# SSH - don't complete users by default.
zstyle ':completion:*:ssh:*'  tag-order '! users'
zstyle ':completion:*:scp:*'  tag-order '! users'
zstyle ':completion:*:sftp:*' tag-order '! users'

# Completion plugins
zinit ice silent wait'0' blockf
zinit light zsh-users/zsh-completions

if hasbin lxc; then
	zinit ice silent wait'0' blockf
	zinit light endaaman/lxd-completion-zsh
fi

