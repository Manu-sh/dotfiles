CFGROOT=$HOME/dotfiles/CfgRoot
WALLWM=$HOME/Immagini/wallpaper/favorite/08.jpg

setxkbmap it
bash $CFGROOT/Xresources/Xresources-load.sh



# TODO: 2 function
#		for launch simple wm that require more third part like feh conky or mpd.
#		for launch wm that include this feature like fvwm or icewm etc..



all_wm() {

	feh --bg-fill "${WALLWM}"
	mpd ~/.mpd/mpd.conf
	dunst &
	# conky

	case $1 in
		i3)
			bash $CFGROOT/Xresources/Xresources-load.sh "i3"
			i3
			compton -b
		;;

		dwm) dwm ;;
		openbox) openbox ;;
		fluxbox) fluxbox ;;
		blackbox) blackbox ;;
	esac
}


#startlxde
#pekwm
#icewm
#xfce4-session
#twin
#startkde
#cde
#jwm
#lwm

#cinnamon-session
#mate-session

#all_wm dwm
#awesome
#spectrwm
#bspwm
#xmonad
#all_wm i3
fvwm2

unset WALLWM CFGROOT
unset -f all_wm pantheon_de
