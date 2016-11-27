CFGROOT=$HOME/dotfiles/CfgRoot

bash $CFGROOT/Xresources/Xresources-load.sh
setxkbmap it

WALLWM=$HOME/Immagini/vaporwawe_wall/flat/00.png 

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
	compton -b
	feh --bg-fill ${WALLWM}
	case $1 in
		i3) i3 ;;
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

#pantheon_de
#cinnamon-session
#mate-session

all_wm i3

unset WALLWM CFGROOT
unset -f all_wm pantheon_de

