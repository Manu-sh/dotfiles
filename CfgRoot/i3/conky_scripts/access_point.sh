#!/bin/bash

#echo "$((route -n 2>/dev/null || routel)|awk $'{print $2}'|grep -w "."|head -n1)"
#local iface="$(ip a|awk '/BROADCAST,MULTICAST,UP,LOWER_UP/{print $2}'|sed s'@:@@')"
#local iface="$(ip a|awk '/.BROADCAST.MULTICAST./{print $2}'|sed s'@:@@')"
#local iface="$((route -n 2>/dev/null || routel)|grep '^default'|grep -o '[^ ]*$')"
#echo "$iface, $ap, $ip"

buf="$(ip route list table 0)"
_wcl() { sed -u 's/^[ \t]*//;/^$/d'<<<"${1}"|wc -l; }
getGatewayIP() {  awk '/default via .* dev/{ print $3; exit }'<<<"${buf}"; }
getIface() { awk '/default via .* dev/{ print $5; exit }'<<<"${buf}"; }

iswifi() {
	if local ap=$(iw dev "$1" link 2>/dev/null|grep SSID|cut -d " " -f 2-); then
		echo "$ap"
	else
		return 1
	fi
}

access_point() {

	local iface="$(getIface)"
	local ip="$(getGatewayIP)"
	local ap="$(iswifi "$iface")"

	[ "$(_wcl "$iface")" != "0" ] || return 1

	if [ -n "$ap" ]; then
		declare -i x=$(_wcl "$ap")

		if [ $x -ne 0 ]; then # TODO im tired
			echo "$ap $(getGatewayIP)"
		else
			echo "ethernet $(getGatewayIP)"
		fi
	else
		echo "ethernet $(getGatewayIP)"

	fi
}

if AP=$(access_point); then
	echo " $AP"
else
	echo " "
fi
