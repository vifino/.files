#!/bin/sh
export CFLAGS="-O2 -pipe -march=native -ffunction-sections -fdata-sections -falign-functions=32 -fPIC"
export CXXFLAGS="$CFLAGS"

