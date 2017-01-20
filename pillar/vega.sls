# Vega stores things in these data dirs. Might be improved by making a "storage"
# var and then sticking these all as subdirs of that

primary_user: pi
data_dir: /home/{{ primary_user }}/drive

data_dir: /home/pi/drive
plex_media_dir: /home/pi/drive/Media
server_dir: /home/pi/drive/server
torrents_dir: /home/pi/drive/torrents
ftp_dir: /home/pi/drive/ftp
