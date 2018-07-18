# .gdbinit

# Allow memory accesses outside of mapped range.
# Useful for mmpped I/O while using a BMP.
set mem inaccessible-by-default off

# Don't use a shell.
# Required on OSX, slows things down on low-end devices, don't need it.
set startup-with-shell off

# Disable pager make sure gdb never pauses output.
set pagination off
set height 0
set width 0

# purrdy
set print pretty on
set print object on
set print static-members off
set print vtbl on
set print demangle on
set demangle-style gnu-v3
set print sevenbit-strings off
set print asm-demangle on

# Don't annoy me.
set confirm off

# Set a neat prompt incase GEF doesn't load.
set prompt \01\033[32m\002>> \001\033[0m\002

# Load aliases
source ~/.gdb_aliases

# GEF
# Since GEF is overkill quite often,
# just define an alias to load it.
define gef
	source ~/.gdbinit-gef.py
end

# Source per-project .gdbinit files.
set auto-load safe-path /
