# Pycharm (and all of jetbrains) is a bit convoluted.
# 1. Java apps won't run unless wmname is set to something weird ("LG3D")
# 2. It likes oracle java only
# 3. It has a hard time finding the JVM
# So lots needs to be done to help it out.

include:
  - utils.wmname
  - utils.bash

{% set pycharm = {
  'Gentoo': 'dev-util/pycharm-community'
}.get(grains.os_family) %}

pycharm:
  pkg.installed:
    - name: {{ pycharm }}
    - require:
      - pkg: oraclejava

{{ pillar.get('data_dir') }}/.bashrc.d/pycharm.rc:
  file.managed:
    - source: salt://dev/jetbrains/pycharm/pycharm.rc
    - user: {{ pillar.get('primary_user') }}
    - group: {{ pillar.get('primary_user') }}
    - mode: 777
    - require:
      - file: {{ pillar.get('data_dir') }}/.bashrc.d
