# Feh does image displays, but more interestingly does backgrounds.

{% set feh = {
  'Arch': 'feh',
  'Gentoo': 'media-gfx/feh',
}.get(grains.os_family) %}

{% set bgfile = 'mountains_blue.jpg' %}

feh:
  pkg.installed:
    - name: {{ feh }}

#Todo: put the background file somewhere useful, turn it on with fehbg
{{ pillar.get('data_dir') }}/.config/backgrounds:
  file.directory:
    - name: {{ pillar.get('data_dir') }}/.config/backgrounds
    - user: {{ pillar.get('primary_user') }}
    - group: {{ pillar.get('primary_user') }}
    - dir_mode: 755
    - require:
      - test: built_home

# The actual image file. Not sure to what degree I should manage this
{{ pillar.get('data_dir') }}/.config/backgrounds/{{bgfile}}:
  file.managed:
    - name: {{ pillar.get('data_dir') }}/.config/backgrounds/{{bgfile}}
    - source: salt://ui/feh/{{bgfile}}
    - user: {{ pillar.get('primary_user') }}
    - group: {{ pillar.get('primary_user') }}
    - mode: 666
    - require:
      - file: {{ pillar.get('data_dir') }}/.config/backgrounds

# Creates symlinks that are pointed to by other salt files.
# I think this is a decent way of organizing things
{{ pillar.get('data_dir') }}/.config/backgrounds/fehbg:
  file.symlink:
    - name: {{ pillar.get('data_dir') }}/.config/backgrounds/fehbg
    - target: {{ pillar.get('data_dir') }}/.config/backgrounds/{{bgfile}}
    - user: {{ pillar.get('primary_user') }}
    - group: {{ pillar.get('primary_user') }}
    - mode: 666
    - require:
      - file: {{ pillar.get('data_dir') }}/.config/backgrounds

{{ pillar.get('data_dir') }}/.config/backgrounds/lightdm_bg:
  file.symlink:
    - name: {{ pillar.get('data_dir') }}/.config/backgrounds/lightdm_bg
    - target: {{ pillar.get('data_dir') }}/.config/backgrounds/{{bgfile}}
    - user: {{ pillar.get('primary_user') }}
    - group: {{ pillar.get('primary_user') }}
    - mode: 666
    - require:
      - file: {{ pillar.get('data_dir') }}/.config/backgrounds
