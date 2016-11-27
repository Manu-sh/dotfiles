#!/bin/bash


#!!! ATTENTION THIS TOOL DOESN'T WORK !!!


#my personal tool for update icewm-menu-file without delete my changes
#this tool is designed to be easy to expand and personalize

nameprg=$0
cache=/tmp/$nameprg-$$

pathlist=( "$HOME/.icewm/menu" )
found=()


bye() {
	rm -Rf $cache
	exit 1
}


#maybe next time can be useful for now is useless
locate_menu() {
	local c=0;
	for K in ${pathlist[@]}; do
		c=$((++c));
		echo "exam element $c -> $K"
		[ -e "$K" ] && found[c]=$K
	done
	unset c K
}


list_found() {
	for i in ${found[@]}; do
		echo "$i"
	done
	unset i
}



#i use one config in ~/.icewm/menu
mkdir -p $cache || exit 1
locate_menu || bye

menu_=$cache/$(basename ${found[1]}.tmp)
cp -v ${found[1]} $menu_ || bye

#save backup
cp -v ${found[1]} ${found[1]}.bak || bye

#using external tool for generate menu
mmaker -f icewm || bye

#my external tool use xterm  prefer urxvt
sed -i s/xterm/urxvt/ ${found[1]} || bye

#merge
cat ${found[1]} $menu_|uniq -u >${found[1]} || bye

rm -Rf $cache
