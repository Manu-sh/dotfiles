#!/bin/bash

RELATIVEDIR="$(dirname "$0")"

colorscheme="Xresources-palette"

xrdb $RELATIVEDIR/Xresources-urxvt
xrdb -merge "$RELATIVEDIR/$colorscheme"
unset RELATIVEDIR colorscheme
