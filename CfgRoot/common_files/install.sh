#!/bin/bash

mythemegtk() {
	git clone https://github.com/Manu-sh/Greybird-Ocean
	cd Greybird-Ocean
	sudo mkdir -p /usr/share/themes/Greybird-Ocean
	sudo cp -r * /usr/share/themes/Greybird-Ocean
	rm -rf Greybird-Ocean
}


FONTS_A=/usr/share/fonts/TTF
FONTS_B=${FONTS_A,,}

[ -e "$FONTS_A" ] && sudo cp *.ttf ${FONT_A}
[ -e "$FONTS_B" ] && sudo cp *.ttf ${FONT_B}
