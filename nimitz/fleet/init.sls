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
  mount.mounted:
    - device: {{ machine }}:/home/pi
    - opts:
      - rw
      - reconnect
      - follow_symlinks
    - mkmnt: true
    - fstype: fuse.sshfs
    - require:
      - pkg: sshfs
      - file: /root/.ssh/hosts.d/{{ machine }}
      - sls: ssh.master

{{ pillar.get('data_dir') }}/.ssh/hosts.d/{{ machine }}:
  file.managed:
    - source: salt://nimitz/fleet/{{ machine }}
    - user: {{ pillar.get('primary_user') }}
    - group: {{ pillar.get('primary_user') }}
    - mode: 755
    - require:
      - file: {{pillar.get('data_dir') + '/.ssh/hosts.d' }}

/root/.ssh/hosts.d/{{ machine }}:
  file.managed:
    - source: salt://nimitz/fleet/{{ machine }}
    - user: root
    - group: root
    - mode: 755
    - require:
      - file: /root/.ssh/hosts.d
{% endfor %}
