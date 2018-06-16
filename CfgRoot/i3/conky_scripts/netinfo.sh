isValidStr() {
	[ "$(sed -u 's/^[ \t]*//;/^$/d'<<<"${1}"|wc -l)" != 0 ] && echo "$1" || return 1
}

netinfo() {
	local buf="$(ip route list table 0)"
	case $1 in
		gateway) isValidStr "$(awk '/default via .* dev/{ print $3; exit }'<<<"${buf}")" ;;
		iface) isValidStr "$(awk '/default via .* dev/{ print $5; exit }'<<<"${buf}")" ;;
		ap) isValidStr "$(iw dev "$(netinfo "iface")" link 2>/dev/null|grep SSID|cut -d " " -f 2-)" ;;
		default) return 1 ;;
	esac
}

case $1 in
	ap)
		if AP=$(netinfo "ap"); then
			echo -e "\Uf012 $AP"
		else
			echo -e "\Uf012 ethernet"
		fi
	;;

	gateway)
		if IP=$(netinfo "gateway"); then
			echo "$IP"
		else
			echo -e "\Uf012 ip not found"
		fi
	;;

	iface)
		if IFACE=$(netinfo "iface"); then
			echo "$IFACE"
		else
			echo "$IFACE"
		fi
	;;

	polybar)
		echo "$(netinfo "ap") $(netinfo "gateway")"
	;;
esac
