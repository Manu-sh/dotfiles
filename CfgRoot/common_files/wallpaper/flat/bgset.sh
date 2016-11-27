BGDIR=/home/user/Immagini/vaporwawe_wall/flat

# feh --bg-scale $BGDIR/${C}.*

shopt -s direxpand

if [ -e "$BGDIR/00.*" ]; then
	echo found
fi
