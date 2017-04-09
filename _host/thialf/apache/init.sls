# Include the projects dir

/etc/apache2/projects:
  file.directory:
    - user: {{ pillar.get('primary_user') }}
    - group: {{ pillar.get('primary_user') }}
    - dir_mode: 777
    - require:
      - pkg: apache2

/home/hacker/apache/config_template:
  file.managed:
    - source: salt://_host/thialf/apache/config_template
    - user: root
    - group: root
    - mode: 644
    - makedirs: True

/home/hacker/apache/apacheconf.py:
  file.managed:
    - source: salt://_host/thialf/apache/apacheconf.py
    - user: root
    - group: root
    - mode: 644
    - makedirs: True
    - require:
      - pkg: python

# Fun fact, to get to the end program a packet goes:
  # Through Kattegat
  # Through modProxy on BlueRidge
  # Through modProxy again on Thialf
  # Through whatever voodoo docker does
  # Through apache in the container
  # To whatever the last level program is.
  # #I'm behind 7 proxies, can't touch this
