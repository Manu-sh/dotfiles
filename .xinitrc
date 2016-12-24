CFGROOT=$HOME/dotfiles/CfgRoot
ROOTBG=$HOME/Immagini/wallpaper

bash $CFGROOT/Xresources/Xresources-load.sh
setxkbmap it

WALLWM=$ROOTBG/favorite/08.jpg

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

	feh --bg-fill ${WALLWM}
	mpd ~/.mpd/mpd.conf
	dunst &
	# conky
	case $1 in
		i3)	i3
			compton -b
		;;
		dwm) dwm ;;
		openbox) openbox ;;
		fluxbox) fluxbox ;;
		blackbox) blackbox ;;
		fvwm2) fvwm2 ;;
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

#pantheon_de
#cinnamon-session
#mate-session

#all_wm dwm
all_wm i3
#all_wm fvwm2

unset WALLWM CFGROOT
unset -f all_wm pantheon_de

