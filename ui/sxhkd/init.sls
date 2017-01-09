# Standard install a package and copy over the config file
# All the interesting stuff here will be in sxhkdrc which honestly should be
# git'd or something

{% set sxhkd = {
  'Arch': 'sxhkd',
  'Gentoo': 'x11-misc/sxhkd',
}.get(grains.os_family) %}

sxhkd:
  pkg.installed:
    - name: {{ sxhkd }}

{{ pillar.get('data_dir') }}/.config/sxhkd:
  file.directory:
    - user: {{ pillar.get('primary_user') }}
    - group: {{ pillar.get('primary_user') }}
    - dir_mode: 755
    - makedirs: true

{{ pillar.get('data_dir') }}/.config/sxhkd/sxhkdrc:
  file.managed:
    - source: salt://ui/sxhkd/sxhkdrc
    - user: {{ pillar.get('primary_user') }}
    - group: {{ pillar.get('primary_user') }}
    - mode: 755
    - require:
      - file: {{ pillar.get('data_dir') }}/.config/sxhkd
