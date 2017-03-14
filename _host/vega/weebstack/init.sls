# Hoo boy, the weebstack. Various services cobbled together, hopefully.

include:
  # Vegarails is still doing things, I think
  - dev.rails

  # Serve things
  - prog.apache

  # Most of my media consumption happens via plex
  - _host.vega.plex

# Link, for apache to point to Vegarails' dev dir.
/var/www/html/Vegarails:
  file.symlink:
    - target: {{pillar.get('server_dir')}}/Vegarails/
    - makedirs: True
    - require:
      - pkg: apache2

# Create Vegarails main file
{{pillar.get('server_dir')}}/Vegarails:
  file.directory:
    - dir_mode: 777
    - makedirs: True
    - require:
      - mount: /home/pi/drive
# TODO: sync this with the git remote branch

# Some torrent management dirs
{{pillar.get('torrents_dir')}}/Anime-bot:
  file.directory:
    - dir_mode: 777
    - makedirs: True
    - require:
      - mount: /home/pi/drive

# I don't even know if half of these are used anymore.
{% for subdir in ['complete', 'incomplete', 'watch'] %}
{{pillar.get('torrents_dir') + '/Anime-bot/' +  subdir}}:
  file.directory:
    - dir_mode: 777
    - makedirs: True
    - require:
      - mount: /home/pi/drive
{% endfor %}

# Apparently, these two files rename things that HorribleSubs names differently
# from how I have it in plex.
# However, they do so with some sort of unholy double-escaped sed / grep magic.
# I foresee having to use this on the next Monogatari season, and am dreading
# the mindfuck that is to come.
# Also, they're not in my crontab right now, so I'm not even sure if it's still
# running.
/home/pi/drive/torrents/Anime-bot/sort.conf:
  file.managed:
    - source: salt://_host/vega/weebstack/sort.conf
    - mode: 777
    - require:
      - file: {{pillar.get('torrents_dir')}}/Anime-bot

# See above
/home/pi/drive/torrents/Anime-bot/sort.sh:
  file.managed:
    - source: salt://_host/vega/weebstack/sort.sh
    - mode: 777
    - require:
      - file: {{pillar.get('torrents_dir')}}/Anime-bot
