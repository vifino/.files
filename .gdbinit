# .gdbinit

# Allow memory accesses outside of mapped range.
# Useful for mmpped I/O while using a BMP.
set mem inaccessible-by-default off

# Don't use a shell.
# Required on OSX, slows things down on low-end devices, don't need it.
set startup-with-shell off

# Disable pager
set pagination off

# purrdy
set print pretty on

# GEF
source ~/.gdbinit-gef.py
set startup-with-shell off
