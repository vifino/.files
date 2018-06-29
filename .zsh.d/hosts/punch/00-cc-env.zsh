#!/usr/bin/env zsh

export CC=clang CPP=clang-cpp CXX=clang++
export CPPFLAGS="-I/usr/local/include -I/usr/X11R6/include" 
export LDFLAGS="-L/usr/local/lib -L/usr/X11R6/lib"
