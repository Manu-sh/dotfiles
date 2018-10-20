CFGROOT=$HOME/dotfiles/CfgRoot
WALLPAPER=$HOME/Immagini/IR-11.jpg

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
			#compton -b
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
			# LD_PRELOAD=/usr/lib/libswmhack.so -qof

			mpd ~/.mpd/mpd.conf
			# loadXresources "Xresources-urxvt-gruvbox"
			loadXresources "Xresources-urxvt-bored"
			feh --bg-fill ${WALLPAPER}

			# gifview --animate --new-window root --no-interactive /home/user/Immagini/1703252125599569.gif
			#compton -b
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
		xfce) 
			loadXresources "Xresources-urxvt-gruvbox";
			xfce4-session
		;;


		gnome) loadXresources "Xresources-urxvt-gruvbox" ; gnome-session ;;
		wmaker) wmaker ;;
		mate) mate-session ;;
		cinnamon) loadXresources "Xresources-urxvt-gruvbox"; cinnamon-session ;;
		en) enlightenment_start ;;
		spectrwm) all_wm spectrwm ;;
		#cde) /usr/dt/bin/dtcm ;;
		ratpoison) all_wm ratpoison ;;
		openbox) all_wm openbox ;;
		deepin) loadXresources "Xresources-urxvt-gruvbox"; startdde ;;
		kde) loadXresources "Xresources-urxvt-alpha" ; startkde ;;
		budgie) 
			loadXresources "Xresources-urxvt-gruvbox"; 
			export XDG_CURRENT_DESKTOP=Budgie:GNOME;
			budgie-desktop
		;;
	esac
done

unset WALLPAPER CFGROOT
unset -f all_wm loadXresources 
