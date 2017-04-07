CFGROOT=$HOME/dotfiles/CfgRoot
WALLPAPER=$HOME/Immagini/385.jpg
bash $CFGROOT/Xresources/Xresources-load.sh "alpha"

setxkbmap it


pantheon_de() {
	gsettings-data-convert &
	xdg-user-dirs-gtk-update &
	/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
	/usr/lib/gnome-settings-daemon/gnome-settings-daemon &
	/usr/lib/gnome-user-share/gnome-user-share &
	eval $(gnome-keyring-daemon --start --components=pkcs11,secrets,ssh,gpg)
	export GNOME_KEYRING_CONTROL GNOME_KEYRING_PID GPG_AGENT_INFO SSH_AUTH_SOCK
	exec cerbere
}


all_wm() {
	dunst &
#	conky
	mpd ~/.mpd/mpd.conf
	case $1 in
		i3)
			bash $CFGROOT/Xresources/Xresources-load.sh "i3"
			compton -b
			feh --bg-fill ${WALLPAPER}
			i3
		;;
		fvwm2) fvwm2 ;;
		dwm) dwm ;;
		openbox)
			feh --bg-fill ${WALLPAPER}
			openbox
		;;
		fluxbox) fluxbox ;;
		blackbox) blackbox ;;
	esac
}


#pekwm
#icewm
#twin
#cde
#jwm
#lwm

#cinnamon-session
#mate-session
#startlxde
#wmaker
#fvwm-crystal

#all_wm i3
#all_wm fvwm2
#gnome-session
#xfce4-session
#dwm

for i in ${@}; do
	case "$i" in
		i3) all_wm i3 ; break ;;
		dwm) all_wm dwm ; break ;;
		fvwm|fvwm2) all_wm fvwm2 ; break ;;
		xfce) xfce4-session ; break ;;
		gnome) gnome-session ; break ;;
		wmaker) wmaker ; break ;;
		mate) mate-session ; break ;;
		cinnamon) cinnamon-session ; break  ;;
	esac
done

unset WALLPAPER CFGROOT
unset -f all_wm pantheon_de
