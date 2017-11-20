# Little helpers

bash_source() {
  alias shopt=':'
  alias _expand=_bash_expand
  alias _complete=_bash_comp
  emulate -L sh
  setopt kshglob noshglob braceexpand

  source "$@"
}

# Returns 0 if the specified string contains the specified substring, otherwise returns 1.
contains() {
	local string="$1"
	local substring="$2"
	[ "${string#*$substring}" != "$string" ] && return 0 # substring is in string
	return 1 # substring is not in string
}

[ -z "$HOST" ] && export HOST=$(hostname)
