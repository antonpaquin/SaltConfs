# Apparently required by some java apps,
# All this does is make java play nice with odd window managers

include:
  - utils.bash

{% set wmname = {
  'Gentoo': 'x11-misc/wmname'
}.get(grains.os_family) %}

wmname:
  pkg.installed:
    - name: {{ wmname }}

{{ pillar.get('data_dir') /.bashrc.d/wmname.rc:
  file.managed:
    - source: salt://utils/wmname/wmname.rc
    - user: {{ pillar.get('primary_user') }}
    - group: {{ pillar.get('primary_user') }}
    - mode: 777
    - require:
      - file: {{ pillar.get('data_dir')}}/.bashrc.d
