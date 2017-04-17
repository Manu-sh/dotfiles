#!/bin/bash

#styleval "${battery%%%*}"
wcl() { sed -u 's/^[ \t]*//;/^$/d'<<<"${1}"|wc -l; }

styleval() {
	# assuming that those value are expressed in %
	[ "$1" -le 20 ] && echo -e "" "$1" && return 0
	[ "$1" -le 50 ] && echo -e "" "$1" && return 0
	[ "$1" -ge 50 ] && echo -e "" "$1" && return 0
}

battery() {
	local buf="$(acpi -b 2>/dev/null || exit)"
	! [ "$(wcl "$buf")" == 0 ] || exit
	local battery=$(awk '{print $4}' <<< "${buf}")
	styleval "$(grep -o "[0-9]." <<< "${battery}")"
}

battery
