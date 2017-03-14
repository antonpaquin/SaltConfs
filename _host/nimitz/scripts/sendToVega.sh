for f in "$@"
do
  ESCAPED_PATH=$(echo "$f" | sed 's/\ /\\ /g')
  ESCAPED_PATH=$(echo "$ESCAPED_PATH" | sed -e 's/(/\\(/g')
  ESCAPED_PATH=$(echo "$ESCAPED_PATH" | sed -e 's/)/\\)/g')
  scp "$f" "vega:/home/pi/drive/ftp/music/$ESCAPED_PATH"
done
