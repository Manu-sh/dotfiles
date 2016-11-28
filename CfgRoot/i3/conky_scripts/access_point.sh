#!/bin/bash


_wcl() {
	sed -u 's/^[ \t]*//;/^$/d'<<<"${1}"|wc -l
}


iswifi() {
	if local ap=$(iw dev "$1" link 2>/dev/null|grep SSID|cut -d " " -f 2-); then
		echo "$ap"
	else
		return 1
	fi
}

access_point() {

	local iface="$(ip a|awk '/BROADCAST,MULTICAST,UP,LOWER_UP/{print $2}'|sed s'@:@@')"

	local ap="$(iswifi)"
	local ip=$(route -n 2>/dev/null || routel|awk $'{print $2}'|grep -w "."|head -n1)

	[ "$(_wcl "$iface")" != "0" ] || return 1


	if [ -z "$ap" ]; then
		echo "ethernet: $ip"
		return 0
	else
		declare -i x=$(_wcl "$ap")

		if [ $x -ne 0 ]; then
			echo "$ap"
		else
			return 1
		fi
	fi
}



if AP=$(access_point); then
	echo " $AP"
else
	echo " "
fi
