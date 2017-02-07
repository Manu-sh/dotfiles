#!/bin/bash

# This script is for create my neon icon theme variant from Archdroid-Pink theme
# don't use if you don't know exactly how to work
# bash sed_archdroid_icon_theme_svg.sh Archdroid-Pink Archdroid-Test
# git clone https://github.com/GreenRaccoon23/archdroid-icon-theme

src_theme=$1 dest_theme=$2

[ $# -lt 2 ] && echo "invalid argument number" && exit

cd /usr/share/icons || exit
! [ -e "$src_theme" ] && echo "source theme $src_theme not found" && exit

if [ -e "$dest_theme" ] && [ "$3" == "-d" ]; then
	echo "deleting old files $dest_theme ..."
	sudo rm -r "$dest_theme"
elif [ -e "$dest_theme" ] && [ "$3" != "-d" ]; then
	echo "the destination theme $dest_theme exist, use flag -d as arg no 3 (\$3) for delete"
	exit
fi


sudo cp -R "$src_theme" "$dest_theme"

# neon purple no 1
cd "$dest_theme" && sudo find -name "*.svg" -exec sed -i s'/fill="#E91E63"/fill="#212121" stroke="#8700d7" stroke-width="1.5" opacity="100"/'g {} \;


#Diehard4 theme
#find -name "*rc" -exec sed -i s'/#9F440D/#8700d7/'g {} \;; find -name "*rc" -exec sed -i s'/#95410E/#8700d7/'g {} \;; find -name "*rc" -exec sed -i s'/#9D430D/#8700d7/'g {} \;
#find -name "*.xpm" -exec sed -i s'/#9F440D/#8700d7/'g {} \;; find -name "*.xpm" -exec sed -i s'/#95410E/#8700d7/'g {} \;; find -name "*.xpm" -exec sed -i s'/#9D430D/#8700d7/'g {} \;

# then install image magic and launch in Diehard4/gtk-2.0
#find -name "*.png" -exec convert {} -fuzz 30% -fill ' #8700d7' -opaque '#9f440d' {} \;
