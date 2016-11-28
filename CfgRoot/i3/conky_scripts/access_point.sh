#!/bin/bash

access_point() {
	local iface="$(ip a|awk '/BROADCAST,MULTICAST,UP,LOWER_UP/{print $2}'|sed s'@:@@')"
	local ap=$(iw dev "$iface" link|grep SSID|cut -d " " -f 2- 2>/dev/null)
	declare -i x=$(sed -u 's/^[ \t]*//;/^$/d'<<<${ap}|wc -l)

	if [ $x -ne 0 ]; then
		echo "$ap"
	else
		return 1
	fi
}



if AP=$(access_point); then
	echo " $AP"
else
	echo " "
fi
