#!/bin/bash

RELATIVEDIR="$(dirname "$0")"
cfg="$RELATIVEDIR/Xresources"

xrdb $cfg-urxvt
xrdb -merge $cfg-style-${1:-oldunix}
xrdb -merge $cfg-xterm

unset RELATIVEDIR cfg
