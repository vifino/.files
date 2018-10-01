#!/usr/bin/env zsh
# GCC. Because LTO.
export CC=gcc CXX=g++ AR=gcc-ar NM=gcc-nm RANLIB=gcc-ranlib
export CFLAGS="-O2 -march=native -flto" LDFLAGS="-Wl,-O2 -flto"
export CXXFLAGS="$CFLAGS"
