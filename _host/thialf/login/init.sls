include:
  - _host.thialf.login.hacker
  - dev.python

/home/hacker/directory.py:
  file.managed:
    - source: salt://_host/thialf/login/directory.py
    - user: root
    - group: root
    - mode: 755
    - makedirs: True
    - require:
      - pkg: python

/home/hacker/console.sh:
  file.managed:
    - source: salt://_host/thialf/login/console.sh
    - user: root
    - group: root
    - mode: 744
    - makedirs: True

/home/hacker/login.sh:
  file.managed:
    - source: salt://_host/thialf/login/login.sh
    - user: root
    - group: root
    - mode: 755
    - makedirs: True

/etc/sudoers:
  file.append:
    - text: hacker ALL=(ALL) NOPASSWD:/home/hacker/login.sh

jinja2:
  pip.installed: []
