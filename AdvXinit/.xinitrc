CFGROOT=$HOME/dotfiles/CfgRoot
WALLPAPER=$HOME/Immagini/wallpaper/wallpaper_15.jpg

loadXresources() {
	local xresources="$CFGROOT/Xresources"
	xrdb "${xresources}/${1}"
}

setxkbmap it

all_wm() {
	dunst &
#	conky
#	mpd ~/.mpd/mpd.conf
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
			#loadXresources "Xresources-urxvt-alpha"
			#loadXresources "Xresources-urxvt-term80-green"
			#loadXresources "Xresources-urxvt-new"
			#loadXresources "Xresources-urxvt-term80-ibm-white"
			loadXresources "Xresources-urxvt-gruvbox"
			feh --bg-fill ${WALLPAPER}
			spectrwm
			#xfce4-panel
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
		i3) all_wm i3 ;;
		dwm) all_wm dwm ;;
		fvwm|fvwm2) all_wm fvwm2 ;;
		xfce) xfce4-session ;;
		gnome) loadXresources "Xresources-urxvt-term80-ibm-white" ; gnome-session ;;
		wmaker) wmaker ;;
		mate) mate-session ;;
		cinnamon) cinnamon-session ;;
		en) enlightenment_start ;;
		spectrwm) all_wm spectrwm ;;
		#cde) /usr/dt/bin/dtcm ;;
		ratpoison) all_wm ratpoison ;;
		openbox) all_wm openbox ;;
		kde) loadXresources "Xresources-urxvt-alpha" ; startkde ;;
	esac
done

unset WALLPAPER CFGROOT
unset -f all_wm loadXresources 
