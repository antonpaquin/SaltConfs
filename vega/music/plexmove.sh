SRC="/home/pi/drive/torrents/What/$1"
DEST="/home/pi/drive/Media/Music/$2 - $3"
mv -i "$SRC" "$DEST" &&
ln -s "$DEST" "$SRC"

