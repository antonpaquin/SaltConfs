{% set networkmanager = {
  'Gentoo': 'net-misc/networkmanager'
}.get(grains.os_family) %}

{% set networkmanager_applet = {
  'Gentoo': 'gnome-extra/nm-applet'
}.get(grains.os_family) %}

networkmanager:
  pkg.installed:
    - name: {{ networkmanager }}

networkmanager-applet:
  pkg.installed:
    - name: {{ networkmanager_applet }}
    - require:
      - pkg: networkmanager
