# Motd / the login message.
/etc/motd:
  file.managed:
    - source: salt://blueridge/motd/motd
    - user: root
    - group: root
    - mode: 666
