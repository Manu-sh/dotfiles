#!/bin/bash

styleval() {
	# assuming that those value are expressed in %
	[ "$1" -le 20 ] && echo -e "" "$1" && return 0
	[ "$1" -le 50 ] && echo -e "" "$1" && return 0
	[ "$1" -ge 50 ] && echo -e "" "$1" && return 0
}

battery() {
	local battery=$(acpi -b|awk '{print $4}')
	styleval "${battery%%%*}"
}

battery
