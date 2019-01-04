#!/usr/bin/env bash

export PATH=$PATH:~/usr/bin
export CPATH=$CPATH:~/usr/include
export LD_RUN_PATH=$LD_RUN_PATH:~/usr/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:~/usr/lib
export LIBRARY_PATH=$LD_LIBRARY_PATH:~/usr/lib
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:~/usr/share/pkgconfig:~/usr/lib/pkgconfig

exec i3 -V &> ~/.lastlogin-i3
