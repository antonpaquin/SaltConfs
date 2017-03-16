/home/hacker/docker/dockerfile:
  file.managed:
    - source: salt://_host/thialf/docker/dockerfile
    - user: root
    - group: root
    - mode: 644
    - makedirs: True
    - require:
      - user: hacker

/home/hacker/docker/apt-sources:
  file.managed:
    - source: salt://_host/thialf/docker/apt-sources
    - user: root
    - group: root
    - mode: 644
    - makedirs: True
    - require:
      - user: hacker

/home/hacker/docker/build.sh:
  file.managed:
    - source: salt://_host/thialf/docker/build.sh
    - user: root
    - group: root
    - mode: 744
    - makedirs: True
    - require:
      - user: hacker
