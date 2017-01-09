TDIR="$2 - $3"
mkdir "$TDIR"
unzip "$1" -d "$TDIR"
MDIR=$(echo "$1" | rev | cut -c 5- | rev)
mv "$TDIR/$MDIR"/* "$TDIR"
rm -r "$TDIR/$MDIR"
rm "$1"
mv "$TDIR" "/home/pi/drive/Media/Music/$TDIR"
