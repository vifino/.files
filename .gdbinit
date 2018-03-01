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
set print object on
set print static-members off
set print vtbl on
set print demangle on
set demangle-style gnu-v3
set print sevenbit-strings off
set print asm-demangle on

# These make gdb never pause in its output.
set height 0
set width 0

# GEF
source ~/.gdbinit-gef.py
set startup-with-shell off
