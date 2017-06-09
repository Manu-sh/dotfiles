CFGROOT=$HOME/dotfiles/CfgRoot
WALLPAPER=$HOME/Immagini/wallpaper/wallpaper_48.png

loadXresources() {
	local xresources="$CFGROOT/Xresources"
	xrdb "${xresources}/${1}"
}

setxkbmap it

all_wm() {
	dunst &
#	conky
	mpd ~/.mpd/mpd.conf
	case $1 in

		i3)
			loadXresources "Xresources-urxvt-i3"
			compton -b
			feh --bg-fill ${WALLPAPER}
			i3
		;;

		fvwm2) 
			loadXresources "Xresources-urxvt-alpha"
			fvwm2
		;;

		openbox)
			feh --bg-fill ${WALLPAPER}
			openbox
		;;

		spectrwm)
			loadXresources "Xresources-urxvt-alpha"
			feh --bg-fill ${WALLPAPER}
			spectrwm
		;;

		fluxbox) fluxbox ;;
		blackbox) blackbox ;;
		dwm) dwm ;;
		ratpoison)
			loadXresources "Xresources-urxvt-i3"
			ratpoison
		;;
	esac
}

for i in ${@}; do
	case "$i" in
		i3) all_wm i3 ; break ;;
		dwm) all_wm dwm ; break ;;
		fvwm|fvwm2) all_wm fvwm2 ; break ;;
		xfce) xfce4-session ; break ;;
		gnome) loadXresources "Xresources-urxvt-i3" ; gnome-session ; break ;;
		wmaker) wmaker ; break ;;
		mate) mate-session ; break ;;
		cinnamon) cinnamon-session ; break  ;;
		en) enlightenment_start ; break ;;
		spectrwm) all_wm spectrwm ; break ;;
		#cde) /usr/dt/bin/dtcm ;;
		ratpoison) all_wm ratpoison ; break ;;
	esac
done

unset WALLPAPER CFGROOT
unset -f all_wm loadXresources 
