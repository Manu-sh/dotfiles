#!/bin/bash

styleval() {
        # assuming that those value are expressed in %
        [ "$1" -lt 5 ] && echo -e "" "$1" && return 0
        [ "$1" -gt 5 ] && echo -e "" "$1" && return 0
        [ "$1" -gt 50 ] && echo -e "" "$1" && return 0
}

volume() {
	volume=$(amixer get Master|tail -1|cut -sd% -f1)
	volume=$(sed -u s'@\[@@'g <<<${volume:(-3)})
	styleval "$volume"
}

volume

