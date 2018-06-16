#!/bin/bash

while :; do

conky -c 2>/dev/null /dev/stdin << 'EOF' 
out_to_x no
own_window no
out_to_console yes

update_interval 3.0
short_units yes

TEXT
CPU ${exec $HOME/.config/i3/conky_scripts/cpu.sh} | WEATHER ${exec $HOME/.config/i3/conky_scripts/external_scripts/IconicWeather.sh florence} | ${exec $HOME/.config/i3/conky_scripts/battery.sh} | VOL ${exec $HOME/.config/i3/conky_scripts/volume.sh} | AP ${exec $HOME/.config/i3/conky_scripts/netinfo.sh "ap"} ${exec $HOME/.config/i3/conky_scripts/netinfo.sh "gateway"} | KERNEL ${exec uname -r } | PROC ${exec grep -wm 1 'model name[[:space:]]:' /proc/cpuinfo|sed s/^model\ name[[:space:]]:[[:space:]]//g } | CORE ${exec nproc --all} | FS / ${fs_free /} | RAM [ $mem/$memmax ]
EOF
	sleep 2
done
