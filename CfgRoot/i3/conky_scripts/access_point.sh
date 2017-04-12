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

getGatewayIP() {
	echo "$((route -n 2>/dev/null || routel)|awk $'{print $2}'|grep -w "."|head -n1)"
}

access_point() {

	#local iface="$(ip a|awk '/BROADCAST,MULTICAST,UP,LOWER_UP/{print $2}'|sed s'@:@@')"
	local iface="$(ip a|awk '/.BROADCAST.MULTICAST./{print $2}'|sed s'@:@@')"

	local ap="$(iswifi "$iface")"
	local ip="$(getGatewayIP)"


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


[ "$1" == "-g" ] && getGatewayIP && exit # with opt -g return gateway

if AP=$(access_point); then
	echo " $AP"
else
	echo " "
fi
