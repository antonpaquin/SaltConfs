# Make sure that plex is installed, running, and has storage files.

# The plex package is usually pretty reliable. Might require adding non-free
# libraries from a fresh install.
plexmediaserver:
  pkg.installed: []
  service.running:
    - require:
      - pkg: plexmediaserver

# Create the media storage dirs.
{% for subdir in ['Anime', 'Anime - Movies', 'Music'] %}
{{pillar.get('plex_media_dir') + '/' + subdir}}:
  file.directory:
    - dir_mode: 777
    - makedirs: True
    - require:
      - mount: /home/pi/drive
{% endfor %}
