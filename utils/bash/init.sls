{{ pillar.get('data_dir') }}/.bashrc:
  file.managed:
    - source: salt://utils/bash/bashrc
    - user: {{ pillar.get('primary_user') }}
    - group: {{ pillar.get('primary_user') }}
    - mode: 755
    - require:
      - test: built_home

{{ pillar.get('data_dir') }}/.bashrc.d:
  file.directory:
    - user: {{ pillar.get('primary_user') }}
    - group: {{ pillar.get('primary_user') }}
    - dir_mode: 755
    - require:
      - test: built_home

{{ pillar.get('data_dir') }}/.bashrc.d/alias.rc:
  file.managed:
    - source: salt://utils/bash/alias.rc
    - user: {{ pillar.get('primary_user') }}
    - group: {{ pillar.get('primary_user') }}
    - dir_mode: 755
    - require:
      - file: {{ pillar.get('data_dir') }}/.bashrc.d
    
