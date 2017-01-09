# My music downloading / organizing infrastructure. Depends on plex and deluge,
# creates the music-related dirstructure, and drops in a few scripts that make
# music downloading easy.
# TODO: make an interface for those scripts in Vegarails, so there's no ssh
# involved in a music add

# Download and serve music
include:
  - prog.deluge
  - vega.plex

# Torrents target dir
{{pillar.get('torrents_dir')}}/What:
  file.directory:
    - dir_mode: 777
    - makedirs: True
    - require:
      - mount: /home/pi/drive

# Ftp transfer dir (mainly for Nimitz -> Vega transfers)
{{pillar.get('ftp_dir')}}/music:
  file.directory:
    - dir_mode: 777
    - makedirs: True
    - require:
      - mount: /home/pi/drive

# Required for conversions, if What gives a flac and I want a v0
flac:
  pkg.installed

# What torrents are uncompressed, plexmove puts it in my music dir and creates a
# link for deluge to look at
/home/pi/drive/torrents/What/plexmove.sh:
  file.managed:
    - source: salt://vega/music/plexmove.sh
    - mode: 777
    - require:
      - file: {{pillar.get('torrents_dir')}}/What

# /mu/ sharethreads tend to use MEGA .zip's, this will unzip, rename, and store,
# without leaving a trailing symlink
/home/pi/drive/ftp/music/unzipToPlex.sh:
  file.managed:
    - source: salt://vega/music/unzipToPlex.sh
    - mode: 777
    - require:
      - file: {{pillar.get('ftp_dir')}}/music
