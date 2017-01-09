# I don't use IRC much, but when I do it's nice to have a client

{% set hexchat = {
  'Arch': 'hexchat',
  'Gentoo': 'net-irc/hexchat',
}.get(grains.os_family) %}

hexchat:
  pkg.installed:
    - name: {{ hexchat }}
