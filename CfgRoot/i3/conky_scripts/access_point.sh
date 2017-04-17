#!/bin/bash

#echo "$((route -n 2>/dev/null || routel)|awk $'{print $2}'|grep -w "."|head -n1)"
#local iface="$(ip a|awk '/BROADCAST,MULTICAST,UP,LOWER_UP/{print $2}'|sed s'@:@@')"
#local iface="$(ip a|awk '/.BROADCAST.MULTICAST./{print $2}'|sed s'@:@@')"
#local iface="$((route -n 2>/dev/null || routel)|grep '^default'|grep -o '[^ ]*$')"
#echo "$iface, $ap, $ip"

wcl() { sed -u 's/^[ \t]*//;/^$/d'<<<"${1}"|wc -l; }

netinfo() {
	local buf="$(ip route list table 0)"
	case $1 in
		gateway) awk '/default via .* dev/{ print $3; exit }'<<<"${buf}" ;;
		iface) awk '/default via .* dev/{ print $5; exit }'<<<"${buf}" ;;
		ap) iw dev "$(netinfo "iface")" link 2>/dev/null|grep SSID|cut -d " " -f 2- ;;
		default) return 1 ;;
	esac
}

! IP=$(netinfo "gateway") && echo " " && exit

if AP=$(netinfo "ap"); then
	echo " $AP $IP"
else
	echo " ethernet $IP"
fi
