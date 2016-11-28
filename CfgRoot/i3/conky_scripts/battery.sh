#!/bin/bash

styleval() {
	# assuming that those value are expressed in %
	[ "$1" -lt 20 ] && echo -e "" "$1" && return 0
	[ "$1" -lt 50 ] && echo -e "" "$1" && return 0
	[ "$1" -gt 50 ] && echo -e "" "$1" && return 0
}

battery() {
	local battery=$(acpi -b|awk '{print $4}')
	styleval "${battery%%%*}"
}

battery
