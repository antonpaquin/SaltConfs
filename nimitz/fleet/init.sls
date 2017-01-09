# This should mount (argo/vega/blueridge):/home/pi to relevant dirs in nimitz:/home/anton/Fleet
include:
  - ssh.master

{% set machines = ['argo', 'vega', 'blueridge'] %}

{% set sshfs = {
  'Arch': 'sshfs',
  'Gentoo': 'net-fs/sshfs',
}.get(grains.os_family) %}

sshfs:
  pkg.installed:
    - name: {{ sshfs }}
    - require:
        - pkg: openssh

{% for machine in machines %}
{{ pillar.get('data_dir') + '/Fleet/' + machine }}:
  file.directory:
    - user: {{ pillar.get('primary_user') }}
    - group: {{ pillar.get('primary_user') }}
    - dir_mode: 770
    - makedirs: True
    - require:
      - test: built_home

  mount.mounted:
    - device: {{ machine }}:/home/pi
    - opts:
      - rw
      - reconnect
      - follow_symlinks
    - makemnt: true
    - fstype: fuse
    - require:
      - pkg: sshfs
      - file: {{ pillar.get('data_dir') + '/Fleet/' + machine }}

{{ pillar.get('data_dir') + '/.ssh/hosts.d/' + machine }}:
  file.managed:
    - source: salt://nimitz/fleet/{{ machine }}
    - user: {{ pillar.get('primary_user') }}
    - group: {{ pillar.get('primary_user') }}
    - mode: 755
    - require:
      - file: {{pillar.get('data_dir') + '/.ssh/hosts.d' }}
{% endfor %}
