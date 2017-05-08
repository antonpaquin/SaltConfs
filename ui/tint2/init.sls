{% set tint2 = {
  'Gentoo': 'x11-misc/tint2'
}.get(grains.os_family) %}

tint2:
  pkg.installed:
    - name: {{ tint2 }}

# Config file
{{ pillar.get('data_dir') }}/.config/tint2/tint2rc:
  file.managed:
    - source: salt://ui/tint2/tint2rc
    - user: {{ pillar.get('primary_user') }}
    - group: {{ pillar.get('primary_user') }}
    - mode: 755
    - makedirs: true
    - require:
      - file: {{ pillar.get('data_dir') }}/.config/tint2rc
