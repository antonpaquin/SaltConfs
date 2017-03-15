dpkg-dev:
  pkg.installed: []

/usr/local/deb:
  file.directory:
    - user: root
    - group: root
    - dir_mode: 755
    - makedirs: True
    - require:
      - pkg: dpkg-dev

{% set localpkgs = [
  'maven',
  'postgresql-9.5'
]%}

/usr/local/deb/apt-sync.sh:
  file.managed:
    - source: salt://_host/thialf/repository/apt-sync.sh
    - user: root
    - group: root
    - mode: 744
    - template: jinja
    - context:
        pkgs: {{ localpkgs | json() }}
