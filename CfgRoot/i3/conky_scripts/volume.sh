#!/bin/bash

styleval() {
        # assuming that those value are expressed in %
        [ "$1" -le 5 ] && echo -e "" "$1" && return 0
        [ "$1" -ge 5 ] && echo -e "" "$1" && return 0
        [ "$1" -ge 50 ] && echo -e "" "$1" && return 0
}


ismute() {
	stat=$(amixer get Master|sed -u '$!d;s/[^a-z]//g')
	stat=${stat:(-3)}
	[ "$stat" == "off" ] && return 0
}

volume() {

	if ! ismute; then
		volume=$(amixer get Master|tail -1|cut -sd% -f1)
		volume=$(sed -u s'@\[@@'g <<<${volume:(-3)})
		styleval "$volume"
	else
		echo " mute"
	fi
}

volume

