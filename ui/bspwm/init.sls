# Install and configure bspwm

{% set bspwm = {
  'Arch': 'bspwm',
  'Gentoo': 'x11-wm/bspwm',
}.get(grains.os_family) %}

# The package itself
bspwm:
  pkg.installed:
    - name: {{ bspwm }}

# Config dir
{{ pillar.get('data_dir') }}/.config/bspwm:
  file.directory:
    - user: {{ pillar.get('primary_user') }}
    - group: {{ pillar.get('primary_user') }}
    - dir_mode: 770
    - require:
      - test: built_home

# Config file
{{ pillar.get('data_dir') }}/.config/bspwm/bspwmrc:
  file.managed:
    - source: salt://ui/bspwm/bspwmrc
    - user: {{ pillar.get('primary_user') }}
    - group: {{ pillar.get('primary_user') }}
    - mode: 755
    - require:
      - file: {{ pillar.get('data_dir') }}/.config/bspwm

# Set config_home in bash
{{ pillar.get('data_dir') }}/.bashrc.d/bspwm.rc:
  file.managed:
    - source: salt://ui/bspwm/bspwm.rc
    - user: {{ pillar.get('primary_user') }}
    - group: {{ pillar.get('primary_user') }}
    - mode: 755
    - require:
      - file: {{ pillar.get('data_dir') }}/.bashrc.d
