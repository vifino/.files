# Completions
zinit ice silent wait'0' blockf
zinit light zsh-users/zsh-completions

if hasbin lxc; then
	zinit ice silent wait'0' blockf
	zinit light endaaman/lxd-completion-zsh
fi

# SSH - don't complete users by default.
zstyle ':completion:*:ssh:*'  tag-order '! users'
zstyle ':completion:*:scp:*'  tag-order '! users'
zstyle ':completion:*:sftp:*' tag-order '! users'
