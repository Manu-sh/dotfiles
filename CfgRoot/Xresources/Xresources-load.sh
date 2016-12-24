#!/bin/bash

RELATIVEDIR="$(dirname "$0")"
cfg="$RELATIVEDIR/Xresources"

xrdb $cfg-urxvt
xrdb -merge $cfg-palette
xrdb -merge $cfg-xterm

unset RELATIVEDIR cfg
