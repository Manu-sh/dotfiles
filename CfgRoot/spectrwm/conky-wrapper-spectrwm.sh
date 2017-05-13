#!/bin/bash

while :; do

conky -c 2>/dev/null /dev/stdin << 'EOF' 
out_to_x no
own_window no
out_to_console yes

update_interval 3.0
short_units yes

TEXT
 ${exec $HOME/.config/i3/conky_scripts/cpu.sh} ${exec $HOME/.config/i3/conky_scripts/external_scripts/IconicWeather.sh florence} ${exec $HOME/.config/i3/conky_scripts/battery.sh} ${exec $HOME/.config/i3/conky_scripts/volume.sh} ${exec $HOME/.config/i3/conky_scripts/netinfo.sh "ap"} ${exec $HOME/.config/i3/conky_scripts/netinfo.sh "gateway"} Kernel ★ ${exec uname -r } Proc ⚡ ${exec grep -w "model name" /proc/cpuinfo|uniq|cut -f2 -d ":"|sed s'/[ \t]*//' } Core ⚡${exec nproc --all}  / ${fs_free /} Free RAM [ $mem/$memmax ] 
EOF
	sleep 2
done
