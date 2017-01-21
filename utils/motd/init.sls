# Motd / the login message.
/etc/motd:
  file.managed:
    - source: salt://utils/motd/{{ pillar.get('machine') }}
    - user: root
    - group: root
    - mode: 666
