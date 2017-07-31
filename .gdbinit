# .gdbinit

# Allow memory accesses outside of mapped range.
# Useful for mmpped I/O while using a BMP.
set mem inaccessible-by-default off

# Disable pager
set pagination off

# purrdy
set print pretty on

# GEF
source ~/.gdbinit-gef.py