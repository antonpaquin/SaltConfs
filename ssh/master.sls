# The leader of the raspis. I might want to make this generate and push ssh
# keys, definitely don't want to stick the master key on BR

{% set ssh = {
  'Arch': 'openssh',
  'Gentoo': 'net-misc/openssh',
}.get(grains.os_family) %}

openssh:
  pkg.installed:
    - name: {{ ssh }}

# Manage key / config stuff
{{ pillar.get('data_dir') + '/.ssh'}}:
  file.directory:
    - user: {{ pillar.get('primary_user') }}
    - group: {{ pillar.get('primary_user') }}
    - dir_mode: 755
    - makedirs: True
    - require:
      - test: built_home

{{ pillar.get('data_dir') + '/.ssh/hosts.d'}}:
  file.directory:
    - user: {{ pillar.get('primary_user') }}
    - group: {{ pillar.get('primary_user') }}
    - dir_mode: 755
    - makedirs: True

{{ pillar.get('data_dir') + '/.ssh/config' }}:
  file.managed:
    - source: salt://ssh/config
    - user: {{ pillar.get('primary_user') }}
    - group: {{ pillar.get('primary_user') }}
    - mode: 644
    - require:
      - file: {{ pillar.get('data_dir') + '/.ssh' }}

# Root needs a copy too, for sshfs to work
/root/.ssh:
  file.directory:
    - user: root
    - group: root
    - dir_mode: 755
    - makedirs: True

/root/.ssh/hosts.d:
  file.directory:
    - user: root
    - group: root
    - dir_mode: 755
    - makedirs: True

/root/.ssh/config:
  file.managed:
    - source: salt://ssh/config
    - user: root
    - group: root
    - mode: 644
    - require:
      - file: /root/.ssh
