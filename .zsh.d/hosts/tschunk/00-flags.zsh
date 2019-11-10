#!/bin/sh
export CFLAGS="-O2 -pipe -march=native -ffunction-sections -fdata-sections -falign-functions=32 -flto"
export CXXFLAGS="$CFLAGS"
export LDFLAGS="-flto"

